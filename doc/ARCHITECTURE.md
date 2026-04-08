# Architecture

This document describes the high-level architecture of the `appstream` project.

## Overview

`appstream` is a hybrid C++ and Dart system that parses AppStream XML data and writes normalized catalog data to SQLite, with runtime multi-language support.

- **C++23 core**: High-performance parsing, translation capture, and persistence.
- **Dart API**: Public developer-facing API and streaming interface.
- **Drift ORM**: Type-safe database queries with FTS5 search and locale-aware lookups.
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
  - 20 typed table definitions matching the C++ schema.
  - Query methods: FTS5 search (with sanitization), component detail, category/language browsing, type filtering, recent releases, metrics.
  - Locale-aware queries: `getTranslation()`, `listComponentsLocalized()`, `componentsByTranslationLanguage()`, `listCategoriesForLanguage()`.
  - Icon URL resolution via SQL subquery (remote > cached with CDN fallback > stock).
  - Read-only access to databases created by the C++ parser.

### 3) Dart FFI Bindings Layer

- File: `lib/src/bindings.dart`
- Responsibilities:
  - Dynamic library loading (searches executable dir, CWD, script dir, LD_LIBRARY_PATH, system path).
  - Handles custom embedders where `Platform.script` may not be available.
  - Detailed error diagnostics on load failure.

### 4) Native FFI Entry Layer

- Files: `src/appstream_ffi.cpp`, `include/appstream_ffi.h`, `src/dart_api_dl.c`
- Responsibilities:
  - Exported C ABI symbols consumed by Dart.
  - `DartNotifySink`: wraps `SqliteWriter` and posts component events to a Dart port.
  - Only sends DONE to Dart when database finalization succeeds.

### 5) Core Parsing and Data Pipeline

- Files: `src/AppStreamParser.cpp`, `src/XmlScanner.cpp`, `src/Component.cpp`, `src/StringPool.cpp`, `src/SqliteWriter.cpp`
- Responsibilities:
  - Streaming XML tokenization (`XmlScanner`) with fd-based sliding buffer or static buffer modes.
  - Component extraction with translation capture (`AppStreamParser` state machine).
  - String interning for memory efficiency (`StringPool`).
  - Batched SQLite writes with `SQLITE_TRANSIENT` bindings, staging file, and atomic rename (`SqliteWriter`).

## Data Flow

```
AppStream XML (gzipped, ~7 MB)
    | HTTP streaming download + integrity check
    v
appstream.xml (decompressed, ~42 MB on disk)
    | open() fd
    v
XmlScanner (256 KB sliding buffer, read() syscalls)
    | pull parser: START_ELEMENT / TEXT / END_ELEMENT events
    | zero-copy string_views (valid until next event)
    v
AppStreamParser (state machine)
    | Component objects + FieldTranslation vectors
    | Language set filter: "" (defaults), "en,de", or "*" (all)
    v
ComponentSink interface
    |-- DartNotifySink  -> posts "id\tname\tsummary" to Dart port
    |                   -> delegates to SqliteWriter
    |-- SqliteWriter    -> SQLITE_TRANSIENT binds, batch commits, staging + rename
    '-- InMemorySink    -> retains in unordered_map (for in-memory queries)
    v
catalog.db (SQLite with 20 tables + FTS5 index)
    | Drift ORM with locale-aware queries
    v
CatalogDatabase
    |-- searchComponents (FTS5, sanitized input)
    |-- listComponentsLocalized (correlated subqueries, locale fallback)
    |-- componentsByTranslationLanguage (EXISTS filter)
    |-- getTranslation (full locale -> base language -> default)
    '-- getMetrics
```

## Multi-Language Translation System

### Parse-time capture

The C++ parser recognizes `xml:lang` attributes on translatable fields: `name`, `summary`, `description`, `developer_name`, and screenshot `caption`. Instead of discarding non-matching translations, it stores them in a `FieldTranslation` vector on each `Component`:

```cpp
struct FieldTranslation {
    std::string field;    // "name", "summary", "description", etc.
    std::string language; // "de", "fr", "pt-BR"
    std::string value;
};
```

The language parameter controls which translations to capture:
- `""` (empty): defaults only, no translations (backward compatible, smallest DB)
- `"en,de,fr"`: defaults + those specific languages
- `"*"`: all languages (~84K translation rows, 327+ languages)

