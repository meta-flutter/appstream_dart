import 'package:appstream_dart/appstream.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/catalog_service.dart';
import '../widgets/app_icon.dart';

const _urlTypeLabels = {
  1: 'Homepage',
  2: 'Bug Tracker',
  3: 'FAQ',
  4: 'Help',
  5: 'Donation',
  6: 'Translate',
  7: 'Contact',
  8: 'Source Code',
  9: 'Contribute',
};

const _urlTypeIcons = {
  1: Icons.home,
  2: Icons.bug_report,
  3: Icons.help_outline,
  4: Icons.support,
  5: Icons.favorite,
  6: Icons.translate,
  7: Icons.email,
  8: Icons.code,
  9: Icons.people,
};

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

class DetailScreen extends StatefulWidget {
  final CatalogService service;
  final String componentId;

  const DetailScreen({
    super.key,
    required this.service,
    required this.componentId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ComponentDetail? _detail;
  bool _loading = true;
  final _focusNode = FocusNode();
  final _screenshotScrollController = ScrollController();

  // Localized fields (loaded from service locale)
  String? _localizedName;
  String? _localizedSummary;
  String? _localizedDescription;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _screenshotScrollController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final db = widget.service.db;
    final detail = await db.getComponentDetail(widget.componentId);

    // Load translations for the active locale
    final locale = widget.service.displayLocale;
    String? name, summary, description;
    if (locale != null) {
      try {
        name = await db.getTranslation(widget.componentId, 'name', locale);
        summary =
            await db.getTranslation(widget.componentId, 'summary', locale);
        description =
            await db.getTranslation(widget.componentId, 'description', locale);
      } catch (_) {}
    }

    if (mounted) {
      setState(() {
        _detail = detail;
        _localizedName = name;
        _localizedSummary = summary;
        _localizedDescription = description;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_loading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final detail = _detail;
    if (detail == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Component not found: ${widget.componentId}')),
      );
    }

    final c = detail.component;

    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.escape) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text(_localizedName ?? c.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Header: icon + name + summary
          _buildHeader(theme, c, detail),
          const SizedBox(height: 24),

          // Screenshot gallery
          if (detail.screenshotImages.isNotEmpty) ...[
            _buildScreenshots(detail.screenshotImages),
            const SizedBox(height: 24),
          ],

          // Description
          if ((_localizedDescription ?? c.description) != null) ...[
            _sectionTitle(theme, 'Description'),
            const SizedBox(height: 8),
            _AppStreamHtml(
              html: (_localizedDescription ?? c.description)!,
              style: theme.textTheme.bodyMedium!,
            ),
            const SizedBox(height: 24),
          ],

          // Info chips
          _buildInfoSection(theme, c, detail),
          const SizedBox(height: 24),

          // Links
          if (detail.urls.isNotEmpty) ...[
            _sectionTitle(theme, 'Links'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: detail.urls.map((url) {
                final label = _urlTypeLabels[url.urlType] ?? 'Link';
                final icon = _urlTypeIcons[url.urlType] ?? Icons.link;
                return ActionChip(
                  avatar: Icon(icon, size: 18),
                  label: Text(label),
                  onPressed: () => _launchSafe(url.url),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Releases
          if (detail.releases.isNotEmpty) ...[
            _sectionTitle(theme, 'Recent Releases'),
            const SizedBox(height: 8),
            ...detail.releases.take(5).map((rel) => _buildReleaseTile(theme, rel)),
            const SizedBox(height: 24),
          ],

          // Languages
          if (detail.languages.isNotEmpty) ...[
            _sectionTitle(theme, 'Languages (${detail.languages.length})'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: detail.languages
                  .take(40)
                  .map((l) => Chip(
                        label: Text(l),
                        visualDensity: VisualDensity.compact,
                      ))
                  .toList(),
            ),
            if (detail.languages.length > 40)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '... and ${detail.languages.length - 40} more',
                  style: theme.textTheme.bodySmall,
                ),
              ),
          ],
        ],
      ),
    ),
    );
  }

  Widget _buildHeader(ThemeData theme, ComponentRow c, ComponentDetail detail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIcon(
          icons: detail.icons,
          mediaBaseurl: c.mediaBaseurl,
          size: 96,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_localizedName ?? c.name, style: theme.textTheme.headlineMedium),
              if (c.developerName != null)
                Text(
                  c.developerName!,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 8),
              if ((_localizedSummary ?? c.summary) != null)
                Text((_localizedSummary ?? c.summary)!, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _infoChip(theme, _typeNames[c.componentType] ?? 'App'),
                  if (c.projectLicense != null) _infoChip(theme, c.projectLicense!),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoChip(ThemeData theme, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: theme.textTheme.labelSmall),
    );
  }

  Widget _buildInfoSection(ThemeData theme, ComponentRow c, ComponentDetail detail) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (detail.categories.isNotEmpty)
          ...detail.categories.map(
            (cat) => Chip(
              label: Text(cat),
              visualDensity: VisualDensity.compact,
            ),
          ),
      ],
    );
  }

  /// Group images by screenshot_id, pick the best resolution for the target height.
  static List<_ScreenshotGroup> _groupScreenshots(
      List<ScreenshotImageRow> images) {
    final groups = <int, List<ScreenshotImageRow>>{};
    for (final img in images) {
      (groups[img.screenshotId] ??= []).add(img);
    }
    return groups.values.map((variants) {
      // Sort by width descending so we can pick the best fit
      variants.sort((a, b) => (b.width ?? 0).compareTo(a.width ?? 0));
      return _ScreenshotGroup(variants);
    }).toList();
  }

  Widget _buildScreenshots(List<ScreenshotImageRow> images) {
    final groups = _groupScreenshots(images);
    if (groups.isEmpty) return const SizedBox.shrink();

    final dpr = MediaQuery.devicePixelRatioOf(context);
    const galleryHeight = 280.0;
    final targetHeight = (galleryHeight * dpr).round();

    return SizedBox(
      height: galleryHeight,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
        ),
        child: ListView.separated(
          controller: _screenshotScrollController,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          itemCount: groups.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, i) {
            final url = groups[i].bestForHeight(targetHeight);
            return InkWell(
              onTap: () => _openImageViewer(context, groups, i),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: url,
                  height: galleryHeight,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Container(
                    width: 420,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 420,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.broken_image, size: 48),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openImageViewer(
      BuildContext context, List<_ScreenshotGroup> groups, int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _FullScreenImageViewer(
          groups: groups,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  Widget _buildReleaseTile(ThemeData theme, ReleaseRow rel) {
    final date = rel.timestamp ?? rel.date ?? '';
    final dateShort = date.contains('T') ? date.split('T').first : date;
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.new_releases_outlined, size: 20),
      title: Text('v${rel.version ?? '?'}'),
      subtitle: dateShort.isNotEmpty ? Text(dateShort) : null,
    );
  }

  Widget _sectionTitle(ThemeData theme, String title) {
    return Text(title, style: theme.textTheme.titleMedium);
  }

  static void _launchSafe(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    if (uri.scheme != 'http' && uri.scheme != 'https') return;
    launchUrl(uri);
  }

}

/// Renders AppStream HTML description markup as Flutter widgets.
/// Supports: <p>, <ul>, <ol>, <li>, <em>, <code>, <a href="...">.
class _AppStreamHtml extends StatefulWidget {
  final String html;
  final TextStyle style;

  const _AppStreamHtml({required this.html, required this.style});

  @override
  State<_AppStreamHtml> createState() => _AppStreamHtmlState();
}

class _AppStreamHtmlState extends State<_AppStreamHtml> {
  final _recognizers = <TapGestureRecognizer>[];

  @override
  void dispose() {
    for (final r in _recognizers) {
      r.dispose();
    }
    super.dispose();
  }

  TapGestureRecognizer? _makeTapRecognizer(Uri uri) {
    if (uri.scheme != 'http' && uri.scheme != 'https') return null;
    final r = TapGestureRecognizer()..onTap = () => launchUrl(uri);
    _recognizers.add(r);
    return r;
  }

  @override
  Widget build(BuildContext context) {
    // Dispose old recognizers from previous build
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();

    final theme = Theme.of(context);
    final html = widget.html;
    final style = widget.style;
    final widgets = <Widget>[];
    final tagPattern = RegExp(r'<(/?)(\w+)([^>]*)>');

    // State
    final buffer = StringBuffer();
    final spanStack = <TextStyle>[style];
    var ordered = false;
    var listIndex = 0;
    final currentSpans = <InlineSpan>[];
    String? currentHref;

    void flushText() {
      var text = buffer.toString();
      buffer.clear();
      text = text.replaceAll(RegExp(r'\s+'), ' ');
      if (text.isNotEmpty) {
        if (currentHref != null) {
          final uri = Uri.tryParse(currentHref);
          currentSpans.add(TextSpan(
            text: text,
            style: spanStack.last,
            recognizer: uri != null ? _makeTapRecognizer(uri) : null,
          ));
        } else {
          currentSpans.add(TextSpan(text: text, style: spanStack.last));
        }
      }
    }

    void flushParagraph() {
      flushText();
      if (currentSpans.isNotEmpty) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text.rich(TextSpan(children: List.of(currentSpans))),
        ));
        currentSpans.clear();
      }
    }

    void flushListItem() {
      flushText();
      if (currentSpans.isNotEmpty) {
        final prefix = ordered ? '${listIndex++}. ' : '\u2022 ';
        widgets.add(Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 4),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: prefix, style: style),
            ...List.of(currentSpans),
          ])),
        ));
        currentSpans.clear();
      }
    }

    // Parse
    var pos = 0;
    for (final match in tagPattern.allMatches(html)) {
      // Text before this tag
      if (match.start > pos) {
        buffer.write(html.substring(pos, match.start));
      }
      pos = match.end;

      final closing = match.group(1) == '/';
      final tag = match.group(2)!.toLowerCase();
      final attrs = match.group(3) ?? '';

      switch (tag) {
        case 'p':
          if (closing) {
            flushParagraph();
          } else {
            flushText();
          }
        case 'ul':
          if (!closing) {
            flushParagraph();

            ordered = false;
          } else {
            flushListItem();

            widgets.add(const SizedBox(height: 8));
          }
        case 'ol':
          if (!closing) {
            flushParagraph();

            ordered = true;
            listIndex = 1;
          } else {
            flushListItem();

            widgets.add(const SizedBox(height: 8));
          }
        case 'li':
          if (closing) {
            flushListItem();
          } else {
            flushText();
          }
        case 'em':
          flushText();
          if (!closing) {
            spanStack.add(style.copyWith(fontStyle: FontStyle.italic));
          } else if (spanStack.length > 1) {
            spanStack.removeLast();
          }
        case 'code':
          flushText();
          if (!closing) {
            spanStack.add(style.copyWith(
              fontFamily: 'monospace',
              backgroundColor:
                  theme.colorScheme.surfaceContainerHighest,
            ));
          } else if (spanStack.length > 1) {
            spanStack.removeLast();
          }
        case 'a':
          flushText();
          if (!closing) {
            final hrefMatch =
                RegExp(r'href\s*=\s*"([^"]*)"').firstMatch(attrs);
            currentHref = hrefMatch?.group(1);
            spanStack.add(style.copyWith(
              color: theme.colorScheme.primary,
              decoration: TextDecoration.underline,
            ));
          } else {
            flushText();
            currentHref = null;
            if (spanStack.length > 1) spanStack.removeLast();
          }
      }
    }

    // Trailing text
    if (pos < html.length) {
      buffer.write(html.substring(pos));
    }
    flushParagraph();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

