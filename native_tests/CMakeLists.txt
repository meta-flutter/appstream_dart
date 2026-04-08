# ── GoogleTest: prefer system install, fall back to FetchContent ──────────
find_package(GTest QUIET)
if(NOT GTest_FOUND)
    message(STATUS "GTest not found via find_package — fetching via FetchContent")
    include(FetchContent)
    FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz
        DOWNLOAD_EXTRACT_TIMESTAMP ON
    )
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
    FetchContent_MakeAvailable(googletest)
else()
    message(STATUS "Using system GTest ${GTest_VERSION}")
endif()

# ── Test executable ────────────────────────────────────────────────────────
add_executable(appstream_tests
    test_string_pool.cpp
    test_xml_scanner.cpp
    test_component.cpp
    test_appstream_parser.cpp
    test_sqlite_writer.cpp
    test_real_appstream_data.cpp
)

target_include_directories(appstream_tests PRIVATE
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_options(appstream_tests PRIVATE -Wall -Wextra)

target_link_libraries(appstream_tests
    PRIVATE
    GTest::gtest_main
    appstream_core
    sqlite3
)

# Register each TEST() / TEST_F() with CTest automatically.
include(GoogleTest)
gtest_discover_tests(appstream_tests)

# ── Optional: Performance benchmarks ───────────────────────────────────────
if(ENABLE_BENCHMARKS)
    add_executable(appstream_benchmarks
        benchmark_parser.cpp
    )

    target_include_directories(appstream_benchmarks PRIVATE
        ${CMAKE_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}
    )

    target_compile_options(appstream_benchmarks PRIVATE -Wall -Wextra -O3)

    target_link_libraries(appstream_benchmarks
        PRIVATE
        GTest::gtest_main
        appstream_core
        sqlite3
    )

    message(STATUS "Performance benchmarks enabled")
endif()

