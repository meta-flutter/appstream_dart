/*
 * Minimal spdlog-compatible shim for shared library builds.
 * Provides info/warn/error/debug logging via fprintf(stderr, ...).
 * Avoids pulling in the full spdlog header-only library.
 */

#ifndef SPDLOG_SPDLOG_H
#define SPDLOG_SPDLOG_H

#include <cstdio>
#include <print>

namespace spdlog {

template <typename... Args>
void info(std::format_string<Args...> fmt, Args &&...args) {
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  std::print(stderr, "[info] {}\n", msg);
}

template <typename... Args>
void warn(std::format_string<Args...> fmt, Args &&...args) {
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  std::print(stderr, "[warn] {}\n", msg);
}

template <typename... Args>
void error(std::format_string<Args...> fmt, Args &&...args) {
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  std::print(stderr, "[error] {}\n", msg);
}

template <typename... Args>
void debug([[maybe_unused]] std::format_string<Args...> fmt,
           [[maybe_unused]] Args &&...args) {
#ifndef NDEBUG
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  std::print(stderr, "[debug] {}\n", msg);
#endif
}

} // namespace spdlog

// SPDLOG_WARN macro compatibility
#define SPDLOG_WARN(...) spdlog::warn(__VA_ARGS__)

#endif // SPDLOG_SPDLOG_H
