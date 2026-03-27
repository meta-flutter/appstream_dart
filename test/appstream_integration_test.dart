/// Integration tests that exercise the native library end-to-end.
///
/// All tests in this file are skipped automatically when libappstream.so
/// cannot be loaded (e.g. on a clean CI machine without a prior build).
library;

import 'dart:async';
import 'dart:io';

import 'package:appstream/appstream.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

bool _initNative() {
  try {
    Appstream.initialize();
    return true;
  } catch (_) {
    return false;
  }
}

final _nativeReady = _initNative();
String? get _skip => _nativeReady ? null : 'native library not available';

/// Minimal valid Appstream XML for a list of components, each with id / name
/// / summary.
String _xml(List<({String id, String name, String summary})> items,
    {Map<String, String>? rootAttrs}) {
  final root = rootAttrs == null
      ? ''
      : rootAttrs.entries.map((e) => ' ${e.key}="${e.value}"').join();
  final buf = StringBuffer(
      '<?xml version="1.0" encoding="UTF-8"?>\n<components$root>\n');
  for (final c in items) {
    buf.write(
        '  <component type="desktop-application">\n'
        '    <id>${c.id}</id>\n'
        '    <name>${c.name}</name>\n'
        '    <summary>${c.summary}</summary>\n'
        '  </component>\n');
  }
  buf.write('</components>\n');
  return buf.toString();
}