### Storage

The `component_field_translations` table stores all captured translations:

```sql
CREATE TABLE component_field_translations (
    component_id TEXT NOT NULL,
    field TEXT NOT NULL,
    language TEXT NOT NULL,
    value TEXT NOT NULL,
    PRIMARY KEY (component_id, field, language)
) WITHOUT ROWID;
```

The main `components` table always stores the default (no `xml:lang`) values as fallback.

### Runtime selection

Queries use correlated subqueries with locale fallback:
1. Try the full locale (e.g., `pt-BR`)
2. Fall back to the base language (`pt`)
3. Fall back to the default value from the `components` table

The Flutter example app auto-detects the system locale and provides a global language picker that filters components to those with translations in the selected language.

## Streaming Parser Design

The `parseToSink` code path uses a 256 KB sliding buffer instead of memory-mapping the entire XML file:

1. `AppStreamParser::parseToSink()` opens the file with `open()` and creates a streaming `XmlScanner(fd)`.
2. `XmlScanner` maintains a 256 KB internal buffer. At the start of each `next()` call, `refillIfNeeded()` checks if less than half the buffer remains.
3. On refill: unconsumed data is `memmove`'d to the front, then `read()` fills the rest.
4. All `string_view` results from an event are consumed by the parser before the next `next()` call, so buffer compaction is safe.
5. Peak RSS: ~22 MB for a full catalog (~4500 components, vs ~64 MB with mmap).

The in-memory mode (`AppStreamParser::create()`) still uses mmap since it retains data for direct queries.

## Security Model

- **SQL injection**: All user-supplied values use parameterized bindings. FTS5 queries are sanitized by quoting each token.
- **URI scheme validation**: `launchUrl` calls only permit `http`/`https` schemes.
- **XML integrity**: Downloaded files are checked for valid AppStream XML headers before parsing.
- **Memory safety**: `SQLITE_TRANSIENT` for all string bindings. Numeric XML entities are validated against Unicode range (U+0000-U+10FFFF) with surrogate and NUL rejection; invalid references replaced with U+FFFD.
- **String lifetime**: `pending_end_name_` uses owning `std::string` (not `string_view`) to survive buffer compaction in streaming mode.

## Error Handling Model

- C++ internal parsing uses `std::expected<T, Error>` for structured error types.
- FFI boundary converts native failures to stable error messages/codes.
- `DartNotifySink::end()` only sends DONE to Dart when `writer_.end()` succeeds.
- Dart layer emits user-consumable stream errors (`ParseFailed` events).
- Library loading provides detailed diagnostics listing all searched paths and errors.

## Build and Test Topology

- **Native build**: `CMakeLists.txt`, driven automatically by `hook/build.dart` for Dart FFI consumers and by `scripts/test.sh` for the C++ test suite.
- **C++ tests**: `tests/` (GoogleTest).
- **Dart tests**: `test/` (package:test).
- **Flutter example**: `example/flathub_catalog/` (Linux desktop app).
- **Docs**: `docs/` for build, test, and audit references.

## Key Architectural Decisions

- **Streaming fd-based parse** instead of mmap to minimize memory footprint (~22 MB vs ~64 MB).
- **Sliding buffer with refill** instead of chunked re-parsing to maintain single-pass pull parser semantics.
- **SQLITE_TRANSIENT bindings** to eliminate use-after-free risk from string lifetime dependencies.
- **Translation table** for runtime locale selection instead of parse-time filtering (one parse, query in any language).
- **EXISTS subqueries** for language filtering to avoid duplicate rows from multi-field JOINs.
- **Correlated subqueries** for localized display names with locale priority fallback.
- **SQLite staging and batch writes** to improve throughput and reduce transaction overhead.
- **Atomic rename** of staging file for crash-safe database creation.
- **C ABI for FFI boundary** to keep interop stable and language-agnostic.
- **Drift ORM** for type-safe queries with FTS5 full-text search support.
- **Configurable icon CDN fallback** for cached icon URLs when `media_baseurl` is not set (via `iconBaseUrl` parameter).

## Extension Points

- Add new parsed fields by extending `Component` and parser field handlers.
- Add new persistence targets by introducing another `ComponentSink` implementation.
- Add new query methods to `CatalogDatabase` for additional access patterns.
- Add new translatable fields by handling their `xml:lang` in the parser and storing via `FieldTranslation`.
