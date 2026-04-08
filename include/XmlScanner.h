/*
 * Copyright 2026 Joel Winarske
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

#include "expected_polyfill.h"
#include <cstddef>
#include <string>
#include <string_view>
#include <vector>

// Default streaming buffer size (256 KB — large enough for any single XML token
// in AppStream catalogs, small enough to keep resident memory low).
inline constexpr size_t kDefaultStreamBufSize = 256UL * 1024;

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
  enum class EventType { START_ELEMENT, END_ELEMENT, TEXT, END_OF_DOCUMENT, ERROR };

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
    bool text_has_entities = false;    // if true, use text_owned; else text_view

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

  /// Construct scanner over a contiguous buffer (e.g. mmap'd).
  /// The buffer must remain valid for the lifetime of the scanner.
  XmlScanner(const char *data, size_t size);

  /// Construct a streaming scanner that reads from a file descriptor.
  /// Uses an internal sliding buffer of `bufSize` bytes.  The fd is NOT
  /// owned — the caller must keep it open and close it after the scanner
  /// is destroyed.
  explicit XmlScanner(int fd, size_t bufSize = kDefaultStreamBufSize);

  /// Pull the next event. Returns error on malformed input.
  /// IMPORTANT: string_view members in the returned Event are only valid
  /// until the next call to next(). In streaming mode, the internal buffer
  /// may be compacted between calls. Callers must copy any values they
  /// need to retain before calling next() again.
  std::expected<Event, Error> next();

  /// Check if we've reached the end
  [[nodiscard]] bool atEnd() const noexcept { return pos_ >= end_; }

private:
  const char *pos_;
  const char *end_;
  const char *data_;

  // Streaming support
  int fd_ = -1;
  std::vector<char> stream_buf_;
  bool eof_ = false;

  /// Ensure at least half the stream buffer is available.  Compacts
  /// unconsumed data to the front and reads more from fd_.
  void refillIfNeeded();

  // Reusable buffers to avoid repeated allocations
  std::vector<Attribute> attr_buf_;
  std::string decode_buf_;

  // For self-closing tags: after returning START_ELEMENT, the next
  // call to next() returns END_ELEMENT with this name.
  bool pending_end_ = false;
  std::string pending_end_name_; // owning copy, survives buffer compaction

  void skipWhitespace();
  void skipXmlDeclaration();
  void skipComment();

  /// Decode XML entities in a string_view into decode_buf_
  void decodeEntities(std::string_view src);

  /// Check if a string_view contains any '&' character
  static bool containsEntity(std::string_view sv) noexcept;
};

#endif // XMLSCANNER_H
