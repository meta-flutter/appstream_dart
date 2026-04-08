# Advanced Build & Test Configuration

## Table of Contents
1. [Code Coverage](#code-coverage)
2. [Sanitizers](#sanitizers)
3. [Performance Benchmarks](#performance-benchmarks)
4. [CI/CD Integration](#cicd-integration)
5. [Real Appstream Data Tests](#real-appstream-data-tests)

---

## Code Coverage

### Enable Coverage with gcov/lcov

```bash
# Configure with coverage enabled (Debug build)
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DENABLE_COVERAGE=ON

# Build
cmake --build build -j$(nproc)

# Run tests
cd build
ctest
```

### Generate Coverage Report

```bash
cd build

# Capture coverage data
lcov --directory . --capture --output-file coverage.info

# Remove system files and test code from coverage
lcov --remove coverage.info \
    '/usr/*' \
    '*/test/*' \
    '*/native_tests/*' \
    --output-file coverage.info

# Generate HTML report
genhtml coverage.info --output-directory coverage_report

# View report
open coverage_report/index.html
```

### Coverage with Different Sanitizers

```bash
# Coverage + AddressSanitizer
cmake -S . -B build-coverage-asan \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_COVERAGE=ON \
    -DENABLE_SANITIZER=asan

cmake --build build-coverage-asan -j$(nproc)
cd build-coverage-asan && ctest
```

---

## Sanitizers

### AddressSanitizer (ASAN)

Detects memory leaks, buffer overflows, use-after-free, etc.

```bash
cmake -S . -B build-asan \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_SANITIZER=asan

cmake --build build-asan -j$(nproc)
./build-asan/native_tests/appstream_tests
```

**Environment variables:**
```bash
ASAN_OPTIONS=halt_on_error=1:strict_string_checks=1 ./build-asan/native_tests/appstream_tests
```

### MemorySanitizer (MSAN)

Detects use of uninitialized memory (requires special Clang build).

```bash
cmake -S . -B build-msan \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_SANITIZER=msan

cmake --build build-msan -j$(nproc)
./build-msan/native_tests/appstream_tests
```

### UndefinedBehaviorSanitizer (UBSan)

Detects undefined behavior (signed overflow, misaligned access, etc.).

```bash
cmake -S . -B build-ubsan \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_SANITIZER=ubsan

cmake --build build-ubsan -j$(nproc)
./build-ubsan/native_tests/appstream_tests
```

### Combined Sanitizers

```bash
# ASAN + UBSan
export CFLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer"
export CXXFLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer"

cmake -S . -B build-combined \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_SANITIZER=asan

cmake --build build-combined -j$(nproc)
./build-combined/native_tests/appstream_tests
```

---

## Performance Benchmarks

### Build with Benchmarks

```bash
cmake -S . -B build-bench \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_BENCHMARKS=ON

cmake --build build-bench -j$(nproc)

# Run benchmarks
./build-bench/native_tests/appstream_benchmarks
```

### Benchmark Categories

The benchmark suite includes:

1. **StringPool Performance**
   - 10,000 string interning operations
   - Deduplication efficiency

2. **XmlScanner Performance**
   - Parse large XML documents (1000+ components)
   - Measure tag/attribute parsing rate

3. **AppStreamParser (Streaming Mode)**
   - Parse 1000 components end-to-end
   - Measure throughput

4. **AppStreamParser (In-Memory Mode)**
   - Parse and search operations
   - Index creation time

5. **SqliteWriter Performance**
   - Write 1000 components to SQLite
   - Database creation time

6. **End-to-End Benchmark**
   - XML → SQLite pipeline
   - Verify database size and integrity

7. **Stress Test**
   - Process 5000 components
   - Memory efficiency

8. **Component Creation**
   - Create and convert 10,000 components
   - Enum type conversions

### Example Benchmark Output

```
⏱️  StringPool: 10k string interner: 15.3 ms
⏱️  XmlScanner: Parse 1000 components: 45.2 ms
⏱️  AppStreamParser (streaming): Parse 1000 components: 58.7 ms
⏱️  AppStreamParser (in-memory): Parse and search: 42.1 ms
⏱️  SqliteWriter: Write 1000 components to SQLite: 125.3 ms
⏱️  End-to-end: Parse XML to SQLite (1000 components): 189.5 ms
   Database size: 2847392 bytes
⏱️  Stress test: 5000 components: 945.8 ms
   Final database size: 14236960 bytes
   Avg bytes/component: 2847
⏱️  StringPool: Memory deduplication: 152.1 ms
   Interned 10000 strings into 100 unique entries
⏱️  Component: Create and convert 10k components: 22.4 ms
```

---

## CI/CD Integration

### GitHub Actions Workflow

The project includes `.github/workflows/build-and-test.yml` with:

1. **Build & Test Jobs**
   - Matrix: Debug/Release builds × 4 sanitizer variants
   - Runs on Ubuntu Latest
   - Automated CTest execution

2. **Code Quality Job**
   - dart analyze
   - clang-tidy verification
   - clang-format checks

3. **Performance Benchmark Job**
   - Runs on main branch pushes
   - Generates performance metrics
   - Tracks regression

4. **Sanitizer Verification Job**
   - Dedicated ASAN/UBSan runs
   - Separate job for memory safety verification

### Local CI Simulation

```bash
# Test Debug + Coverage
cmake -S . -B build-ci-debug \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_COVERAGE=ON
cmake --build build-ci-debug -j$(nproc)
cd build-ci-debug && ctest && cd ..

# Test Release
cmake -S . -B build-ci-release \
    -DCMAKE_BUILD_TYPE=Release
cmake --build build-ci-release -j$(nproc)
cd build-ci-release && ctest && cd ..

# Test with ASAN
cmake -S . -B build-ci-asan \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_SANITIZER=asan
cmake --build build-ci-asan -j$(nproc)
cd build-ci-asan && ctest && cd ..
```

### Running Individual Tests

```bash
# List all tests
./build/native_tests/appstream_tests --gtest_list_tests

# Run specific test
./build/native_tests/appstream_tests --gtest_filter=StringPoolTest.Intern

# Run with verbosity
./build/native_tests/appstream_tests --gtest_filter=*Coverage* -v

# Run real appstream data tests
./build/native_tests/appstream_tests --gtest_filter=RealAppstreamTest.*
```

---

## Real Appstream Data Tests

### Overview

New test file: `native_tests/test_real_appstream_data.cpp`

Tests the parser with realistic Flathub-style appstream data including:
- Real component structure
- Multiple categories
- Various URL types
- Developer information
- Releases section

### Test Cases

1. **ParseRealWorldSample** (5 real apps)
   - Tests parsing of GNOME Nautilus, Evolution, GIMP, Firefox, Spotify
   - Validates component properties

2. **ParseAndStoreRealData**
   - Parse and store in SQLite
   - Verify database creation

3. **LanguageFiltering**
   - Test multi-language support
   - Verify filtering works

4. **ComponentCategories**
   - Validate category parsing
   - Verify multi-category support

5. **URLs**
   - Test URL parsing
   - Verify multiple URL types

6. **MultiLanguageSupport**
   - Test with 5 different languages
   - Ensure robust parsing

7. **ErrorHandlingMalformedXML**
   - Test graceful error handling
   - Verify no crashes on malformed data

8. **InMemorySearchOnRealData**
   - Test search functionality
   - Verify indexing

9. **LargeRealWorldDataset**
   - Process 100 realistic components
   - Verify scalability

### Running Real Appstream Tests

```bash
# Run all real appstream tests
./build/native_tests/appstream_tests --gtest_filter=RealAppstreamTest.*

# Run specific real appstream test
./build/native_tests/appstream_tests --gtest_filter=RealAppstreamTest.ParseRealWorldSample

# Run with verbose output
./build/native_tests/appstream_tests --gtest_filter=RealAppstreamTest.* -v
```

---

## Combined Build Configuration Examples

### Full CI Simulation

```bash
#!/bin/bash

# All builds in one script
for build_type in Debug Release; do
    for sanitizer in none asan ubsan; do
        name="build-${build_type}-${sanitizer}"
        echo "Building: $name"
        
        cmake -S . -B "$name" \
            -DCMAKE_BUILD_TYPE="$build_type" \
            -DENABLE_SANITIZER="$sanitizer" \
            -DENABLE_COVERAGE=$([[ "$build_type" == "Debug" ]] && echo "ON" || echo "OFF")
        
        cmake --build "$name" -j$(nproc)
        cd "$name"
        ctest --output-on-failure
        cd ..
    done
done
```

### Production Build

```bash
# Optimized, no sanitizers, no coverage
cmake -S . -B build-prod \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SANITIZER=none \
    -DENABLE_COVERAGE=OFF

cmake --build build-prod -j$(nproc)
./build-prod/native_tests/appstream_tests
dart test
```

### Development Build

```bash
# Full debugging, coverage, sanitizers
cmake -S . -B build-dev \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_SANITIZER=asan \
    -DENABLE_COVERAGE=ON

cmake --build build-dev -j$(nproc)
cd build-dev
ctest --output-on-failure -V
dart test -v
```

---

## Troubleshooting

### Sanitizer Issues

**Problem:** "sanitizer not found" error
```bash
# Solution: Update compiler
sudo apt-get install -y g++-13
```

**Problem:** ASAN reports false positives
```bash
# Suppress specific issues
export ASAN_OPTIONS=halt_on_error=0:allow_addr2line=true
```

### Coverage Issues

**Problem:** "gcov: unknown file format"
```bash
# Solution: Use matching gcov version
export PATH="/usr/bin/gcov-13:$PATH"
```

### Benchmark Issues

**Problem:** Benchmarks taking too long
```bash
# Edit benchmark_parser.cpp to reduce iteration counts
# Change COMPONENT_COUNT from 1000 to 100
# Change LARGE_COMPONENT_COUNT from 5000 to 500
```

---

## Performance Baselines

Typical performance on modern hardware (GCC 15, -O3):

| Operation | Time | Components |
|-----------|------|-----------|
| StringPool (10k strings) | 15 ms | 100 unique |
| XmlScanner | 45 ms | 1000 |
| Parser (streaming) | 59 ms | 1000 |
| Parser (in-memory) | 42 ms | 100 |
| SqliteWriter | 125 ms | 1000 |
| End-to-end | 190 ms | 1000 |
| Stress test | 946 ms | 5000 |

---

## Next Steps

1. **Enable in CI/CD** - Integrate workflows into GitHub/GitLab
2. **Track regression** - Monitor performance metrics over time
3. **Baseline memory** - Compare sanitizer reports
4. **Real data** - Test with actual Flathub appstream.xml.gz
5. **Profile** - Use perf/valgrind for detailed analysis


