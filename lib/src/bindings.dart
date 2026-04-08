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
typedef AppstreamParseNative =
    Int64 Function(
      Pointer<Utf8> xmlPath,
      Pointer<Utf8> dbPath,
      Pointer<Utf8> language,
      Int64 dartPort,
      Int64 batchSize,
    );
typedef AppstreamParseDart =
    int Function(
      Pointer<Utf8> xmlPath,
      Pointer<Utf8> dbPath,
      Pointer<Utf8> language,
      int dartPort,
      int batchSize,
    );

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
    init = _lib.lookupFunction<AppstreamInitNative, AppstreamInitDart>(
      'appstream_init',
    );

    parseToSqlite = _lib
        .lookupFunction<AppstreamParseNative, AppstreamParseDart>(
          'appstream_parse_to_sqlite',
        );

    version = _lib.lookupFunction<AppstreamVersionNative, AppstreamVersionDart>(
      'appstream_version',
    );
  }

  /// Load the shared library.
  ///
  /// Search order (designed to work across the standard Flutter Linux
  /// embedder, plain `dart run` / `dart test`, and alternative embedders
  /// such as ivi-homescreen where `Platform.resolvedExecutable` points
  /// at a system binary like `/usr/bin/homescreen` and LD_LIBRARY_PATH
  /// is not honored):
  ///
  /// 1. Bare `dlopen("libappstream.so")` — uses the system loader,
  ///    which respects the embedder's RPATH/RUNPATH (the standard
  ///    Flutter Linux runner sets `$ORIGIN/lib`) and `/etc/ld.so.cache`.
  /// 2. **Sibling-of-libapp lookup via `/proc/self/maps`**. Flutter
  ///    embedders mmap the AOT snapshot `libapp.so` from the bundle's
  ///    `lib/` directory; we can read the loaded mapping and look for
  ///    `libappstream.so` next to it. This is the branch that fixes
  ///    loading on ivi-homescreen, where the embedder lives outside
  ///    the bundle and LD_LIBRARY_PATH is not used.
  /// 3. Newest build under `.dart_tool/hooks_runner/shared/appstream_dart/`
  ///    (produced by `hook/build.dart`), so plain `dart run` / `dart
  ///    test` invocations pick up the artifact built by the package
  ///    hook automatically. Patterned after jwinarske/pw_dart.
  /// 4. Bundle-relative paths derived from `Platform.script`
  ///    (`scriptDir/lib`, `../lib`, `../../lib`, `../../../lib`).
  /// 5. Executable-relative paths (`exeDir/lib/`, `exeDir/`).
  /// 6. CWD + `/lib/`, `/build/`, `/src/build/`.
  /// 7. Each `LD_LIBRARY_PATH` directory, opened by absolute path.
  factory AppstreamBindings.load({String? libraryPath}) {
    const libName = 'libappstream.so';

    if (libraryPath != null) {
      return AppstreamBindings._(DynamicLibrary.open(libraryPath));
    }

    final errors = <String>[];

    // 1. System loader first.
    try {
      return AppstreamBindings._(DynamicLibrary.open(libName));
    } catch (e) {
      errors.add('dlopen($libName): $e');
    }

    // 2. Sibling-of-libapp.so via /proc/self/maps (fixes ivi-homescreen).
    final fromMaps = _findSiblingOfLoadedLib(libName);
    if (fromMaps != null) {
      try {
        return AppstreamBindings._(DynamicLibrary.open(fromMaps));
      } catch (e) {
        errors.add('$fromMaps: $e');
      }
    }

    final candidates = <String>[];

    // 3. .dart_tool/hooks_runner artifact for `dart run` / `dart test`.
    final fromHook = _findInHooksRunner(libName);
    if (fromHook != null) candidates.add(fromHook);

    // 4. Bundle-relative paths derived from Platform.script.
    try {
      final scriptDir = File(Platform.script.toFilePath()).parent.path;
      candidates.addAll([
        '$scriptDir/lib/$libName',
        '$scriptDir/../lib/$libName',
        '$scriptDir/../../lib/$libName',
        '$scriptDir/../../../lib/$libName',
      ]);
    } catch (_) {}

    // 5–6. Executable- and CWD-relative paths.
    final exeDir = File(Platform.resolvedExecutable).parent.path;
    candidates.addAll([
      '$exeDir/lib/$libName',
      '$exeDir/$libName',
      '${Directory.current.path}/lib/$libName',
      '${Directory.current.path}/build/$libName',
      '${Directory.current.path}/src/build/$libName',
    ]);

    // 7. LD_LIBRARY_PATH directories opened by absolute path.
    final ldPath = Platform.environment['LD_LIBRARY_PATH'] ?? '';
    for (final dir in ldPath.split(':')) {
      if (dir.isNotEmpty) {
        candidates.add('$dir/$libName');
      }
    }

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

    throw StateError(
      'Failed to load $libName. Searched:\n'
      '  dlopen($libName) via system loader\n'
      '${candidates.map((p) => '  $p (${File(p).existsSync() ? "exists" : "not found"})').join('\n')}\n'
      'Errors:\n${errors.join('\n')}\n'
      'Platform.resolvedExecutable=${Platform.resolvedExecutable}\n'
      'Platform.script=${Platform.script}\n'
      'Directory.current=${Directory.current.path}\n'
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

  /// Walk `/proc/self/maps` to find a directory that already has a
  /// Flutter-bundled `.so` loaded (libapp.so, libflutter_*.so, or any
  /// other library mapped from a path ending in `/lib/`), and return
  /// `<that dir>/<libName>` if it exists on disk.
  ///
  /// This is the fallback that lets us locate `libappstream.so` on
  /// embedders like ivi-homescreen, where the embedder binary lives
  /// outside the bundle and LD_LIBRARY_PATH is not used to find
  /// bundled libraries.
  ///
  /// Returns null if `/proc/self/maps` cannot be read (non-Linux,
  /// sandboxed environments, etc.) or if no matching directory is
  /// found.
  static String? _findSiblingOfLoadedLib(String libName) {
    try {
      final maps = File('/proc/self/maps');
      if (!maps.existsSync()) return null;

      // Collect unique directories of mapped files, preferring those
      // that look like a Flutter bundle's lib/ directory.
      final seen = <String>{};
      final preferred = <String>[];
      final fallback = <String>[];

      for (final line in maps.readAsLinesSync()) {
        // Each line ends with the file path (or '[anon]', '[stack]'…).
        // Split on whitespace and take the last token if it starts with '/'.
        final lastSpace = line.lastIndexOf(' ');
        if (lastSpace < 0) continue;
        final path = line.substring(lastSpace + 1);
        if (!path.startsWith('/')) continue;

        final slash = path.lastIndexOf('/');
        if (slash <= 0) continue;
        final dir = path.substring(0, slash);
        if (!seen.add(dir)) continue;

        // Prefer dirs that look like a Flutter bundle's lib/ dir or that
        // already host libapp.so / libflutter_*.so.
        final base = path.substring(slash + 1);
        if (dir.endsWith('/lib') ||
            base == 'libapp.so' ||
            base.startsWith('libflutter_')) {
          preferred.add(dir);
        } else {
          fallback.add(dir);
        }
      }

      for (final dir in [...preferred, ...fallback]) {
        final candidate = '$dir/$libName';
        if (File(candidate).existsSync()) return candidate;
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
