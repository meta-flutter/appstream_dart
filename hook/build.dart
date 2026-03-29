import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> args) => build(args, _build);

/// Build the appstream native library from C++ source.
///
/// Requires a C++23 compiler:
/// - GCC 13+
/// - Clang 18+ (std::expected polyfilled when not available)
///
/// Also requires SQLite3 development libraries.
Future<void> _build(BuildInput input, BuildOutputBuilder output) async {
  final builder = CBuilder.library(
    name: 'appstream',
    assetName: 'package:appstream_dart/src/appstream_native.dart',
    sources: [
      'src/dart_api_dl.cpp',
      'src/appstream_ffi.cpp',
      'src/AppStreamParser.cpp',
      'src/Component.cpp',
      'src/XmlScanner.cpp',
      'src/SqliteWriter.cpp',
      'src/StringPool.cpp',
    ],
    includes: ['include'],
    libraries: ['sqlite3', 'pthread'],
    language: Language.cpp,
    std: 'c++23',
    cppLinkStdLib: 'stdc++',
    flags: [
      '-fvisibility=hidden',
    ],
  );

  await builder.run(input: input, output: output);
}
