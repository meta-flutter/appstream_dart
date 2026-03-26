#!/bin/bash

# ============================================================
# Advanced Build Test Script
# Tests all new features: coverage, sanitizers, benchmarks
# ============================================================

set -e

COLORS=(
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
    NC='\033[0m'
)

PASS="${COLORS[GREEN]}✓${COLORS[NC]}"
FAIL="${COLORS[RED]}✗${COLORS[NC]}"
INFO="${COLORS[BLUE]}ℹ${COLORS[NC]}"

echo -e "${COLORS[BLUE]}╔════════════════════════════════════════════════════════════╗${COLORS[NC]}"
echo -e "${COLORS[BLUE]}║     Advanced Build & Test Configuration Verification       ║${COLORS[NC]}"
echo -e "${COLORS[BLUE]}╚════════════════════════════════════════════════════════════╝${COLORS[NC]}"

# ============================================================
# Test 1: CI/CD Workflow file
# ============================================================
echo -e "\n${INFO} Test 1: GitHub Actions Workflow"
if [ -f ".github/workflows/build-and-test.yml" ]; then
    echo -e "${PASS} CI/CD workflow file exists"
    if grep -q "ENABLE_COVERAGE" .github/workflows/build-and-test.yml; then
        echo -e "${PASS} Coverage configuration found"
    else
        echo -e "${FAIL} Coverage configuration not found"
    fi
    if grep -q "ENABLE_SANITIZER" .github/workflows/build-and-test.yml; then
        echo -e "${PASS} Sanitizer configuration found"
    else
        echo -e "${FAIL} Sanitizer configuration not found"
    fi
else
    echo -e "${FAIL} CI/CD workflow file not found"
fi

# ============================================================
# Test 2: CMakeLists.txt options
# ============================================================
echo -e "\n${INFO} Test 2: CMake Configuration"
if grep -q "ENABLE_COVERAGE" CMakeLists.txt; then
    echo -e "${PASS} ENABLE_COVERAGE option found"
else
    echo -e "${FAIL} ENABLE_COVERAGE option not found"
fi

if grep -q "ENABLE_SANITIZER" CMakeLists.txt; then
    echo -e "${PASS} ENABLE_SANITIZER option found"
else
    echo -e "${FAIL} ENABLE_SANITIZER option not found"
fi

if grep -q "fsanitize=address" CMakeLists.txt; then
    echo -e "${PASS} AddressSanitizer flags found"
else
    echo -e "${FAIL} AddressSanitizer flags not found"
fi

# ============================================================
# Test 3: Test files
# ============================================================
echo -e "\n${INFO} Test 3: Test Files"
if [ -f "tests/benchmark_parser.cpp" ]; then
    echo -e "${PASS} Benchmark test file exists"
    if grep -q "StringPoolInterning\|XmlScannerLargeDocument\|AppStreamParserStreamingMode" tests/benchmark_parser.cpp; then
        echo -e "${PASS} Benchmark test cases found"
    else
        echo -e "${FAIL} Benchmark test cases not found"
    fi
else
    echo -e "${FAIL} Benchmark test file not found"
fi

if [ -f "tests/test_real_appstream_data.cpp" ]; then
    echo -e "${PASS} Real appstream data test file exists"
    if grep -q "RealAppstreamTest\|ParseRealWorldSample" tests/test_real_appstream_data.cpp; then
        echo -e "${PASS} Real appstream test cases found"
    else
        echo -e "${FAIL} Real appstream test cases not found"
    fi
else
    echo -e "${FAIL} Real appstream data test file not found"
fi

# ============================================================
# Test 4: Documentation
# ============================================================
echo -e "\n${INFO} Test 4: Documentation"
if [ -f "ADVANCED_BUILD.md" ]; then
    echo -e "${PASS} Advanced Build documentation exists"
    docs=("Code Coverage" "Sanitizers" "Performance Benchmarks" "CI/CD Integration" "Real Appstream Data Tests")
    for doc in "${docs[@]}"; do
        if grep -q "$doc" ADVANCED_BUILD.md; then
            echo -e "${PASS} Documentation includes: $doc"
        else
            echo -e "${FAIL} Documentation missing: $doc"
        fi
    done
else
    echo -e "${FAIL} Advanced Build documentation not found"
