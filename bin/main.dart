/// Appstream CLI — Fetches Flathub appstream XML and streams to SQLite.
///
/// Usage:
///   dart run bin/main.dart [--xml <path>] [--db <path>] [--lang <code>]
///
/// Without --xml, downloads from Flathub automatically.
library;

import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:appstream_dart/appstream.dart';

const flathubUrls = [
  'https://dl.flathub.org/repo/appstream/x86_64/appstream.xml.gz',
  'https://flathub.org/repo/appstream/x86_64/appstream.xml.gz',
];

// ================================================================
// Progress bar
// ================================================================

class ProgressBar {
  final String label;
  final int width;
  final Stopwatch _sw = Stopwatch();
  int _lastLineLen = 0;

  ProgressBar({required this.label, this.width = 40});

  void start() => _sw.start();

  /// Update with known total (determinate).
  void update(int current, int total) {
    final fraction = total > 0 ? (current / total).clamp(0.0, 1.0) : 0.0;
    final filled = (fraction * width).round();
    final empty = width - filled;
    final pct = (fraction * 100).toStringAsFixed(1).padLeft(5);
    final currentStr = _formatBytes(current);
    final totalStr = _formatBytes(total);
    final elapsed = _sw.elapsed;
    final rate =
        elapsed.inMilliseconds > 0 ? current / elapsed.inMilliseconds * 1000 : 0;
    final rateStr = _formatBytes(rate.round());

    final line =
        '\r  $label [${'█' * filled}${'░' * empty}] $pct%  $currentStr / $totalStr  $rateStr/s';
    _write(line);
  }

  /// Update with unknown total (indeterminate — show count + rate).
  void updateCount(int current, {String unit = 'items'}) {
    final elapsed = _sw.elapsed;
    final rate = elapsed.inMilliseconds > 0
        ? (current / elapsed.inMilliseconds * 1000).round()
        : 0;

    // Spinner animation
    const spinChars = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'];
    final spin = spinChars[current % spinChars.length];

    final line =
        '\r  $label $spin  $current $unit  ($rate $unit/s)  ${_formatDuration(elapsed)}';
    _write(line);
  }

  /// Update with count and estimated total.
  void updateCountOf(int current, int estimatedTotal, {String unit = ''}) {
    final fraction =
        estimatedTotal > 0 ? (current / estimatedTotal).clamp(0.0, 1.0) : 0.0;
    final filled = (fraction * width).round();
    final empty = width - filled;
    final pct = (fraction * 100).toStringAsFixed(1).padLeft(5);
    final elapsed = _sw.elapsed;
    final rate = elapsed.inMilliseconds > 0
        ? (current / elapsed.inMilliseconds * 1000).round()
        : 0;

    // ETA
    String eta;
    if (rate > 0 && current < estimatedTotal) {
      final remaining = ((estimatedTotal - current) / rate).round();
      eta = 'ETA ${_formatDuration(Duration(seconds: remaining))}';
    } else {
      eta = '';
    }

    final unitStr = unit.isEmpty ? '' : ' $unit';
    final line =
        '\r  $label [${'█' * filled}${'░' * empty}] $pct%  $current / ~$estimatedTotal$unitStr  $rate/s  $eta';
    _write(line);
  }

  void finish([String? message]) {
    _sw.stop();
    if (message != null) {
      _write('\r  $label $message');
    }
    stdout.writeln();
  }

  /// Show a 100% bar then the finish message, clearing any C++ output that
  /// may have been injected on the current line.
  void finishComplete(int current, int total,
      {String unit = '', String? message}) {
    _sw.stop();
    final pct = '100.0'.padLeft(5);
    final unitStr = unit.isEmpty ? '' : ' $unit';
    // \x1B[2K erases the entire current line, \r returns to column 0.
    final bar =
        '\x1B[2K\r  $label [${'█' * width}] $pct%  $current / $total$unitStr';
    stdout.writeln(bar);
    if (message != null) {
      stdout.writeln('  $label $message');
    }
  }

  void _write(String line) {
    // Pad with spaces to overwrite any previous longer line
    final padded =
        line.length < _lastLineLen ? line.padRight(_lastLineLen) : line;
    stdout.write(padded);
    _lastLineLen = line.length;
  }

  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  static String _formatDuration(Duration d) {
    if (d.inSeconds < 60) return '${d.inSeconds}s';
    final m = d.inMinutes;
    final s = d.inSeconds % 60;
    return '${m}m ${s}s';
  }
}

// ================================================================
// Main
// ================================================================

