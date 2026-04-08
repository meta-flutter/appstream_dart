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
  /// Search order (patterned after jwinarske/pw_dart):
  /// 1. Newest build under `.dart_tool/hooks_runner/shared/appstream_dart/`
  ///    (produced by `hook/build.dart`).
  /// 2. Executable directory + /lib/
  /// 3. Executable directory
  /// 4. CWD + /lib/  and ./build/  and ./src/build/
  /// 5. Platform.script relative paths (if available)
  /// 6. Each LD_LIBRARY_PATH directory (explicit File.open, not dlopen)
  /// 7. dlopen fallback (system linker)
  factory AppstreamBindings.load({String? libraryPath}) {
    const libName = 'libappstream.so';

    if (libraryPath != null) {
      return AppstreamBindings._(DynamicLibrary.open(libraryPath));
    }

    final candidates = <String>[];

    final fromHook = _findInHooksRunner(libName);
    if (fromHook != null) candidates.add(fromHook);

    final exeDir = File(Platform.resolvedExecutable).parent.path;
    candidates.addAll([
      '$exeDir/lib/$libName',
      '$exeDir/$libName',
      '${Directory.current.path}/lib/$libName',
      '${Directory.current.path}/build/$libName',
      '${Directory.current.path}/src/build/$libName',
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

  /// Walk up from CWD looking for the most recent shared library produced
  /// by the `package:hooks` build runner. Mirrors the discovery strategy
  /// used by jwinarske/pw_dart so plain `dart run` / `dart test` invocations
  /// pick up the artifact built by `hook/build.dart` automatically.
  static String? _findInHooksRunner(String libName) {
    var dir = Directory.current;
    for (var i = 0; i < 6; i++) {
      final root = Directory(
        '${dir.path}/.dart_tool/hooks_runner/shared/appstream_dart/build',
      );
      if (root.existsSync()) {
        File? newest;
        var newestTime = DateTime.fromMillisecondsSinceEpoch(0);
        for (final entity in root.listSync(recursive: true)) {
          if (entity is File && entity.path.endsWith('/$libName')) {
            final mtime = entity.statSync().modified;
            if (mtime.isAfter(newestTime)) {
              newest = entity;
              newestTime = mtime;
            }
          }
        }
        if (newest != null) return newest.path;
      }
      final parent = dir.parent;
      if (parent.path == dir.path) break;
      dir = parent;
    }
    return null;
  }
}
