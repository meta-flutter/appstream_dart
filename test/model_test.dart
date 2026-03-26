/// Unit tests for pure-Dart data model classes.
///
/// No native library is needed — none of these tests call
/// Appstream.initialize() or touch FFI.
library;

import 'package:appstream/appstream.dart';
import 'package:test/test.dart';

void main() {
  // ----------------------------------------------------------------
  // ComponentEvent
  // ----------------------------------------------------------------
  group('ComponentEvent', () {
    test('stores id, name, summary', () {
      final e = ComponentEvent(
        id: 'com.example.App',
        name: 'My App',
        summary: 'Does things',
      );
      expect(e.id, 'com.example.App');
      expect(e.name, 'My App');
      expect(e.summary, 'Does things');
    });

    test('toString returns "id: name"', () {
      final e = ComponentEvent(
          id: 'org.foo.Bar', name: 'Bar', summary: 'ignored');
      expect(e.toString(), 'org.foo.Bar: Bar');
    });

    test('accepts empty summary', () {
      final e = ComponentEvent(id: 'a', name: 'b', summary: '');
      expect(e.summary, isEmpty);
    });

    test('accepts empty id and name', () {
      final e = ComponentEvent(id: '', name: '', summary: 'x');
      expect(e.toString(), ': ');
    });
  });

  // ----------------------------------------------------------------
  // ParseDone
  // ----------------------------------------------------------------
  group('ParseDone', () {
    test('stores count', () {
      expect(ParseDone(42).count, 42);
    });

    test('zero count is valid', () {
      expect(ParseDone(0).count, 0);
    });

    test('is a ParseEvent', () {
      expect(ParseDone(0), isA<ParseEvent>());
    });
  });

  // ----------------------------------------------------------------
  // ParseFailed
  // ----------------------------------------------------------------
  group('ParseFailed', () {
    test('stores message', () {
      expect(ParseFailed('boom').message, 'boom');
    });

    test('accepts empty message', () {
      expect(ParseFailed('').message, isEmpty);
    });

    test('is a ParseEvent', () {
      expect(ParseFailed('x'), isA<ParseEvent>());
    });
  });

  // ----------------------------------------------------------------
  // ComponentParsed
  // ----------------------------------------------------------------
  group('ComponentParsed', () {
    test('stores component', () {
      final evt =
          ComponentEvent(id: 'a', name: 'b', summary: 'c');
      final parsed = ComponentParsed(evt);
      expect(parsed.component.id, 'a');
      expect(parsed.component.name, 'b');
      expect(parsed.component.summary, 'c');
    });

    test('is a ParseEvent', () {
      expect(
        ComponentParsed(ComponentEvent(id: '', name: '', summary: '')),
        isA<ParseEvent>(),
      );
    });

    test('component toString is accessible via ComponentParsed', () {
      final c = ComponentEvent(id: 'x', name: 'y', summary: '');
      expect(ComponentParsed(c).component.toString(), 'x: y');
    });
  });

  // ----------------------------------------------------------------
  // Sealed ParseEvent hierarchy
  // ----------------------------------------------------------------
  group('ParseEvent sealed hierarchy', () {
    test('every subtype is a ParseEvent', () {
      final events = <ParseEvent>[
        ComponentParsed(ComponentEvent(id: '', name: '', summary: '')),
        ParseDone(0),
        ParseFailed(''),
      ];
      for (final e in events) {
        expect(e, isA<ParseEvent>());
      }
    });

    test('exhaustive switch covers all subtypes', () {
      String classify(ParseEvent e) => switch (e) {
            ComponentParsed() => 'component',
            ParseDone() => 'done',
            ParseFailed() => 'failed',
          };

      expect(
        classify(
            ComponentParsed(ComponentEvent(id: '', name: '', summary: ''))),
        'component',
      );
      expect(classify(ParseDone(1)), 'done');
      expect(classify(ParseFailed('err')), 'failed');
    });

    test('ComponentParsed is not ParseDone', () {
      final e = ComponentParsed(
          ComponentEvent(id: 'x', name: 'y', summary: ''));
      expect(e, isNot(isA<ParseDone>()));
      expect(e, isNot(isA<ParseFailed>()));
    });

    test('ParseDone is not ParseFailed', () {
      expect(ParseDone(0), isNot(isA<ParseFailed>()));
      expect(ParseDone(0), isNot(isA<ComponentParsed>()));
    });
  });

  // ----------------------------------------------------------------
  // Legacy ParseComplete / ParseError (still part of public API)
  // ----------------------------------------------------------------
  group('ParseComplete', () {
    test('stores componentCount', () {
      expect(ParseComplete(7).componentCount, 7);
      expect(ParseComplete(0).componentCount, 0);
    });
  });

  group('ParseError (legacy class)', () {
    test('stores message', () {
      expect(ParseError('something broke').message, 'something broke');
    });

    test('accepts empty message', () {
      expect(ParseError('').message, isEmpty);
    });
  });
}

