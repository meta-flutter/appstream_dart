# How to Run Tests

## Quick Start

### Option 1: Use the provided test runner (Recommended)

```bash
./run_tests.sh
```

This script automatically:
- Locates the Dart SDK
- Sets up PATH
- Runs both C++ and Dart tests

### Option 2: Add Dart to PATH

Add this to your `~/.bashrc` or `~/.zshrc`:

```bash
export PATH="/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin:$PATH"
```

Then run tests normally:

```bash
dart test
```

Or specify the test directory explicitly:

```bash
dart test test/
```

### Option 3: Run C++ and Dart tests separately

**C++ Tests:**
```bash
cmake --build build --target appstream_tests
./build/tests/appstream_tests
```

**Dart Tests:**
```bash
/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin/dart test test/
```

## Test Files

- `test/model_test.dart` – 20 pure Dart tests (no native code)
- `test/appstream_uninit_test.dart` – 4 tests for uninitialized state
- `test/appstream_parse_fallback_test.dart` – 3 tests for isolate spawn fallback
- `test/appstream_integration_test.dart` – 18 end-to-end integration tests

**Total: 45 Dart tests**

## Troubleshooting

### "No test files were passed"

This means Dart can't find the `test/` directory. Solutions:

1. Run `./run_tests.sh` (handles PATH automatically)
2. Specify the test directory: `dart test test/`
3. Add Dart to PATH as shown above

### "dart: command not found"

Dart is not in your PATH. Either:

1. Use the full path: `/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin/dart test test/`
2. Use the test runner: `./run_tests.sh`
3. Add Dart SDK to PATH (see Option 2 above)

### C++ tests don't run

First build the C++ tests:

```bash
cmake --build build --target appstream_tests
```

Then run:

```bash
./build/tests/appstream_tests
```

Or use the test runner: `./run_tests.sh`

## Full Test Suite

Run everything at once:

```bash
./run_tests.sh
```

Expected output:
```
=== Appstream Test Suite ===
Dart SDK: /mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk

=== Running C++ Tests ===
[  PASSED  ] 140 tests.

=== Running Dart Tests ===
00:02 +45: All tests passed!
```

## Environment Setup for Developers

Add to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
# Appstream project
export APPSTREAM_HOME="$HOME/CLionProjects/appstream"
export PATH="/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin:$PATH"

# Convenience alias
alias run_appstream_tests="$APPSTREAM_HOME/run_tests.sh"
```

Then simply run:

```bash
run_appstream_tests
```