Future<void> main(List<String> args) async {
  // ---- Parse CLI arguments ----
  String? xmlPath;
  String dbPath = 'catalog.db';
  String language = '';
  bool verbose = false;

  for (int i = 0; i < args.length; i++) {
    switch (args[i]) {
      case '--xml':
        if (++i >= args.length) { stderr.writeln('--xml requires a value'); exit(1); }
        xmlPath = args[i];
      case '--db':
        if (++i >= args.length) { stderr.writeln('--db requires a value'); exit(1); }
        dbPath = args[i];
      case '--lang':
        if (++i >= args.length) { stderr.writeln('--lang requires a value'); exit(1); }
        language = args[i];
      case '--verbose' || '-v':
        verbose = true;
      case '--help' || '-h':
        _printUsage();
        exit(0);
    }
  }

  // ---- Download if needed ----
  xmlPath ??= await _fetchAppstream();

  if (!File(xmlPath).existsSync()) {
    stderr.writeln('Error: XML file not found: $xmlPath');
    exit(1);
  }

  final xmlSize = File(xmlPath).lengthSync();
  final xmlMiB = (xmlSize / (1024 * 1024)).toStringAsFixed(2);
  print('');
  print('XML file: $xmlPath ($xmlMiB MiB)');
  print('Output DB: $dbPath');
  if (language.isNotEmpty) print('Language:  $language');
  print('');

  // ---- Initialize native library ----
  Appstream.initialize();
  print('Native:    ${Appstream.version}');
  print('');

  // ---- Parse and stream with progress bar ----
  final stopwatch = Stopwatch()..start();
  int count = 0;

  // Estimate ~2000 components for Flathub (used for ETA, adjusted as we go)
  int estimatedTotal = _estimateComponentCount(xmlSize);

  print('Streaming to SQLite...');
  final parseBar =
      ProgressBar(label: 'Parsing', width: 35);
  parseBar.start();

  String? lastId;
  String? lastName;

  await for (final event in Appstream.parseToSqlite(
    xmlPath: xmlPath,
    dbPath: dbPath,
    language: language,
    batchSize: 200,
  )) {
    switch (event) {
      case ComponentParsed(:final component):
        count++;
        lastId = component.id;
        lastName = component.name;

        // Adjust estimate upward if we're already past it
        if (count > estimatedTotal) {
          estimatedTotal = (count * 1.2).round();
        }

        parseBar.updateCountOf(count, estimatedTotal, unit: 'components');

        if (verbose) {
          parseBar.finish();
          final summary = component.summary.length > 55
              ? '${component.summary.substring(0, 52)}...'
              : component.summary;
          print('  ${component.id}');
          print('    ${component.name} — $summary');
          parseBar.start();
        }

      case ParseDone(:final count):
        parseBar.finishComplete(count, count,
            unit: 'components',
            message: '✓ $count components in ${stopwatch.elapsedMilliseconds} ms');
        stopwatch.stop();
        print('');
        print('Database:  $dbPath (${_fileSizeMiB(dbPath)} MiB)');
        if (lastId != null) {
          print('Last:      $lastId ($lastName)');
        }

      case ParseFailed(:final message):
        parseBar.finish('✗ FAILED');
        stderr.writeln('Error: $message');
        exit(1);
    }
  }

  // ---- DB stats ----
  await _printDbMetrics(dbPath);
}

/// Rough estimate: ~1 component per 15-20 KB of XML
int _estimateComponentCount(int xmlBytes) {
  return max(100, xmlBytes ~/ 18000);
}

// ================================================================
// Streaming HTTP download with progress bar
// ================================================================

