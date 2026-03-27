# AppStream Parser - Flathub Catalog to SQLite

A high-performance C++23 FFI bridge for parsing Flathub AppStream metadata into SQLite databases, with Dart bindings, a Drift ORM layer, and a Flutter example app.

## Quick Facts

- **Language**: C++23 (backend) + Dart (frontend) + C (Dart API)
- **Status**: Production-Ready (v0.2.0)
- **Tests**: 185/185 passing (140 C++ + 45 Dart)
- **Peak Memory**: ~22 MB (streaming parser with 256 KB sliding buffer)

## Features

### Core Capabilities
- **Streaming XML Parsing** - XmlScanner with fd-based sliding buffer (~256 KB resident) replaces mmap for minimal memory footprint
- **Streaming Pipeline** - XML to SQLite direct pipeline via ComponentSink interface
- **Drift ORM Layer** - Type-safe query API with 19 tables, FTS5 full-text search, icon URL resolution, category/language browsing, and metrics
- **String Interning** - Efficient memory usage with StringPool for categories and keywords
- **Multi-Language Support** - Language filtering at parse time (en, de, fr, es, ja, etc.)
- **Real Flathub Data** - Parses the full Flathub catalog (~4500 components in ~260 ms)

### CLI Tools
- **bin/main.dart** - Downloads, decompresses, and parses Flathub XML to SQLite with progress bars
- **bin/query.dart** - Interactive query tool: search, detail, categories, languages, releases, metrics

