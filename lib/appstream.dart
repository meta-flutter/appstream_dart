/// Appstream parser — Dart API for the C++23 FFI bridge.
///
/// Usage:
/// ```dart
/// Appstream.initialize();
/// final stream = Appstream.parseToSqlite(
///     xmlPath: '/path/to/appstream.xml',
///     dbPath: '/path/to/catalog.db',
/// );
/// await for (final event in stream) {
///   print('${event.id}: ${event.name}');
/// }
/// ```
library;

import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'src/bindings.dart';

typedef ParseWorkerSpawner = Future<Isolate> Function(
    void Function(Map<String, Object>) entryPoint, Map<String, Object> args);

Map<String, String> _workerErrorPayload(
    String phase, Object error, StackTrace stackTrace) {
  return {
    'type': 'ERROR',
    'phase': phase,
    'error': error.toString(),
    'stack': stackTrace.toString(),
  };
}

void _parseToSqliteWorker(Map<String, Object> args) {
  final xmlPath = args['xmlPath']! as String;
  final dbPath = args['dbPath']! as String;
  final language = args['language']! as String;
  final nativePort = args['nativePort']! as int;
  final batchSize = args['batchSize']! as int;
  final resultPort = args['resultPort']! as SendPort;

  late final AppstreamBindings bindings;
  try {
    bindings = AppstreamBindings.load();
  } catch (e, st) {
    resultPort.send(_workerErrorPayload('load_bindings', e, st));
    return;
  }

  final xmlPathNative = xmlPath.toNativeUtf8();
  final dbPathNative = dbPath.toNativeUtf8();
  final languageNative = language.toNativeUtf8();

  try {
    bindings.parseToSqlite(
      xmlPathNative,
      dbPathNative,
      languageNative,
      nativePort,
      batchSize,
    );
    resultPort.send('OK');
  } catch (e, st) {
    resultPort.send(_workerErrorPayload('ffi_parse', e, st));
  } finally {
    malloc.free(xmlPathNative);
    malloc.free(dbPathNative);
    malloc.free(languageNative);
  }
}

/// A component notification received from the C++ parser.
class ComponentEvent {
  final String id;
  final String name;
  final String summary;

  ComponentEvent({required this.id, required this.name, required this.summary});

  @override
  String toString() => '$id: $name';
}

/// Parse completion event.
class ParseComplete {
  final int componentCount;
  ParseComplete(this.componentCount);
}

/// Parse error event.
class ParseError {
  final String message;
  ParseError(this.message);
}

/// Sealed type for stream events.
sealed class ParseEvent {}

class ComponentParsed extends ParseEvent {
  final ComponentEvent component;
  ComponentParsed(this.component);
}

class ParseDone extends ParseEvent {
  final int count;
  ParseDone(this.count);
}

class ParseFailed extends ParseEvent {
  final String message;
  ParseFailed(this.message);
}

/// High-level API for the appstream parser.
abstract final class Appstream {
  static AppstreamBindings? _bindings;
  static bool _initialized = false;

  /// Load the shared library and initialize the Dart API DL protocol.
  /// Must be called once before any other Appstream method.
  static void initialize() {
    if (_initialized) return;

    _bindings = AppstreamBindings.load();

    // Pass NativeApi.initializeApiDLData to the C++ side so it can
    // call Dart_PostCObject_DL from any thread.
    final result = _bindings!.init(NativeApi.initializeApiDLData);
    if (result != 0) {
      throw StateError('Failed to initialize Dart API DL (result=$result)');
    }

    _initialized = true;
  }

  /// Get the native library version string.
  static String get version {
    _ensureInitialized();
    return _bindings!.version().toDartString();
  }

  /// Parse an appstream XML file and stream to SQLite.
  ///
  /// Returns a [Stream] of [ParseEvent]s:
  /// - [ComponentParsed] for each component written to the database
  /// - [ParseDone] when parsing completes successfully
  /// - [ParseFailed] on error
  ///
  /// The C++ parser runs on a helper isolate so the main isolate
  /// remains responsive.
  ///
  /// Parameters:
  /// - [xmlPath]: Path to the appstream.xml file.
  /// - [dbPath]: Path for the output SQLite database.
  /// - [language]: Language filter (e.g. 'en'), or empty for all.
  /// - [batchSize]: Components per SQLite transaction batch.
  /// - [workerSpawner]: Optional isolate spawner override (useful for tests).
  static Stream<ParseEvent> parseToSqlite({
    required String xmlPath,
    required String dbPath,
    String language = '',
    int batchSize = 200,
    ParseWorkerSpawner? workerSpawner,
  }) {
    _ensureInitialized();

    final controller = StreamController<ParseEvent>();
    final receivePort = RawReceivePort();
    final workerResultPort = ReceivePort();
    Isolate? workerIsolate;
    var closed = false;

    void closeAll() {
      if (closed) return;
      closed = true;
      receivePort.close();
      workerResultPort.close();
      if (!controller.isClosed) {
        controller.close();
      }
      workerIsolate?.kill(priority: Isolate.immediate);
      workerIsolate = null;
    }

    controller.onCancel = closeAll;

    receivePort.handler = (dynamic message) {
      if (message is Uint8List) {
        // Decode the tab-delimited string from C++
        final str = String.fromCharCodes(message);
        final parts = str.split('\t');

        if (parts.isNotEmpty && parts[0] == 'DONE') {
          final count = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;
          controller.add(ParseDone(count));
          closeAll();
        } else if (parts.isNotEmpty && parts[0] == 'ERROR') {
          final msg = parts.length > 1 ? parts[1] : 'Unknown error';
          controller.add(ParseFailed('Native parser error: $msg'));
          closeAll();
        } else if (parts.length >= 2) {
          controller.add(ComponentParsed(ComponentEvent(
            id: parts[0],
            name: parts.length > 1 ? parts[1] : '',
            summary: parts.length > 2 ? parts[2] : '',
          )));
        }
      }
    };

    // Run the blocking FFI call on a helper isolate.
    // Dart_PostCObject_DL is thread-safe, so the C++ code can post
    // messages to our ReceivePort from the isolate's thread.
    final nativePort = receivePort.sendPort.nativePort;
    final args = <String, Object>{
      'xmlPath': xmlPath,
      'dbPath': dbPath,
      'language': language,
      'nativePort': nativePort,
      'batchSize': batchSize,
      'resultPort': workerResultPort.sendPort,
    };

    workerResultPort.listen((dynamic message) {
      if (message is Map) {
        final type = message['type'];
        if (type == 'ERROR') {
          final phase = message['phase'] ?? 'unknown';
          final err = message['error'] ?? 'unknown failure';
          controller.add(ParseFailed('Isolate $phase error: $err'));
          closeAll();
        }
      } else if (message is String && message.startsWith('ERROR:')) {
        final err = message.substring('ERROR:'.length);
        controller.add(ParseFailed('Isolate worker error: $err'));
        closeAll();
      }
    });

    final spawn = workerSpawner ??
        (void Function(Map<String, Object>) entryPoint,
                Map<String, Object> workerArgs) =>
            Isolate.spawn<Map<String, Object>>(entryPoint, workerArgs);

    Future<void>(() async {
      try {
        workerIsolate = await spawn(_parseToSqliteWorker, args);
      } catch (_) {
        // Fallback path for isolate startup failures.
        _parseToSqliteWorker(args);
      }
    }).catchError((e) {
      controller.add(ParseFailed('Isolate startup error: $e'));
      closeAll();
    });

    return controller.stream;
  }

  static void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('Call Appstream.initialize() first');
    }
  }
}