Future<String> _fetchAppstream() async {
  final home = Platform.environment['HOME'] ?? Directory.systemTemp.path;
  final cacheDir = p.join(home, '.cache', 'appstream');
  await Directory(cacheDir).create(recursive: true);

  final gzPath = p.join(cacheDir, 'appstream.xml.gz');
  final xmlPath = p.join(cacheDir, 'appstream.xml');

  // Use cached XML if it's less than 1 hour old
  final xmlFile = File(xmlPath);
  if (xmlFile.existsSync()) {
    final age = DateTime.now().difference(xmlFile.lastModifiedSync());
    if (age.inHours < 1) {
      print('Using cached XML: $xmlPath');
      return xmlPath;
    }
  }

  print('Downloading Flathub appstream data...');
  for (final url in flathubUrls) {
    print('  $url');
  }
  print('');

  // Streaming download so we can show progress
  final client = http.Client();
  try {
    final errors = <String>[];
    var downloaded = false;

    for (final url in flathubUrls) {
      final request = http.Request('GET', Uri.parse(url));
      final response = await client.send(request);

      if (response.statusCode != 200) {
        errors.add('$url -> HTTP ${response.statusCode}');
        await response.stream.drain();
        continue;
      }

      final contentLength = response.contentLength ?? 0;
      final downloadBar = ProgressBar(label: 'Download', width: 35);
      downloadBar.start();

      final sink = File(gzPath).openWrite();
      int received = 0;

      await for (final chunk in response.stream) {
        sink.add(chunk);
        received += chunk.length;

        if (contentLength > 0) {
          downloadBar.update(received, contentLength);
        } else {
          downloadBar.updateCount(received, unit: 'bytes');
        }
      }

      await sink.close();
      downloadBar.finish('✓ ${ProgressBar._formatBytes(received)}');
      downloaded = true;
      break;
    }

    if (!downloaded) {
      stderr.writeln('HTTP error: no usable Flathub endpoint.');
      for (final error in errors) {
        stderr.writeln('  $error');
      }
      exit(1);
    }
  } finally {
    client.close();
  }

  // Decompress
  print('');
  final decompBar = ProgressBar(label: 'Decompress', width: 35);
  decompBar.start();

  final gzBytes = await File(gzPath).readAsBytes();
  decompBar.updateCount(gzBytes.length, unit: 'bytes read');

  final xmlBytes = gzip.decode(gzBytes);
  await File(xmlPath).writeAsBytes(xmlBytes);

  decompBar.finish(
      '✓ ${ProgressBar._formatBytes(gzBytes.length)} → ${ProgressBar._formatBytes(xmlBytes.length)}');
  print('');

  // Basic integrity check: verify the decompressed file looks like AppStream XML
  final header = String.fromCharCodes(xmlBytes.take(256));
  if (!header.contains('<components') && !header.contains('<component')) {
    stderr.writeln('Error: downloaded file does not appear to be AppStream XML');
    exit(1);
  }

  return xmlPath;
}

// ================================================================
// Helpers
// ================================================================

String _fileSizeMiB(String path) {
  final file = File(path);
  if (!file.existsSync()) return '?';
  return (file.lengthSync() / (1024 * 1024)).toStringAsFixed(2);
}

const _typeNames = {
  0: 'Unknown',
  1: 'Generic',
  2: 'Desktop App',
  3: 'Console App',
  4: 'Web App',
  5: 'Addon',
  6: 'Font',
  7: 'Codec',
  8: 'Input Method',
  9: 'Firmware',
  10: 'Driver',
  11: 'Localization',
  12: 'Service',
  13: 'Repository',
  14: 'OS',
  15: 'Icon Theme',
  16: 'Runtime',
};

Future<void> _printDbMetrics(String dbPath) async {
  final db = CatalogDatabase.open(dbPath);
  try {
    final m = await db.getMetrics();
    print('');
    print('Database metrics:');
    print('  Components:    ${m.componentCount}');
    print('  Categories:    ${m.categoryCount}');
    print('  Keywords:      ${m.keywordCount}');
    print('  Releases:      ${m.releaseCount}');
    print('  Icons:         ${m.iconCount}');
    print('  URLs:          ${m.urlCount}');
    print('  Screenshots:   ${m.screenshotCount}');
    print('  Languages:     ${m.languageCount}');
    print('  FTS ready:     ${m.ftsReady ? 'yes' : 'no'}');
    if (m.componentsByType.isNotEmpty) {
      print('');
      print('  Components by type:');
      final sorted = m.componentsByType.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      for (final e in sorted) {
        final name = (_typeNames[e.key] ?? 'Type ${e.key}').padRight(14);
        print('    $name ${e.value}');
      }
    }
  } finally {
    await db.close();
  }
}

void _printUsage() {
  print('appstream — Flathub catalog parser');
  print('');
  print('Usage: dart run bin/main.dart [options]');
  print('');
  print('Options:');
  print('  --xml <path>    Path to appstream.xml (downloads from Flathub if omitted)');
  print('  --db <path>     Output SQLite database path (default: catalog.db)');
  print('  --lang <code>   Language filter (e.g. "en")');
  print('  -v, --verbose   Print each component as it streams');
  print('  -h, --help      Show this help');
  print('');
  print('Examples:');
  print('  dart run bin/main.dart                    # download + parse');
  print('  dart run bin/main.dart --lang en -v        # English only, verbose');
  print('  dart run bin/main.dart --xml local.xml     # use local file');
}
