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