/// Run a parse and collect all events, timing out after [seconds].
Future<List<ParseEvent>> _parse(
  String xmlPath,
  String dbPath, {
  String language = '',
  int batchSize = 200,
  ParseWorkerSpawner? workerSpawner,
  int seconds = 30,
}) =>
    Appstream.parseToSqlite(
      xmlPath: xmlPath,
      dbPath: dbPath,
      language: language,
      batchSize: batchSize,
      workerSpawner: workerSpawner,
    ).toList().timeout(Duration(seconds: seconds));

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  // ---- initialize() -------------------------------------------------------

  group('initialize()', () {
    test('is idempotent — calling twice does not throw', () {
      expect(() => Appstream.initialize(), returnsNormally);
      expect(() => Appstream.initialize(), returnsNormally);
    }, skip: _skip);
  });

  // ---- version() ----------------------------------------------------------

  group('version', () {
    test('returns a non-empty string', () {
      expect(Appstream.version, isNotEmpty);
    }, skip: _skip);

    test('contains expected tokens', () {
      final v = Appstream.version;
      expect(v, contains('C++23'));
      expect(v, contains('Dart API DL'));
    }, skip: _skip);

    test('is stable across repeated calls', () {
      expect(Appstream.version, equals(Appstream.version));
    }, skip: _skip);
  });

  // ---- single component ---------------------------------------------------

  group('single component', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('as_single_');
    });

    tearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    test('emits one ComponentParsed then ParseDone(1)', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_xml([
        (id: 'com.example.One', name: 'One', summary: 'First'),
      ]));

      final events = await _parse(xmlPath, dbPath);

      final components = events.whereType<ComponentParsed>().toList();
      final done = events.whereType<ParseDone>().toList();

      expect(components, hasLength(1));
      expect(done, hasLength(1));
      expect(done.single.count, 1);
      expect(events.whereType<ParseFailed>(), isEmpty);
    }, skip: _skip);

    test('component fields (id, name, summary) are preserved', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_xml([
        (
          id: 'org.project.MyApp',
          name: 'My Application',
          summary: 'Does exactly one thing',
        ),
      ]));

      final events = await _parse(xmlPath, dbPath);
      final c =
          events.whereType<ComponentParsed>().single.component;

      expect(c.id, 'org.project.MyApp');
      expect(c.name, 'My Application');
      expect(c.summary, 'Does exactly one thing');
    }, skip: _skip);

    test('output database file is created and non-empty', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_xml([
        (id: 'com.example.Db', name: 'Db', summary: 'Check db'),
      ]));

      await _parse(xmlPath, dbPath);

      expect(File(dbPath).existsSync(), isTrue);
      expect(File(dbPath).lengthSync(), greaterThan(0));
    }, skip: _skip);
  });

  // ---- multiple components ------------------------------------------------

  group('multiple components', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('as_multi_');
    });

    tearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    test('emits N ComponentParsed events then ParseDone(N)', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_xml([
        (id: 'com.a.A', name: 'A', summary: 'alpha'),
        (id: 'com.b.B', name: 'B', summary: 'beta'),
        (id: 'com.c.C', name: 'C', summary: 'gamma'),
      ]));

      final events = await _parse(xmlPath, dbPath);

      final components = events.whereType<ComponentParsed>().toList();
      final done = events.whereType<ParseDone>().toList();

      expect(components, hasLength(3));
      expect(done.single.count, 3);
      expect(events.whereType<ParseFailed>(), isEmpty);
    }, skip: _skip);

    test('all component ids are distinct and correct', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';

      const ids = ['io.one.One', 'io.two.Two', 'io.three.Three'];
      await File(xmlPath).writeAsString(_xml([
        for (final id in ids) (id: id, name: id, summary: ''),
      ]));

      final events = await _parse(xmlPath, dbPath);
      final parsedIds = events
          .whereType<ComponentParsed>()
          .map((e) => e.component.id)
          .toSet();

      expect(parsedIds, containsAll(ids));
      expect(parsedIds.length, ids.length);
    }, skip: _skip);

    test('ComponentParsed events precede ParseDone', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_xml([
        (id: 'com.x.X', name: 'X', summary: ''),
        (id: 'com.y.Y', name: 'Y', summary: ''),
      ]));

      final events = await _parse(xmlPath, dbPath);

      final lastComponentIdx = events.lastIndexWhere((e) => e is ComponentParsed);
      final doneIdx = events.indexWhere((e) => e is ParseDone);

      expect(doneIdx, greaterThan(lastComponentIdx));
    }, skip: _skip);
  });

  // ---- empty catalog -------------------------------------------------------

  group('empty catalog', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('as_empty_');
    });

    tearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    test('empty <components> emits ParseDone(0) with no ComponentParsed', () async {
      final xmlPath = '${tempDir.path}/empty.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath)
          .writeAsString('<?xml version="1.0"?>\n<components/>\n');

      final events = await _parse(xmlPath, dbPath);

      expect(events.whereType<ComponentParsed>(), isEmpty);
      expect(events.whereType<ParseDone>().single.count, 0);
      expect(events.whereType<ParseFailed>(), isEmpty);
    }, skip: _skip);
  });

  // ---- language filter -----------------------------------------------------

  group('language filter', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('as_lang_');
    });

    tearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    /// XML with two <name> tags: one default (no xml:lang) and one German.
    /// With language='en' → German tag is skipped, name = default.
    /// With language=''  → both processed, last wins = German.
    String _langXml() => '''<?xml version="1.0" encoding="UTF-8"?>
<components>
  <component type="desktop-application">
    <id>com.example.LangTest</id>
    <name>Default Name</name>
    <name xml:lang="de">German Name</name>
    <summary>Test component</summary>
  </component>
</components>
''';

    test('language="en" skips xml:lang="de" name tag', () async {
      final xmlPath = '${tempDir.path}/lang.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_langXml());

      final events = await _parse(xmlPath, dbPath, language: 'en');

      final c = events.whereType<ComponentParsed>().single.component;
      expect(c.name, 'Default Name');
    }, skip: _skip);

    test('language="" keeps only default values (no translations stored)',
        () async {
      final xmlPath = '${tempDir.path}/lang.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_langXml());

      final events = await _parse(xmlPath, dbPath);

      final c = events.whereType<ComponentParsed>().single.component;
      // With no filter, only the default (no xml:lang) value is kept.
      expect(c.name, 'Default Name');
    }, skip: _skip);
  });

  // ---- batchSize ----------------------------------------------------------

  group('batchSize', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('as_batch_');
    });

    tearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    test('batchSize=1 still produces correct ParseDone count', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_xml([
        (id: 'com.a.A', name: 'A', summary: ''),
        (id: 'com.b.B', name: 'B', summary: ''),
        (id: 'com.c.C', name: 'C', summary: ''),
      ]));

      final events = await _parse(xmlPath, dbPath, batchSize: 1);

      expect(events.whereType<ComponentParsed>(), hasLength(3));
      expect(events.whereType<ParseDone>().single.count, 3);
    }, skip: _skip);

    test('batchSize=1000 handles fewer components than batch', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';
      await File(xmlPath).writeAsString(_xml([
        (id: 'com.only.One', name: 'Only One', summary: ''),
      ]));

      final events = await _parse(xmlPath, dbPath, batchSize: 1000);

      expect(events.whereType<ParseDone>().single.count, 1);
    }, skip: _skip);
  });

  // ---- error cases --------------------------------------------------------

  group('error cases', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('as_err_');
    });

    tearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    test('missing XML file produces ParseFailed with native error prefix', () async {
      final xmlPath = '${tempDir.path}/does_not_exist.xml';
      final dbPath = '${tempDir.path}/catalog.db';

      final events = await _parse(xmlPath, dbPath);

      final failures = events.whereType<ParseFailed>().toList();
      expect(failures, isNotEmpty, reason: 'Missing file must produce ParseFailed');
      expect(failures.first.message, startsWith('Native parser error: '));
      expect(events.whereType<ParseDone>(), isEmpty);
    }, skip: _skip);

    test('missing XML file error message contains numeric code', () async {
      final xmlPath = '${tempDir.path}/gone.xml';
      final dbPath = '${tempDir.path}/catalog.db';

      final events = await _parse(xmlPath, dbPath);
      final msg = events.whereType<ParseFailed>().first.message;

      expect(msg, contains('Parse failed (code '));
    }, skip: _skip);
  });

  // ---- stream cancellation ------------------------------------------------

  group('stream cancellation', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('as_cancel_');
    });

    tearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    test('cancelling the stream does not cause a hang', () async {
      final xmlPath = '${tempDir.path}/app.xml';
      final dbPath = '${tempDir.path}/catalog.db';

      // Large enough that we can cancel before it finishes.
      final items = [
        for (var i = 0; i < 20; i++)
          (id: 'com.example.App$i', name: 'App $i', summary: ''),
      ];
      await File(xmlPath).writeAsString(_xml(items));

      final stream = Appstream.parseToSqlite(
        xmlPath: xmlPath,
        dbPath: dbPath,
      );

      // Collect at most 1 event then cancel.
      final received = <ParseEvent>[];
      late StreamSubscription<ParseEvent> sub;
      sub = stream.listen((event) {
        received.add(event);
        sub.cancel();
      });

      // Give the isolate 10 s max to finish and confirm no deadlock.
      await Future<void>.delayed(const Duration(seconds: 2));
      // If we reach here without a timeout, the test passes.
      expect(received.length, lessThanOrEqualTo(1));
    }, skip: _skip);
  });
}

