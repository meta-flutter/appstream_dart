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

#ifndef APPSTREAMPARSER_H
#define APPSTREAMPARSER_H

#include "Component.h"
#include "ComponentSink.h"
#include "XmlScanner.h"

#include <expected>
#include <memory>
#include <ranges>
#include <string>
#include <string_view>
#include <unordered_map>
#include <vector>

class AppStreamParser {
public:
  enum class ParseError {
    FILE_NOT_FOUND,
    MMAP_FAILED,
    XML_PARSE_ERROR,
    SINK_ERROR,
  };

  // ---- Streaming mode (minimal RAM) ----

  /// Parse the XML file and stream each completed component to the sink.
  /// Peak RAM = one Component and sink overhead (e.g., SQLite page cache).
  /// The file is memory mapped for the duration of parsing, then unmapped.
  static std::expected<void, ParseError>
  parseToSink(const std::string &filename, const std::string &language,
              ComponentSink &sink);

  // ---- In-memory mode (original behavior) ----

  /// Parse and retain all components in memory.
  static std::expected<AppStreamParser, ParseError>
  create(const std::string &filename, const std::string &language);

  ~AppStreamParser();

  // Move-only
  AppStreamParser(AppStreamParser &&) noexcept;
  AppStreamParser &operator=(AppStreamParser &&) noexcept;
  AppStreamParser(const AppStreamParser &) = delete;
  AppStreamParser &operator=(const AppStreamParser &) = delete;

  std::vector<std::string> getUniqueCategories() const;
  std::vector<std::string> getUniqueKeywords() const;

  std::vector<const Component *>
  searchByCategory(std::string_view category) const;
  std::vector<const Component *>
  searchByKeyword(std::string_view keyword) const;

  enum class SortOption { BY_ID, BY_NAME };
  std::vector<const Component *> getSortedComponents(SortOption option) const;

  [[nodiscard]] size_t getTotalComponentCount() const;
  [[nodiscard]] const Component *findComponent(const std::string &id) const;

  [[nodiscard]] auto getComponents() const {
    return components_ | std::views::values |
           std::views::transform(
               [](const auto &ptr) -> const Component & { return *ptr; });
  }

private:
  AppStreamParser() = default;

  std::unordered_map<std::string, std::unique_ptr<Component>> components_;
  std::string language_;

  size_t fileSize_ = 0;
  void *fileData_ = nullptr;

  /// Core parse loop. Streams each completed component to the sink.
  static std::expected<void, ParseError> doParse(XmlScanner &scanner,
                                                 const std::string &language,
                                                 ComponentSink &sink);

  static void mmapFile(const std::string &filename, void *&data, size_t &size);
  static void munmapFile(void *&data, size_t &size);

  static std::string_view
  findAttr(const std::vector<XmlScanner::Attribute> &attrs,
           std::string_view name);
};

#endif // APPSTREAMPARSER_H
