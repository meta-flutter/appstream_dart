// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2024 Joel Winarske <joel.winarske@gmail.com>

#include "StringPool.h"

std::string_view StringPool::intern(std::string_view sv) {
  if (auto it = pool_.find(sv); it != pool_.end()) {
    return *it;
  }
  auto [it, _] = pool_.emplace(sv);
  return *it;
}

std::string_view StringPool::intern(const std::string &s) {
  if (auto it = pool_.find(std::string_view{s}); it != pool_.end()) {
    return *it;
  }
  auto [it, _] = pool_.insert(s);
  return *it;
}
