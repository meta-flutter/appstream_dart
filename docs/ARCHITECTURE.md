# Architecture

This document describes the high-level architecture of the `appstream` project.

## Overview

`appstream` is a hybrid C++ and Dart system that parses AppStream XML data and writes normalized catalog data to SQLite.

- **C++23 core**: High-performance parsing and persistence.
- **Dart API**: Public developer-facing API and streaming interface.
- **FFI bridge**: Thin interface between Dart and native code.

## Layered Design

### 1) Dart API Layer

- File: `lib/appstream.dart`
- Responsibilities:
  - Public API surface for initialization and parsing.
  - Event stream orchestration for progress and result delivery.
  - Error shaping and fallback behavior.

### 2) Dart FFI Bindings Layer

- File: `lib/src/bindings.dart`
- Responsibilities:
  - Dynamic library loading.
  - Native function signatures and marshaling.
  - Minimal translation between Dart types and native pointers.

### 3) Native FFI Entry Layer

- Files: `src/appstream_ffi.cpp`, `include/appstream_ffi.h`, `src/dart_api_dl.c`
- Responsibilities:
  - Exported C ABI symbols consumed by Dart.
  - Runtime API bootstrap with Dart API DL.
  - Boundary-level error handling and argument validation.

### 4) Core Parsing and Data Pipeline

- Files: `src/AppStreamParser.cpp`, `src/XmlScanner.cpp`, `src/Component.cpp`, `src/StringPool.cpp`, `src/SqliteWriter.cpp`
- Responsibilities:
  - Streaming XML tokenization (`XmlScanner`).
  - Component extraction and normalization (`AppStreamParser`, `Component`).
  - String interning for memory efficiency (`StringPool`).
  - Batched SQLite writes with staging/finalization (`SqliteWriter`).

## Data Flow

1. Dart calls native parse entrypoint via FFI.
2. Native layer initializes parser and writer.
3. XML is scanned token-by-token (streaming style).
4. Parsed component records are normalized and sent to SQLite writer.
5. Writer batches inserts and finalizes output DB.
6. Native status/error information is surfaced back to Dart as events.

## Error Handling Model

- C++ internal parsing uses structured error types.
- FFI boundary converts native failures to stable error messages/codes.
- Dart layer emits user-consumable stream errors.
- Fallback behavior is used for isolate-related execution issues.

## Build and Test Topology

- **Build systems**: `CMakeLists.txt`, `Makefile`, `build.sh`.
- **C++ tests**: `tests/` (GoogleTest).
- **Dart tests**: `test/` (package:test).
- **Docs**: `docs/` for build, test, and audit references.

## Key Architectural Decisions

- **Streaming parse instead of DOM loading** to keep memory bounded on large AppStream datasets.
- **SQLite staging and batch writes** to improve throughput and reduce transaction overhead.
- **C ABI for FFI boundary** to keep interop stable and language-agnostic.
- **Separation of Dart API from native core** to preserve testability and maintainability.

## Extension Points

- Add new parsed fields by extending `Component` and parser field handlers.
- Add new persistence targets by introducing another sink implementation similar to `SqliteWriter`.
- Add additional parser diagnostics by expanding parse error metadata and Dart mapping.

