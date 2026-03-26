#!/bin/bash
# Appstream test runner script
# Sets up PATH and runs Dart/C++ tests

set -e

# Detect script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Find Dart SDK
DART_SDK_PATHS=(
    "/mnt/raid10/workspace-automation/flutter/bin/cache/dart-sdk"
    "/mnt/raid10/workspace-automation/flutter/engine/src/out/host_debug/dart-sdk"
    "${FLUTTER_HOME}/bin/cache/dart-sdk"
)

DART_SDK=""
for path in "${DART_SDK_PATHS[@]}"; do
    if [ -f "$path/bin/dart" ]; then
        DART_SDK="$path"
        break
    fi
done

if [ -z "$DART_SDK" ]; then
    echo "Error: Dart SDK not found. Please set FLUTTER_HOME or install Flutter."
    exit 1
fi

export PATH="$DART_SDK/bin:$PATH"

echo "=== Appstream Test Suite ==="
echo "Dart SDK: $DART_SDK"
echo ""

# Run C++ tests if available
if [ -f "build/tests/appstream_tests" ]; then
    echo "=== Running C++ Tests ==="
    ./build/tests/appstream_tests 2>&1 | tail -5
    echo ""
fi

# Run Dart tests
echo "=== Running Dart Tests ==="
dart test test/ "$@"

