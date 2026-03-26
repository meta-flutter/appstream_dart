/*
 * Copyright 2024 Joel Winarske
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
