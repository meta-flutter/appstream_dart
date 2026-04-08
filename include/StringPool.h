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

#ifndef STRINGPOOL_H
#define STRINGPOOL_H

#include <string>
#include <string_view>
#include <unordered_set>

/// String interning pool. Stores unique owning copies and returns stable
/// string_view handles. Useful for categories, keywords, and other values
/// that repeat across thousands of components.
class StringPool {
public:
  /// Intern a string_view. If an equal string already exists in the pool,
  /// returns a view into the existing copy. Otherwise, copies the string
  /// into the pool and returns a view into that copy.
  [[nodiscard]] std::string_view intern(std::string_view sv);

  /// Intern from a std::string (avoids double copy when the caller already has
  /// one).
  [[nodiscard]] std::string_view intern(const std::string &s);

  [[nodiscard]] size_t size() const noexcept { return pool_.size(); }

private:
  /// Transparent hash/equal so we can look up by string_view without
  /// constructing a std::string for the probe.
  struct Hash {
    using is_transparent = void;
    size_t operator()(const std::string_view sv) const noexcept {
      return std::hash<std::string_view>{}(sv);
    }
    size_t operator()(const std::string &s) const noexcept {
      return std::hash<std::string_view>{}(s);
    }
  };
  struct Equal {
    using is_transparent = void;
    bool operator()(const std::string &a, const std::string &b) const noexcept { return a == b; }
    bool operator()(const std::string &a, std::string_view b) const noexcept { return a == b; }
    bool operator()(std::string_view a, const std::string &b) const noexcept { return a == b; }
  };

  std::unordered_set<std::string, Hash, Equal> pool_;
};

#endif // STRINGPOOL_H
