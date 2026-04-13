// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 Joel Winarske <joel.winarske@gmail.com>
/*
 * Minimal spdlog-compatible shim for shared library builds.
 * Provides info/warn/error/debug logging via fprintf(stderr, ...).
 * Avoids pulling in the full spdlog header-only library.
 */

#ifndef SPDLOG_SPDLOG_H
#define SPDLOG_SPDLOG_H

#include <cstdio>
#include <format>

namespace spdlog {

template <typename... Args>
void info(std::format_string<Args...> fmt, Args &&...args) {
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  fprintf(stderr, "[info] %s\n", msg.c_str());
}

template <typename... Args>
void warn(std::format_string<Args...> fmt, Args &&...args) {
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  fprintf(stderr, "[warn] %s\n", msg.c_str());
}

template <typename... Args>
void error(std::format_string<Args...> fmt, Args &&...args) {
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  fprintf(stderr, "[error] %s\n", msg.c_str());
}

template <typename... Args>
void debug([[maybe_unused]] std::format_string<Args...> fmt,
           [[maybe_unused]] Args &&...args) {
#ifndef NDEBUG
  auto msg = std::format(fmt, std::forward<Args>(args)...);
  fprintf(stderr, "[debug] %s\n", msg.c_str());
#endif
}

} // namespace spdlog

// SPDLOG_WARN macro compatibility
#define SPDLOG_WARN(...) spdlog::warn(__VA_ARGS__)

#endif // SPDLOG_SPDLOG_H
