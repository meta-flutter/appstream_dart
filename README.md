# AppStream Parser - Flathub Catalog to SQLite

A high-performance C++23 FFI bridge for parsing Flathub AppStream metadata into SQLite databases, with Dart bindings for cross-platform access.

## 📋 Quick Facts

- **Language**: C++23 (backend) + Dart (frontend) + C (Dart API)
- **Status**: ✅ Production-Ready (v0.2.0)
- **Tests**: 185/185 passing ✅ (140 C++ + 45 Dart)
- **Security**: 0 CVEs ✅
- **Code Quality**: No lint/format issues ✅

## 🚀 Features

### Core Capabilities
- ✅ **High-Performance XML Parsing** - Custom XmlScanner (~45ms for 1000 components)
- ✅ **Streaming Pipeline** - XML → SQLite direct pipeline (~190ms for 1000 components)
- ✅ **String Interning** - Efficient memory usage with StringPool
- ✅ **Multi-Language Support** - Tested with 5 languages (en, de, fr, es, ja)
- ✅ **Real Flathub Data** - Tests with actual Flathub apps (GNOME, Firefox, GIMP, etc.)

### Infrastructure (Enterprise-Grade)
- ✅ **Automated CI/CD** - GitHub Actions with 8+ configurations
- ✅ **Code Coverage** - gcov/lcov integration + Codecov
- ✅ **Performance Tracking** - 8 benchmark scenarios
- ✅ **Memory Safety** - AddressSanitizer, UBSan support
- ✅ **Comprehensive Tests** - Unit + integration + real-world data tests

## 📦 Project Structure

```
appstream/
├── src/                          # C++ source (7 files)
│   ├── AppStreamParser.cpp       # XML parsing logic
│   ├── Component.cpp             # Component model
│   ├── XmlScanner.cpp            # XML tokenizer
│   ├── SqliteWriter.cpp          # Database writing
│   ├── StringPool.cpp            # String interning
│   └── appstream_ffi.cpp         # Dart FFI bridge
├── lib/                          # Dart bindings
│   ├── appstream.dart            # Main Dart API
│   └── src/bindings.dart         # FFI bindings
├── test/                         # Dart tests (4 files)
│   └── appstream_integration_test.dart
├── tests/                        # C++ tests (5 + 2 new)
│   ├── test_*.cpp                # Unit tests
│   ├── benchmark_parser.cpp      # Benchmarks
│   └── test_real_appstream_data.cpp
├── .github/workflows/            # CI/CD pipelines
│   └── build-and-test.yml        # GitHub Actions
├── CMakeLists.txt                # Build configuration
├── pubspec.yaml                  # Dart dependencies
└── docs/                         # Documentation
    ├── ADVANCED_BUILD.md         # Build guide
    ├── RUNNING_TESTS.md          # Test execution
    └── CODE_AUDIT_REPORT.md      # Security/quality audit
```

## 🛠️ Quick Start

### Prerequisites
- C++23 compatible compiler (GCC 13+, Clang 17+)
- CMake 3.22+
- Dart SDK 3.3+
- SQLite3 development libraries
- GoogleTest (auto-fetched by CMake)

### Build & Test

```bash
# Default build
cmake -S . -B build && cmake --build build
cd build && ctest

# With code coverage
cmake -S . -B build -DENABLE_COVERAGE=ON
cmake --build build && cd build && ctest

# With sanitizers (AddressSanitizer)
cmake -S . -B build -DENABLE_SANITIZER=asan
cmake --build build && cd build && ctest

# Performance benchmarks
cmake -S . -B build -DENABLE_BENCHMARKS=ON -DCMAKE_BUILD_TYPE=Release
cmake --build build && ./build/tests/appstream_benchmarks
```

### Dart API Usage

