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

#ifndef XMLSCANNER_H
#define XMLSCANNER_H

#include <cstddef>
#include <expected>
#include <string>
#include <string_view>
#include <vector>

/// A lightweight zero-copy XML pull scanner designed for appstream XML.
///
/// It scans a contiguous memory buffer (typically mmap'd) and delivers
/// tag names and attribute values as string_views pointing directly into
/// the source buffer when no entity decoding is needed. Text content
/// that contains XML entities (&amp; etc.) is decoded into a reusable
/// internal buffer and delivered as a std::string.
///
/// This is NOT a general-purpose XML parser. It does not handle:
/// - Namespaces, processing instructions, DTDs, CDATA
/// - Comments inside attribute values
/// - Malformed XML (behavior is undefined)
///
/// It handles the subset of XML that appstream 1.0 actually uses.
class XmlScanner {
public:
  enum class EventType {
    START_ELEMENT,
    END_ELEMENT,
    TEXT,
    END_OF_DOCUMENT,
    ERROR
  };

  struct Attribute {
    std::string_view name;
    std::string_view value; // points into source buffer (entities NOT decoded
                            // in attrs for appstream)
  };

  struct Event {
    EventType type;
    std::string_view name;             // tag name for START/END_ELEMENT
    std::vector<Attribute> attributes; // only for START_ELEMENT
    std::string_view text_view;        // zero-copy text (when no entities)
    std::string text_owned;            // decoded text (when entities present)
    bool text_has_entities = false; // if true, use text_owned; else text_view

    /// Convenience: get text content regardless of entity status
    [[nodiscard]] std::string_view text() const {
      return text_has_entities ? std::string_view{text_owned} : text_view;
    }
  };

  enum class Error {
    NONE,
    UNEXPECTED_EOF,
    MALFORMED_TAG,
  };

  /// Construct `scanner` over a buffer. The buffer must remain valid for
  /// the lifetime of the scanner and all returned string_views.
  XmlScanner(const char *data, size_t size);

  /// Pull the next event. Returns error on malformed input.
  std::expected<Event, Error> next();

  /// Check if we've reached the end
  [[nodiscard]] bool atEnd() const noexcept { return pos_ >= end_; }

private:
  const char *pos_;
  const char *end_;
  const char *data_;

  // Reusable buffers to avoid repeated allocations
  std::vector<Attribute> attr_buf_;
  std::string decode_buf_;

  // For self-closing tags: after returning START_ELEMENT, the next
  // call to next() returns END_ELEMENT with this name.
  bool pending_end_ = false;
  std::string_view pending_end_name_;

  void skipWhitespace();
  void skipXmlDeclaration();
  void skipComment();

  /// Decode XML entities in a string_view into decode_buf_
  void decodeEntities(std::string_view src);

  /// Check if a string_view contains any '&' character
  static bool containsEntity(std::string_view sv) noexcept;
};

#endif // XMLSCANNER_H
