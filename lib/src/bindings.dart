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

  /// Load the shared library.
  ///
  /// Search order:
  /// 1. Executable directory + /lib/
  /// 2. Executable directory
  /// 3. CWD + /lib/
  /// 4. Platform.script relative paths (if available)
  /// 5. Each LD_LIBRARY_PATH directory (explicit File.open, not dlopen)
  /// 6. dlopen fallback (system linker)
  factory AppstreamBindings.load() {
    const libName = 'libappstream.so';
    final candidates = <String>[];
    final exeDir = File(Platform.resolvedExecutable).parent.path;
    candidates.addAll([
      '$exeDir/lib/$libName',
      '$exeDir/$libName',
      '${Directory.current.path}/lib/$libName',
    ]);

    try {
      final scriptDir = File(Platform.script.toFilePath()).parent.path;
      candidates.add('$scriptDir/lib/$libName');
      candidates.add('$scriptDir/../lib/$libName');
    } catch (_) {}

    // Search LD_LIBRARY_PATH directories explicitly via absolute path.
    final ldPath = Platform.environment['LD_LIBRARY_PATH'] ?? '';
    for (final dir in ldPath.split(':')) {
      if (dir.isNotEmpty) {
        candidates.add('$dir/$libName');
      }
    }

    final errors = <String>[];

    for (final path in candidates) {
      final file = File(path);
      if (file.existsSync()) {
        try {
          return AppstreamBindings._(DynamicLibrary.open(file.absolute.path));
        } catch (e) {
          errors.add('${file.absolute.path}: $e');
        }
      }
    }

    try {
      return AppstreamBindings._(DynamicLibrary.open(libName));
    } catch (e) {
      errors.add('dlopen($libName): $e');
    }

    throw StateError(
      'Failed to load $libName. Searched:\n'
      '${candidates.map((p) => '  $p (${File(p).existsSync() ? "exists" : "not found"})').join('\n')}\n'
      'Errors:\n${errors.join('\n')}\n'
      'LD_LIBRARY_PATH=${Platform.environment['LD_LIBRARY_PATH'] ?? '(not set)'}',
    );
  }
}
