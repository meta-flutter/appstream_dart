# Architecture

This document describes the high-level architecture of the `appstream` project.

## Overview

`appstream` is a hybrid C++ and Dart system that parses AppStream XML data and writes normalized catalog data to SQLite.

- **C++23 core**: High-performance parsing and persistence.
- **Dart API**: Public developer-facing API and streaming interface.
- **Drift ORM**: Type-safe database queries with FTS5 search.
- **FFI bridge**: Thin interface between Dart and native code.

## Layered Design

### 1) Dart API Layer

- File: `lib/appstream.dart`
- Responsibilities:
  - Public API surface for initialization and parsing.
  - Event stream orchestration for progress and result delivery.
  - Error shaping and fallback behavior.
  - Re-exports Drift database and table types.

### 2) Drift Database Layer

- Files: `lib/src/database/database.dart`, `lib/src/database/tables.dart`
- Responsibilities:
  - 19 typed table definitions matching the C++ schema.
  - Query methods: FTS5 search, component detail, category/language browsing, type filtering, recent releases, metrics.
  - Icon URL resolution via SQL subquery (remote > cached with CDN fallback > stock).
  - Read-only access to databases created by the C++ parser.

### 3) Dart FFI Bindings Layer

- File: `lib/src/bindings.dart`
- Responsibilities:
  - Dynamic library loading (searches executable dir, CWD, script dir, system path).
  - Native function signatures and marshaling.
  - Minimal translation between Dart types and native pointers.

### 4) Native FFI Entry Layer

- Files: `src/appstream_ffi.cpp`, `include/appstream_ffi.h`, `src/dart_api_dl.c`
- Responsibilities:
  - Exported C ABI symbols consumed by Dart.
  - `DartNotifySink`: wraps `SqliteWriter` and posts component events to a Dart port.
  - Runtime API bootstrap with Dart API DL.

### 5) Core Parsing and Data Pipeline

- Files: `src/AppStreamParser.cpp`, `src/XmlScanner.cpp`, `src/Component.cpp`, `src/StringPool.cpp`, `src/SqliteWriter.cpp`
- Responsibilities:
  - Streaming XML tokenization (`XmlScanner`) with fd-based sliding buffer or static buffer modes.
  - Component extraction and normalization (`AppStreamParser` state machine, `Component` data model).
  - String interning for memory efficiency (`StringPool`).
  - Batched SQLite writes with staging file and atomic rename (`SqliteWriter`).

## Data Flow

```
Flathub XML (gzipped, ~7 MB)
    │ HTTP streaming download
    ▼
appstream.xml (decompressed, ~42 MB on disk)
    │ open() fd
    ▼
XmlScanner (256 KB sliding buffer, read() syscalls)
    │ pull parser: START_ELEMENT / TEXT / END_ELEMENT events
    │ zero-copy string_views into buffer (valid until next event)
    ▼
AppStreamParser (state machine)
    │ Component objects (std::move'd to sink)
    ▼
ComponentSink interface
    ├── DartNotifySink  →  posts "id\tname\tsummary" to Dart port
    │                   →  delegates to SqliteWriter
    ├── SqliteWriter    →  prepared statements, batch commits, staging + rename
    └── InMemorySink    →  retains in unordered_map (for in-memory mode)
    ▼
catalog.db (SQLite, 19 tables + FTS5 index)
    │ Drift ORM
    ▼
CatalogDatabase (search, detail, browse, metrics)
```

## Streaming Parser Design

The `parseToSink` code path uses a sliding buffer instead of memory-mapping the entire XML file:

1. `AppStreamParser::parseToSink()` opens the file with `open()` and creates a streaming `XmlScanner(fd)`.
2. `XmlScanner` maintains a 256 KB internal buffer. At the start of each `next()` call, `refillIfNeeded()` checks if less than half the buffer remains.
3. On refill: unconsumed data is `memmove`'d to the front, then `read()` fills the rest.
4. All `string_view` results from an event are consumed by the parser before the next `next()` call, so buffer compaction is safe.
5. Peak RSS: ~22 MB for the full Flathub catalog (vs ~64 MB with mmap).

The in-memory mode (`AppStreamParser::create()`) still uses mmap since it retains data for direct queries.

## Error Handling Model

- C++ internal parsing uses `std::expected<T, Error>` for structured error types.
- FFI boundary converts native failures to stable error messages/codes.
- Dart layer emits user-consumable stream errors (`ParseFailed` events).
- Fallback behavior is used for isolate-related execution issues.

## Build and Test Topology

- **Native build**: `Makefile` (shared library), `CMakeLists.txt` (full build with tests).
- **C++ tests**: `tests/` (GoogleTest).
- **Dart tests**: `test/` (package:test).
- **Flutter example**: `example/flathub_catalog/` (Linux desktop app).
- **Docs**: `docs/` for build, test, and audit references.

## Key Architectural Decisions

- **Streaming fd-based parse** instead of mmap to minimize memory footprint (~22 MB vs ~64 MB).
- **Sliding buffer with refill** instead of chunked re-parsing to maintain single-pass pull parser semantics.
- **SQLite staging and batch writes** to improve throughput and reduce transaction overhead.
- **Atomic rename** of staging file for crash-safe database creation.
- **C ABI for FFI boundary** to keep interop stable and language-agnostic.
- **Drift ORM** for type-safe queries with FTS5 full-text search support.
- **Flathub CDN fallback** for cached icon URLs when `media_baseurl` is not set.
- **Separation of Dart API from native core** to preserve testability and maintainability.

## Extension Points

- Add new parsed fields by extending `Component` and parser field handlers.
- Add new persistence targets by introducing another `ComponentSink` implementation.
- Add new query methods to `CatalogDatabase` for additional access patterns.
- Add additional parser diagnostics by expanding parse error metadata and Dart mapping.