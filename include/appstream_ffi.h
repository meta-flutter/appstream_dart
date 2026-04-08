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

#ifndef APPSTREAM_FFI_H
#define APPSTREAM_FFI_H

#include <cstdint>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Initialize the Dart API dynamic linking.
 * Must be called once with NativeApi.initializeApiDLData before any
 * other function that posts to Dart.
 *
 * @param data  NativeApi.initializeApiDLData from Dart.
 * @return 0 on success, -1 on failure.
 */
__attribute__((visibility("default"))) int64_t appstream_init(void *data);

/**
 * Parse an appstream XML file and stream results to SQLite database.
 *
 * For each component parsed, a string message "id\tname\tsummary" is
 * posted to the Dart port via Dart_PostCObject_DL so Dart can print
 * progress in real-time.
 *
 * A final message with the string "DONE\t<count>" is posted when
 * parsing completes.
 *
 * On error, "ERROR\t<message>" is posted.
 *
 * This function blocks until parsing is complete. Call from a Dart
 * `isolate` to avoid blocking the main `isolate`.
 *
 * SECURITY: `xml_path` and `db_path` are passed directly to `open(2)` and
 * SQLite respectively. The library performs no path normalization,
 * symlink resolution, or sandboxing. Callers that accept these paths
 * from untrusted input MUST validate them (canonicalize, reject `..`
 * traversal, restrict to an allow-listed directory, etc.) before
 * invoking this function.
 *
 * @param xml_path    Path to the appstream.xml file (UTF-8). Caller-validated.
 * @param db_path     Path to output SQLite database (UTF-8). Caller-validated.
 * @param language    Language filter (e.g. "en"), or empty string for all.
 * @param dart_port   Dart_Port (from ReceivePort.sendPort.nativePort).
 * @param batch_size  Components per SQLite transaction batch (e.g. 200).
 * @return 0 on success, non-zero on error.
 */
__attribute__((visibility("default"))) int64_t appstream_parse_to_sqlite(const char *xml_path,
                                                                         const char *db_path,
                                                                         const char *language,
                                                                         int64_t dart_port,
                                                                         int64_t batch_size);

/**
 * Get the library version string.
 * @return Static string; do not free.
 */
__attribute__((visibility("default"))) const char *appstream_version(void);

#ifdef __cplusplus
}
#endif

#endif /* APPSTREAM_FFI_H */
