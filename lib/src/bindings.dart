/// FFI bindings for libappstream.so
library;

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

/// Signature: int64_t appstream_init(void* data)
typedef AppstreamInitNative = Int64 Function(Pointer<Void> data);
typedef AppstreamInitDart = int Function(Pointer<Void> data);

/// Signature: int64_t appstream_parse_to_sqlite(
///   const char* xml_path, const char* db_path, const char* language,
///   int64_t dart_port, int64_t batch_size)
typedef AppstreamParseNative = Int64 Function(
    Pointer<Utf8> xmlPath,
    Pointer<Utf8> dbPath,
    Pointer<Utf8> language,
    Int64 dartPort,
    Int64 batchSize);
typedef AppstreamParseDart = int Function(
    Pointer<Utf8> xmlPath,
    Pointer<Utf8> dbPath,
    Pointer<Utf8> language,
    int dartPort,
    int batchSize);

/// Signature: const char* appstream_version(void)
typedef AppstreamVersionNative = Pointer<Utf8> Function();
typedef AppstreamVersionDart = Pointer<Utf8> Function();

/// Resolved FFI bindings.
class AppstreamBindings {
  final DynamicLibrary _lib;

  late final AppstreamInitDart init;
  late final AppstreamParseDart parseToSqlite;
  late final AppstreamVersionDart version;

  AppstreamBindings._(this._lib) {
    init = _lib
        .lookupFunction<AppstreamInitNative, AppstreamInitDart>('appstream_init');

    parseToSqlite = _lib
        .lookupFunction<AppstreamParseNative, AppstreamParseDart>(
            'appstream_parse_to_sqlite');

    version = _lib
        .lookupFunction<AppstreamVersionNative, AppstreamVersionDart>(
            'appstream_version');
  }

  /// Load the shared library from the lib/ directory relative to the project root.
  factory AppstreamBindings.load() {
    final libName = 'libappstream.so';

    // Search in lib/ relative to the executable, script, or current directory.
    final candidates = [
      '${File(Platform.resolvedExecutable).parent.path}/lib/$libName',
      '${Directory.current.path}/lib/$libName',
      '${Platform.script.toFilePath()}/../lib/$libName',
      '${Platform.script.toFilePath()}/../../lib/$libName',
      libName, // system library path
    ];

    for (final path in candidates) {
      final file = File(path);
      if (file.existsSync()) {
        return AppstreamBindings._(DynamicLibrary.open(file.absolute.path));
      }
    }

    // Fallback: let the dynamic linker find it
    return AppstreamBindings._(DynamicLibrary.open(libName));
  }
}