fi

# ============================================================
# Test 5: Try building with different configurations
# ============================================================
echo -e "\n${INFO} Test 5: Build Configuration Tests"

echo -e "${YELLOW}Note: Full builds may take several minutes${COLORS[NC]}"

# Clean
rm -rf build-test-* 2>/dev/null || true

# Test Debug build
echo -e "\n  Testing Debug build..."
if cmake -S . -B build-test-debug -DCMAKE_BUILD_TYPE=Debug -DENABLE_COVERAGE=OFF -DENABLE_SANITIZER=none > /dev/null 2>&1; then
    echo -e "${PASS} Debug configuration successful"
    if cmake --build build-test-debug -j2 > /dev/null 2>&1; then
        echo -e "${PASS} Debug build successful"
    else
        echo -e "${FAIL} Debug build failed"
    fi
else
    echo -e "${FAIL} Debug configuration failed"
fi

# Test Release build
echo -e "\n  Testing Release build..."
if cmake -S . -B build-test-release -DCMAKE_BUILD_TYPE=Release -DENABLE_COVERAGE=OFF -DENABLE_SANITIZER=none > /dev/null 2>&1; then
    echo -e "${PASS} Release configuration successful"
    if cmake --build build-test-release -j2 > /dev/null 2>&1; then
        echo -e "${PASS} Release build successful"
    else
        echo -e "${FAIL} Release build failed"
    fi
else
    echo -e "${FAIL} Release configuration failed"
fi

# ============================================================
# Test 6: Run basic tests
# ============================================================
echo -e "\n${INFO} Test 6: Run Tests"
if [ -f "build-test-debug/tests/appstream_tests" ]; then
    echo -e "  Running C++ tests (Debug)..."
    if timeout 30 ./build-test-debug/tests/appstream_tests --gtest_filter="RealAppstreamTest.ParseRealWorldSample" > /dev/null 2>&1; then
        echo -e "${PASS} Real appstream test passed"
    else
        echo -e "${FAIL} Real appstream test failed (may not be built yet)"
    fi
else
    echo -e "${FAIL} Test executable not found"
fi

# ============================================================
# Cleanup
# ============================================================
echo -e "\n${INFO} Cleanup"
rm -rf build-test-* 2>/dev/null || true
echo -e "${PASS} Temporary build directories removed"

# ============================================================
# Summary
# ============================================================
echo -e "\n${COLORS[BLUE]}╔════════════════════════════════════════════════════════════╗${COLORS[NC]}"
echo -e "${COLORS[BLUE]}║                  Verification Complete!                    ║${COLORS[NC]}"
echo -e "${COLORS[BLUE]}╚════════════════════════════════════════════════════════════╝${COLORS[NC]}"

echo -e "\n${COLORS[GREEN]}Next Steps:${COLORS[NC]}"
echo -e "  1. Review ADVANCED_BUILD.md for detailed configuration options"
echo -e "  2. Try building with coverage: cmake -S . -B build -DENABLE_COVERAGE=ON"
echo -e "  3. Try building with sanitizers: cmake -S . -B build -DENABLE_SANITIZER=asan"
echo -e "  4. Enable benchmarks: cmake -S . -B build -DENABLE_BENCHMARKS=ON"
echo -e "  5. Review .github/workflows/build-and-test.yml for CI/CD configuration"

echo -e "\n${COLORS[GREEN]}Build Commands:${COLORS[NC]}"
echo -e "  # Coverage (Debug)"
echo -e "  cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DENABLE_COVERAGE=ON"
echo -e "  cmake --build build && cd build && ctest"
echo -e ""
echo -e "  # AddressSanitizer"
echo -e "  cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DENABLE_SANITIZER=asan"
echo -e "  cmake --build build && cd build && ctest"
echo -e ""
echo -e "  # Benchmarks (Release)"
echo -e "  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DENABLE_BENCHMARKS=ON"
echo -e "  cmake --build build && ./build/tests/appstream_benchmarks"
echo -e ""
echo -e "  # Real Appstream Data Tests"
echo -e "  cmake -S . -B build && cmake --build build"
echo -e "  ./build/tests/appstream_tests --gtest_filter=RealAppstreamTest.*"

echo ""

