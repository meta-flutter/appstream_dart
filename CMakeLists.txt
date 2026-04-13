# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2026 Joel Winarske <joel.winarske@gmail.com>

cmake_minimum_required(VERSION 3.22)
project(appstream
    LANGUAGES CXX C
    VERSION 0.2.0
    DESCRIPTION "AppStream XML parser — C++23 FFI bridge"
)

# ── Build options ──────────────────────────────────────────────────────────
option(ENABLE_COVERAGE "Enable code coverage with gcov/lcov" OFF)
option(ENABLE_BENCHMARKS "Build performance benchmark tests" OFF)
set(ENABLE_SANITIZER "none" CACHE STRING "Sanitizer: none|asan|msan|ubsan")
set_property(CACHE ENABLE_SANITIZER PROPERTY STRINGS none asan msan ubsan)

# ── Compiler settings ──────────────────────────────────────────────────────
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ── Code coverage flags (Debug builds) ─────────────────────────────────────
if(ENABLE_COVERAGE)
    add_compile_options(--coverage -fprofile-arcs -ftest-coverage)
    add_link_options(--coverage)
    message(STATUS "Code coverage enabled (gcov/lcov)")
endif()

# ── Sanitizer flags ───────────────────────────────────────────────────────
if(NOT ENABLE_SANITIZER STREQUAL "none")
    if(ENABLE_SANITIZER STREQUAL "asan")
        add_compile_options(-fsanitize=address -fno-omit-frame-pointer)
        add_link_options(-fsanitize=address)
        message(STATUS "AddressSanitizer enabled")
    elseif(ENABLE_SANITIZER STREQUAL "msan")
        add_compile_options(-fsanitize=memory -fno-omit-frame-pointer)
        add_link_options(-fsanitize=memory)
        message(STATUS "MemorySanitizer enabled")
    elseif(ENABLE_SANITIZER STREQUAL "ubsan")
        add_compile_options(-fsanitize=undefined -fno-omit-frame-pointer)
        add_link_options(-fsanitize=undefined)
        message(STATUS "UndefinedBehaviorSanitizer enabled")
    endif()
endif()

# ── Core static library (all shared logic, no Dart FFI) ───────────────────
# Built as a static lib so it can be linked by both the shared library and
# the test executable without requiring runtime loading.
add_library(appstream_core STATIC
    src/AppStreamParser.cpp
    src/Component.cpp
    src/XmlScanner.cpp
    src/StringPool.cpp
    src/SqliteWriter.cpp
)
target_include_directories(appstream_core PUBLIC include)
target_compile_options(appstream_core PRIVATE -Wall -Wextra -O2)
target_link_libraries(appstream_core PUBLIC sqlite3 pthread)
# fPIC required so this static lib can be embedded in the shared library.
set_target_properties(appstream_core PROPERTIES POSITION_INDEPENDENT_CODE ON)

# ── Shared library (Dart FFI wrapper) ─────────────────────────────────────
add_library(appstream SHARED
    src/dart_api_dl.cpp
    src/appstream_ffi.cpp
)
target_compile_options(appstream PRIVATE -O2 -fvisibility=hidden)
target_link_libraries(appstream PRIVATE appstream_core)
set_target_properties(appstream PROPERTIES OUTPUT_NAME "appstream")
# When building in-tree (not via the Dart native asset hook), stage the
# shared library into lib/ so the legacy DynamicLibrary.open() loader and
# bin/ scripts can find it. The hook build sets APPSTREAM_HOOK_BUILD=ON
# and consumes the artifact directly from the CMake build directory.
if(NOT APPSTREAM_HOOK_BUILD)
    set_target_properties(appstream PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
    )
endif()

# ── Tests ──────────────────────────────────────────────────────────────────
# Tests are opt-in and OFF by default. Enable explicitly when running the
# C++ test suite (e.g. via scripts/test.sh or CI):
#   cmake -S . -B build -DAPPSTREAM_BUILD_TESTS=ON
# The Dart `package:hooks` build hook (APPSTREAM_HOOK_BUILD=ON) does not
# need them, and neither do downstream consumers that just want
# libappstream.so.
option(APPSTREAM_BUILD_TESTS "Build the C++ test suite" OFF)
if(APPSTREAM_BUILD_TESTS AND NOT APPSTREAM_HOOK_BUILD)
    include(CTest)
    enable_testing()
    add_subdirectory(native_tests)
endif()

