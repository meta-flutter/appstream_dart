import 'package:appstream_dart/appstream.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Resolves and displays the best available icon for a component.
class AppIcon extends StatelessWidget {
  final List<ComponentIconRow>? icons;
  final String? iconUrl;
  final String? mediaBaseurl;
  final double size;

  const AppIcon({
    super.key,
    this.icons,
    this.iconUrl,
    this.mediaBaseurl,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    final url = iconUrl ?? _resolveIconUrl();
    if (url == null || url.isEmpty) {
      return _placeholder(context);
    }

    if (url.startsWith('http://') || url.startsWith('https://')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.18),
        child: CachedNetworkImage(
          imageUrl: url,
          width: size,
          height: size,
          fit: BoxFit.cover,
          placeholder: (context, url) => _placeholder(context),
          errorWidget: (context, url, error) => _placeholder(context),
        ),
      );
    }

    return _placeholder(context);
  }

  String? _resolveIconUrl() {
    if (icons == null || icons!.isEmpty) return null;

    // Prefer REMOTE (type 5), then CACHED (type 2) with baseurl.
    final sorted = List.of(icons!)
      ..sort((a, b) {
        // REMOTE first.
        final aRemote = a.iconType == 5 ? 0 : 1;
        final bRemote = b.iconType == 5 ? 0 : 1;
        if (aRemote != bRemote) return aRemote.compareTo(bRemote);
        // Then CACHED.
        final aCached = a.iconType == 2 ? 0 : 1;
        final bCached = b.iconType == 2 ? 0 : 1;
        if (aCached != bCached) return aCached.compareTo(bCached);
        // Prefer larger.
        return (b.width ?? 0).compareTo(a.width ?? 0);
      });

    final best = sorted.first;
    if (best.iconType == 5) return best.value; // Remote URL
    if (best.iconType == 2) {
      final base =
          mediaBaseurl ?? 'https://dl.flathub.org/repo/appstream/x86_64/icons';
      final w = best.width ?? 128;
      final h = best.height ?? 128;
      return '$base/${w}x$h/${best.value}';
    }
    return null;
  }

  Widget _placeholder(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(size * 0.18),
      ),
      child: Icon(
        Icons.apps,
        size: size * 0.5,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
