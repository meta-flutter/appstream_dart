// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2024 Joel Winarske <joel.winarske@gmail.com>

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
