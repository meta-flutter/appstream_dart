/// Tests for the uninitialized state of Appstream.
///
/// IMPORTANT: this file must NOT call Appstream.initialize().
/// dart test runs each test file in its own VM isolate, so static state
/// starts fresh here with _initialized = false.
library;

import 'package:appstream_dart/appstream.dart';
import 'package:test/test.dart';

void main() {
  group('Appstream before initialize()', () {
    test('version throws StateError', () {
      expect(() => Appstream.version, throwsA(isA<StateError>()));
    });

    test('parseToSqlite throws StateError', () {
      expect(
        () => Appstream.parseToSqlite(xmlPath: 'x.xml', dbPath: 'x.db'),
        throwsA(isA<StateError>()),
      );
    });

    test('StateError message mentions initialize()', () {
      expect(
        () => Appstream.version,
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('initialize()'),
          ),
        ),
      );
    });

    test('parseToSqlite StateError message mentions initialize()', () {
      expect(
        () => Appstream.parseToSqlite(xmlPath: 'a', dbPath: 'b'),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('initialize()'),
          ),
        ),
      );
    });
  });
}
