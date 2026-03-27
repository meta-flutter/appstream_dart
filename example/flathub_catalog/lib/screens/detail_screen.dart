import 'package:appstream/appstream.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final detail = await widget.service.db.getComponentDetail(widget.componentId);
    if (mounted) {
      setState(() {
        _detail = detail;
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

    return Scaffold(
      appBar: AppBar(
        title: Text(c.name),
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
          if (c.description != null) ...[
            _sectionTitle(theme, 'Description'),
            const SizedBox(height: 8),
            Text(
              _stripHtml(c.description!),
              style: theme.textTheme.bodyMedium,
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
                  onPressed: () => launchUrl(Uri.parse(url.url)),
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
              Text(c.name, style: theme.textTheme.headlineMedium),
              if (c.developerName != null)
                Text(
                  c.developerName!,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 8),
              if (c.summary != null)
                Text(c.summary!, style: theme.textTheme.bodyLarge),
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

  Widget _buildScreenshots(List<ScreenshotImageRow> images) {
    // Prefer wider images (type "source" or largest).
    final sorted = List.of(images)
      ..sort((a, b) => (b.width ?? 0).compareTo(a.width ?? 0));
    final unique = <String>{};
    final deduped = sorted.where((img) => unique.add(img.url)).take(8).toList();

    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: deduped.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final img = deduped[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: img.url,
              height: 280,
              fit: BoxFit.contain,
              placeholder: (context, url) => Container(
                width: 420,
                color: Colors.grey.shade200,
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (context, url, error) => Container(
                width: 420,
                color: Colors.grey.shade200,
                child: const Icon(Icons.broken_image, size: 48),
              ),
            ),
          );
        },
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

  static String _stripHtml(String html) {
    return html
        .replaceAll(RegExp(r'<[^>]+>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
