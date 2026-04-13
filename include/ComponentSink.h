// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2024 Joel Winarske <joel.winarske@gmail.com>

#ifndef COMPONENTSINK_H
#define COMPONENTSINK_H

#include "Component.h"

#include "expected_polyfill.h"

/// Abstract sink interface for streaming parsed components.
///
/// The parser calls begin() once before any components, then
/// onComponent() for each completed component (moved in, so the
/// sink takes full ownership), and finally end() after all
/// components have been emitted.
///
/// This allows both in-memory collection and direct-to-SQLite
/// streaming without buffering the entire appstream dataset.
class ComponentSink {
public:
  enum class Error {
    NONE = 0,
    DATABASE_ERROR,
    IO_ERROR,
  };

  virtual ~ComponentSink() = default;

  /// Called once before the first component.
  virtual std::expected<void, Error> begin() { return {}; }

  /// Called once per completed component. The component is moved in.
  /// Returning an error aborts the parse.
  virtual std::expected<void, Error> onComponent(Component component) = 0;

  /// Called once after all components have been emitted.
  virtual std::expected<void, Error> end() { return {}; }

  /// Query: how many components were accepted?
  [[nodiscard]] virtual size_t componentCount() const = 0;
};

#endif // COMPONENTSINK_H
