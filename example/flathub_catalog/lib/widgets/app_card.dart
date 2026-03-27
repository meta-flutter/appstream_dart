import 'package:appstream/appstream.dart';
import 'package:flutter/material.dart';

import 'app_icon.dart';

/// A card displaying a component summary — icon, name, summary line.
class AppCard extends StatelessWidget {
  final ComponentRow component;
  final String? iconUrl;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.component,
    this.iconUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final iconSize = constraints.maxHeight - 24; // 12px padding each side
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  AppIcon(iconUrl: iconUrl, size: iconSize.clamp(24, 96)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ClipRect(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            component.name,
                            style: theme.textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (component.summary != null)
                            Text(
                              component.summary!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