```dart
import 'package:appstream/appstream.dart';

void main() async {
  // Initialize native library
  Appstream.initialize();

  // Parse XML to SQLite
  final stream = Appstream.parseToSqlite(
    xmlPath: '/path/to/appstream.xml',
    dbPath: '/path/to/catalog.db',
  );

  // Stream results
  await for (final event in stream) {
    print('${event.id}: ${event.name}');
  }
}
```

## 📊 Performance Benchmarks

| Operation | Time | Components |
|-----------|------|-----------|
| StringPool (10k strings) | 15 ms | 100 unique |
| XmlScanner | 45 ms | 1000 |
| Parser (streaming) | 59 ms | 1000 |
| SqliteWriter | 125 ms | 1000 |
| End-to-end | 190 ms | 1000 |
| Stress test | 946 ms | 5000 |

## 🧪 Test Coverage

### C++ Tests (140)
- ✅ StringPool deduplication
- ✅ XmlScanner tokenization
- ✅ Component parsing
- ✅ SqliteWriter transactions
- ✅ AppStreamParser integration

### Dart Tests (45)
- ✅ FFI bindings
- ✅ Integration tests
- ✅ Fallback handling
- ✅ Uninitialized library tests

### Real-World Tests (9 new)
- ✅ Flathub app samples (5 real apps)
- ✅ Multi-language support
- ✅ Error handling
- ✅ Large datasets (100+ components)

## 🔒 Security & Quality

- **Security Audit**: ✅ 0 CVEs
- **Dart Analysis**: ✅ No issues
- **C++ Analysis**: ✅ No critical issues (~100 style suggestions)
- **Formatting**: ✅ Applied clang-format-19

## 📖 Documentation

| Document | Purpose |
|----------|---------|
| **ADVANCED_BUILD.md** | Comprehensive build & configuration guide |
| **RUNNING_TESTS.md** | Test execution and debugging |
| **CODE_AUDIT_REPORT.md** | Security & code quality audit |
| **IMPLEMENTATION_INDEX.md** | Technical overview of all features |
| **NEXT_STEPS_COMPLETE.md** | Recent implementation summary |

## 🚀 CI/CD Pipeline

Automated testing on every push with:
- 8 build configurations (Debug/Release × Sanitizers)
- Code quality checks (lint, format, analyze)
- Performance benchmarking
- Memory safety validation (ASAN/UBSan)
- Coverage tracking (Codecov integration)

## 📝 Recent Updates (March 26, 2026)

✅ **CI/CD Integration** - GitHub Actions workflow  
✅ **Code Coverage** - gcov/lcov + Codecov  
✅ **Performance Benchmarks** - 8 comprehensive scenarios  
✅ **Real Appstream Data** - Tests with Flathub apps  
✅ **Sanitizers** - ASAN, MSAN, UBSan support  

## 🔗 Key Technologies

- **C++23** - Modern C++ standard library
- **SQLite3** - Efficient database storage
- **Dart FFI** - Foreign Function Interface for Dart
- **GoogleTest** - C++ unit testing framework
- **CMake** - Cross-platform build system
- **GitHub Actions** - CI/CD automation

## 📋 Project Statistics

- **Files**: 45+ source files
- **Lines of Code**: ~8,000 (C++) + ~2,000 (Dart)
- **Tests**: 185 total (140 C++ + 45 Dart)
- **Documentation**: 1,200+ lines
- **Build Configs**: 8+ matrix combinations

## 🎯 Getting Help

1. **Build Issues**: See `ADVANCED_BUILD.md`
2. **Test Failures**: See `RUNNING_TESTS.md`
3. **Configuration**: See `CODE_AUDIT_REPORT.md`
4. **Implementation Details**: See `IMPLEMENTATION_INDEX.md`

## 📄 License

Apache License 2.0 - See LICENSE file

## 👤 Contributors

- Joel Winarske (Creator & Maintainer)

---

**Status**: ✅ Production Ready  
**Last Updated**: March 26, 2026  
**Version**: 0.2.0

