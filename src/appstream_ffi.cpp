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

#include "appstream_ffi.h"
#include "dart_api_dl.h"

#include "AppStreamParser.h"
#include "SqliteWriter.h"

#include <cstdlib>
#include <cstring>
#include <string>

// ============================================================
// Post helpers — send strings to Dart via Channel B pattern
// ============================================================

/// Posts a string to the Dart port as kExternalTypedData (Uint8).
/// The string data is malloc'd and freed by Dart GC via the finalizer.
static void postString(const Dart_Port port, const std::string &msg) {
  if (!Dart_PostCObject_DL || port == ILLEGAL_PORT)
    return;

  const auto len = msg.size();
  auto *buf = static_cast<uint8_t *>(malloc(len));
  if (!buf)
    return;
  memcpy(buf, msg.data(), len);

  Dart_CObject obj{};
  obj.type = Dart_CObject_kExternalTypedData;
  obj.value.as_external_typed_data.type = Dart_TypedData_kUint8;
  obj.value.as_external_typed_data.length = static_cast<intptr_t>(len);
  obj.value.as_external_typed_data.data = buf;
  obj.value.as_external_typed_data.peer = buf;
  obj.value.as_external_typed_data.callback = [](void * /*isolate_data*/,
                                                 void *peer) { free(peer); };

  Dart_PostCObject_DL(port, &obj);
}

// ============================================================
// DartNotifySink — wraps SqliteWriter AND posts to Dart
// ============================================================

/// A ComponentSink that delegates to SqliteWriter for persistence
/// and posts each component's id + name + summary to a Dart port.
class DartNotifySink final : public ComponentSink {
public:
  DartNotifySink(SqliteWriter &writer, Dart_Port port)
      : writer_(writer), port_(port) {}

  std::expected<void, Error> begin() override { return writer_.begin(); }

  std::expected<void, Error> onComponent(Component component) override {
    // Build a tab-delimited message: "id\tname\tsummary"
    std::string msg;
    msg.reserve(component.id.size() + component.name.size() +
                component.summary.size() + 2);
    msg.append(component.id);
    msg.push_back('\t');
    msg.append(component.name);
    msg.push_back('\t');
    msg.append(component.summary);

    // Post to Dart (non-blocking, thread-safe)
    postString(port_, msg);

    // Forward to SQLite writer
    return writer_.onComponent(std::move(component));
  }

  std::expected<void, Error> end() override {
    // Notify Dart that parsing is complete (before writer_.end() which logs)
    const std::string done =
        "DONE\t" + std::to_string(writer_.componentCount());
    postString(port_, done);

    return writer_.end();
  }

  [[nodiscard]] size_t componentCount() const override {
    return writer_.componentCount();
  }

private:
  SqliteWriter &writer_;
  Dart_Port port_;
};

// ============================================================
// Exported C ABI functions
// ============================================================

extern "C" {

int64_t appstream_init(void *data) { return Dart_InitializeApiDL(data); }

int64_t appstream_parse_to_sqlite(const char *xml_path, const char *db_path,
                                  const char *language, int64_t dart_port,
                                  int64_t batch_size) {

  const auto port = static_cast<Dart_Port>(dart_port);

  SqliteWriter writer(db_path, static_cast<size_t>(batch_size));
  DartNotifySink sink(writer, port);

  auto result =
      AppStreamParser::parseToSink(xml_path, language ? language : "", sink);

  if (!result) {
    const std::string err = "ERROR\tParse failed (code " +
                            std::to_string(static_cast<int>(result.error())) +
                            ")";
    postString(port, err);
    return -1;
  }

  return 0;
}

const char *appstream_version(void) {
  return "appstream_parser v0.2.0 (C++23, Dart API DL 2)";
}

} // extern "C"
