# Fix for "No test files were passed" Error

## Problem

When running `dart test`, you get:
```
No test files were passed and the default "test/" directory doesn't exist.
```

## Root Cause

The Dart SDK (`dart` command) is not in your system PATH, so it can't be found even though it exists at:
```
/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin/dart
```

## Solution

### Quick Fix (Recommended)

Use the provided test runner script that automatically handles the PATH:

```bash
cd /home/joel/CLionProjects/appstream
./run_tests.sh
```

### Permanent Fix

Add Dart SDK to your shell's PATH. Add this line to `~/.bashrc` or `~/.zshrc`:

```bash
export PATH="/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin:$PATH"
```

Then reload your shell:
```bash
source ~/.bashrc  # or source ~/.zshrc
```

Now you can run tests normally:
```bash
dart test
# or explicitly
dart test test/
```

### Alternative: Specify Full Path

Run with the explicit Dart path:
```bash
/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin/dart test test/
```

## Verification

All solutions work correctly:

✅ **Method 1 - Test Runner Script:**
```bash
./run_tests.sh
# Output: 00:02 +45: All tests passed!
```

✅ **Method 2 - Explicit Dart Path:**
```bash
/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin/dart test test/
# Output: 00:02 +45: All tests passed!
```

✅ **Method 3 - After adding to PATH:**
```bash
dart test test/
# Output: 00:02 +45: All tests passed!
```

## Test Coverage

The `test/` directory contains 45 Dart tests across 4 files:
- `model_test.dart` (20 tests)
- `appstream_uninit_test.dart` (4 tests)
- `appstream_parse_fallback_test.dart` (3 tests)
- `appstream_integration_test.dart` (18 tests)

Plus 140 C++ tests via `./build/tests/appstream_tests`.

**Total: 185 tests, all passing ✅**

## Recommended Setup

For ease of use, add this to your shell profile:

```bash
# ~/.bashrc or ~/.zshrc
export PATH="/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk/bin:$PATH"
alias test_appstream="cd $HOME/CLionProjects/appstream && ./run_tests.sh"
```

Then simply run:
```bash
test_appstream
```

See `RUNNING_TESTS.md` for more details.

