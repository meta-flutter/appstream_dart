# How to Run Tests

The unified test runner builds the C++ test suite via CMake, runs it
through `ctest`, and then runs the Dart test suite.

```bash
./scripts/test.sh
```

Useful environment overrides:

| Var          | Default   | Purpose                                  |
| ------------ | --------- | ---------------------------------------- |
| `BUILD_TYPE` | `Release` | CMake build type                         |
| `BUILD_DIR`  | `build`   | CMake build directory                    |
| `SANITIZER`  | `none`    | `none` \| `asan` \| `msan` \| `ubsan`    |
| `COVERAGE`   | `OFF`     | Enable gcov/lcov instrumentation         |
| `BENCHMARKS` | `OFF`     | Build the C++ benchmark targets          |
| `SKIP_CXX`   | unset     | Skip the C++ test phase                  |
| `SKIP_DART`  | unset     | Skip the Dart test phase                 |

Extra arguments are forwarded to `dart test`, e.g.:

```bash
./scripts/test.sh -n 'parses Flathub catalog'
SANITIZER=asan BUILD_TYPE=Debug ./scripts/test.sh
SKIP_CXX=1 ./scripts/test.sh test/model_test.dart
```

## Running the suites manually

**C++ tests** (driven by CMake/CTest):

```bash
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build
ctest --test-dir build --output-on-failure
```

**Dart tests** (the FFI library is built on demand by `hook/build.dart`):

```bash
dart pub get
dart test
```

## Test files

- `test/model_test.dart` — pure Dart unit tests (no native code)
- `test/appstream_uninit_test.dart` — uninitialized-state behavior
- `test/appstream_parse_fallback_test.dart` — isolate spawn fallback path
- `test/appstream_integration_test.dart` — end-to-end FFI integration
- `tests/*.cpp` — C++ unit and integration tests (GoogleTest)
