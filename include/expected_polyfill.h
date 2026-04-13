// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 Joel Winarske <joel.winarske@gmail.com>

#ifndef EXPECTED_POLYFILL_H
#define EXPECTED_POLYFILL_H

// Use std::expected when available (GCC 13+, Clang 19+), otherwise provide a
// minimal polyfill that covers the subset used by this project.

#include <version>

#ifdef __cpp_lib_expected
#include <expected>
#else

#include <cassert>
#include <type_traits>
#include <utility>

namespace std {

template <typename E>
class unexpected {
public:
  constexpr explicit unexpected(E e) : err_(std::move(e)) {}
  constexpr const E &error() const & { return err_; }
  constexpr E &error() & { return err_; }
  constexpr E &&error() && { return std::move(err_); }

private:
  E err_;
};

// Deduction guide
template <typename E>
unexpected(E) -> unexpected<E>;

template <typename T, typename E>
class expected {
public:
  // Default constructor — only meaningful for void T
  template <typename U = T,
            typename std::enable_if<std::is_void<U>::value, int>::type = 0>
  constexpr expected() : has_value_(true) {}

  // Value constructor — only for non-void T
  template <typename U = T,
            typename std::enable_if<!std::is_void<U>::value, int>::type = 0>
  constexpr expected(U &&val) : has_value_(true) {
    new (&storage_.val) T(std::forward<U>(val));
  }

  // Error constructor
  constexpr expected(unexpected<E> u) : has_value_(false) {
    new (&storage_.err) E(std::move(u).error());
  }

  // Copy
  expected(const expected &o) : has_value_(o.has_value_) {
    if constexpr (!std::is_void_v<T>) {
      if (has_value_)
        new (&storage_.val) T(o.storage_.val);
      else
        new (&storage_.err) E(o.storage_.err);
    } else {
      if (!has_value_)
        new (&storage_.err) E(o.storage_.err);
    }
  }

  // Move
  expected(expected &&o) noexcept : has_value_(o.has_value_) {
    if constexpr (!std::is_void_v<T>) {
      if (has_value_)
        new (&storage_.val) T(std::move(o.storage_.val));
      else
        new (&storage_.err) E(std::move(o.storage_.err));
    } else {
      if (!has_value_)
        new (&storage_.err) E(std::move(o.storage_.err));
    }
  }

  ~expected() { destroy(); }

  expected &operator=(const expected &o) {
    if (this != &o) {
      destroy();
      has_value_ = o.has_value_;
      if constexpr (!std::is_void_v<T>) {
        if (has_value_)
          new (&storage_.val) T(o.storage_.val);
        else
          new (&storage_.err) E(o.storage_.err);
      } else {
        if (!has_value_)
          new (&storage_.err) E(o.storage_.err);
      }
    }
    return *this;
  }

  expected &operator=(expected &&o) noexcept {
    if (this != &o) {
      destroy();
      has_value_ = o.has_value_;
      if constexpr (!std::is_void_v<T>) {
        if (has_value_)
          new (&storage_.val) T(std::move(o.storage_.val));
        else
          new (&storage_.err) E(std::move(o.storage_.err));
      } else {
        if (!has_value_)
          new (&storage_.err) E(std::move(o.storage_.err));
      }
    }
    return *this;
  }

  [[nodiscard]] constexpr bool has_value() const { return has_value_; }
  constexpr explicit operator bool() const { return has_value_; }

  // Value access (non-void)
  template <typename U = T>
  constexpr typename std::enable_if<!std::is_void<U>::value, U &>::type
  value() & {
    assert(has_value_);
    return storage_.val;
  }
  template <typename U = T>
  constexpr typename std::enable_if<!std::is_void<U>::value, const U &>::type
  value() const & {
    assert(has_value_);
    return storage_.val;
  }
  template <typename U = T>
  constexpr typename std::enable_if<!std::is_void<U>::value, U &&>::type
  value() && {
    assert(has_value_);
    return std::move(storage_.val);
  }

  template <typename U = T>
  constexpr typename std::enable_if<!std::is_void<U>::value, U &>::type
  operator*() & {
    return value();
  }
  template <typename U = T>
  constexpr typename std::enable_if<!std::is_void<U>::value, const U &>::type
  operator*() const & {
    return value();
  }

  constexpr const E &error() const & {
    assert(!has_value_);
    return storage_.err;
  }
  constexpr E &error() & {
    assert(!has_value_);
    return storage_.err;
  }

private:
  void destroy() {
    if constexpr (!std::is_void_v<T>) {
      if (has_value_)
        storage_.val.~T();
      else
        storage_.err.~E();
    } else {
      if (!has_value_)
        storage_.err.~E();
    }
  }

  union Storage {
    Storage() {}
    ~Storage() {}
    typename std::conditional<!std::is_void<T>::value, T, char>::type val;
    E err;
  } storage_;
  bool has_value_;
};

} // namespace std

#endif // __cpp_lib_expected
#endif // EXPECTED_POLYFILL_H