### Flutter Example
- **example/flathub_catalog/** - Full Flutter Linux desktop app modeled after flathub.org with setup/download/import screens, catalog browsing, search, and app detail views

### Infrastructure
- **Automated CI/CD** - GitHub Actions with 8+ configurations
- **Code Coverage** - gcov/lcov integration + Codecov
- **Memory Safety** - AddressSanitizer, UBSan support
- **Comprehensive Tests** - Unit + integration + real-world data tests

## Project Structure

```
appstream/
├── src/                          # C++ source
│   ├── AppStreamParser.cpp       # XML parsing state machine
│   ├── XmlScanner.cpp            # XML tokenizer (buffer + streaming fd modes)
│   ├── Component.cpp             # Component data model
│   ├── SqliteWriter.cpp          # Batched SQLite writer with staging
│   ├── StringPool.cpp            # String interning
│   ├── appstream_ffi.cpp         # Dart FFI bridge + DartNotifySink
│   └── dart_api_dl.c             # Dart API DL initialization
├── include/                      # C++ headers
├── lib/                          # Dart package
│   ├── appstream.dart            # Public API + exports
│   └── src/
│       ├── bindings.dart         # FFI bindings + library loading
│       └── database/
│           ├── database.dart     # CatalogDatabase (Drift ORM, queries)
│           ├── tables.dart       # 19 Drift table definitions
│           └── database.g.dart   # Generated Drift code
├── bin/                          # CLI tools
│   ├── main.dart                 # Fetch + parse CLI with progress bars
│   └── query.dart                # Database query CLI
├── example/
│   └── flathub_catalog/          # Flutter example app
│       ├── lib/
│       │   ├── main.dart         # App entry point
│       │   ├── services/         # CatalogService (download, import, query)
│       │   ├── screens/          # SetupScreen, CatalogScreen, DetailScreen
│       │   └── widgets/          # AppCard, AppIcon
│       └── linux/                # Linux desktop build (bundles libappstream.so)
├── test/                         # Dart tests
├── tests/                        # C++ tests (GoogleTest)
├── docs/                         # Documentation
├── Makefile                      # Shared library build
├── CMakeLists.txt                # Full build with tests
└── pubspec.yaml                  # Dart dependencies
```

## Quick Start

### Prerequisites
- C++23 compatible compiler (GCC 13+, Clang 17+)
- Dart SDK 3.4+
- SQLite3 development libraries
- Flutter SDK (for example app)

### Build the Native Library

```bash
make              # builds lib/libappstream.so
```

### Run the CLI

```bash
# Download Flathub catalog and parse to SQLite
dart run bin/main.dart

# Query the catalog
dart run bin/query.dart search firefox
dart run bin/query.dart detail org.mozilla.firefox
dart run bin/query.dart categories
dart run bin/query.dart metrics
```

### Run the Flutter Example

```bash
cd example/flathub_catalog
flutter pub get
flutter run -d linux
```

### Build & Test (Full)

```bash
# Default build with tests
cmake -S . -B build && cmake --build build
cd build && ctest

# With sanitizers
cmake -S . -B build -DENABLE_SANITIZER=asan
cmake --build build && cd build && ctest

# Dart tests
dart test
```

## Dart API Usage

```dart
import 'package:appstream/appstream.dart';

void main() async {
  // Initialize native library
  Appstream.initialize();

  // Parse XML to SQLite (streams progress events)
  await for (final event in Appstream.parseToSqlite(
    xmlPath: 'appstream.xml',
    dbPath: 'catalog.db',
  )) {
    switch (event) {
      case ComponentParsed(:final component):
        print('${component.id}: ${component.name}');
      case ParseDone(:final count):
        print('Done: $count components');
      case ParseFailed(:final message):
        print('Error: $message');
    }
  }

  // Query via Drift ORM
  final db = CatalogDatabase.open('catalog.db');
  final results = await db.searchComponents('firefox');
  final detail = await db.getComponentDetail('org.mozilla.firefox');
  final categories = await db.listCategories();
  final metrics = await db.getMetrics();
  await db.close();
}
```

## Architecture

### Data Flow

```
Flathub XML (gzipped)
    │ HTTP download + gzip stream decompress
    ▼
appstream.xml (on disk)
    │ open() + read() into 256 KB sliding buffer
    ▼
XmlScanner (pull parser, zero-copy string_views)
    │ START_ELEMENT / TEXT / END_ELEMENT events
    ▼
AppStreamParser (state machine)
    │ Component objects (moved, not copied)
    ▼
ComponentSink interface
    ├── DartNotifySink (posts id/name/summary to Dart port + delegates to writer)
    ├── SqliteWriter (batched inserts, staging file, atomic rename)
    └── InMemorySink (retains all components for in-memory queries)
    │
    ▼
catalog.db (SQLite with 19 tables + FTS5)
    │ Drift ORM
    ▼
CatalogDatabase (search, browse, detail, metrics)
```

### Streaming Parser (Low Memory)

The `parseToSink` path uses a 256 KB sliding buffer instead of mmap:
- XmlScanner reads from a file descriptor via `read()` syscalls
- Buffer compacts unconsumed data and refills when less than half remains
- All `string_view` results are consumed before the next refill
- Peak RSS: ~22 MB (vs ~64 MB with mmap) for the full Flathub catalog

### Database Schema

19 normalized tables with interned lookups:

| Table | Purpose |
|-------|---------|
| `components` | Core app metadata (id, type, name, summary, description, licenses, developer) |
| `categories` / `component_categories` | Interned category names + junction |
| `keywords` / `component_keywords` | Interned keyword names + junction |
| `component_urls` | URLs by type (homepage, bugtracker, donation, etc.) |
| `component_icons` | Icons by type (stock, cached, remote) with dimensions |
| `releases` / `release_issues` | Release versions, dates, descriptions, CVEs |
| `screenshots` / `screenshot_images` / `screenshot_videos` | Screenshot gallery |
| `content_rating_attrs` | OARS content ratings |
| `component_languages` | Supported languages |
| `branding_colors` | Light/dark scheme colors |
| `component_extends` / `component_suggests` / `component_relations` | Cross-references |
| `component_custom` | Custom key-value metadata |
| `components_fts` | FTS5 full-text search index |

## Performance

| Metric | Value |
|--------|-------|
| Full Flathub parse | ~260 ms (4522 components) |
| Peak memory (streaming) | ~22 MB |
| Database size | ~26 MB |
| FTS search | < 5 ms |

## Documentation

| Document | Purpose |
|----------|---------|
| `docs/ARCHITECTURE.md` | System architecture and design decisions |
| `docs/ADVANCED_BUILD.md` | Build configuration guide |
| `docs/RUNNING_TESTS.md` | Test execution and debugging |
| `docs/CODE_AUDIT_REPORT.md` | Security and code quality audit |

## License

Apache License 2.0 - See LICENSE file

## Contributors

- Joel Winarske (Creator & Maintainer)