/// A group of the same screenshot at different resolutions.
class _ScreenshotGroup {
  final List<ScreenshotImageRow> variants; // sorted by width descending

  _ScreenshotGroup(this.variants);

  /// Pick the smallest image whose height >= targetHeight.
  /// Falls back to the largest available (or source) if none is big enough.
  String bestForHeight(int targetHeight) {
    // Prefer sized thumbnails over source (which has no dimensions)
    final sized = variants.where((v) => v.height != null && v.height! > 0).toList();
    if (sized.isEmpty) return variants.first.url; // source fallback

    // sorted descending by width, find smallest that's >= target
    for (final img in sized.reversed) {
      if (img.height! >= targetHeight) return img.url;
    }
    // Nothing big enough, use the largest
    return sized.first.url;
  }

  /// The largest available URL (for fullscreen).
  String get largest {
    // Prefer source type (no dimensions = original full-res)
    for (final v in variants) {
      if (v.type == 'source') return v.url;
    }
    return variants.first.url; // already sorted descending
  }
}

class _FullScreenImageViewer extends StatefulWidget {
  final List<_ScreenshotGroup> groups;
  final int initialIndex;

  const _FullScreenImageViewer({
    required this.groups,
    required this.initialIndex,
  });

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late final PageController _pageController;
  late final FocusNode _focusNode;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onKey(KeyEvent event) {
    if (event is! KeyDownEvent) return;
    if (event.logicalKey == LogicalKeyboardKey.escape) {
      Navigator.of(context).pop();
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      _goToPrevious();
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      _goToNext();
    }
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (event.scrollDelta.dy > 0) {
        _goToNext();
      } else if (event.scrollDelta.dy < 0) {
        _goToPrevious();
      }
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.groups.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Listener(
      onPointerSignal: _onPointerSignal,
      child: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: _onKey,
        child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Swipeable image pages
            PageView.builder(
              controller: _pageController,
              itemCount: widget.groups.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                return FittedBox(
                  fit: BoxFit.contain,
                  child: CachedNetworkImage(
                    imageUrl: widget.groups[index].largest,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const SizedBox(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.broken_image,
                      size: 64,
                      color: Colors.white54,
                    ),
                  ),
                );
              },
            ),

            // Close button
            Positioned(
              top: 8,
              right: 8,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),

            // Navigation arrows
            if (widget.groups.length > 1) ...[
              if (_currentIndex > 0)
                Positioned(
                  left: 8,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left,
                          color: Colors.white70, size: 40),
                      onPressed: () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                ),
              if (_currentIndex < widget.groups.length - 1)
                Positioned(
                  right: 8,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.chevron_right,
                          color: Colors.white70, size: 40),
                      onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                ),
            ],

            // Page indicator
            if (widget.groups.length > 1)
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${widget.groups.length}',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      ),
    );
  }
}
