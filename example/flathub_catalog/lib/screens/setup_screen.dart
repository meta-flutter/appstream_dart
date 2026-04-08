import 'package:flutter/material.dart';

import '../services/catalog_service.dart';

enum _SetupPhase { downloading, decompressing, importing, done, error }

class SetupScreen extends StatefulWidget {
  final CatalogService service;
  final VoidCallback onComplete;

  const SetupScreen({
    super.key,
    required this.service,
    required this.onComplete,
  });

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  _SetupPhase _phase = _SetupPhase.downloading;
  double _progress = 0;
  String _statusText = 'Connecting to Flathub...';
  String? _error;
  int _componentCount = 0;

  @override
  void initState() {
    super.initState();
    _startSetup();
  }

  Future<void> _startSetup() async {
    try {
      // Phase 1: Download XML (skip if cached).
      if (!widget.service.hasXml) {
        setState(() {
          _phase = _SetupPhase.downloading;
          _statusText = 'Downloading catalog from Flathub...';
        });

        await widget.service.downloadXml(
          onProgress: (update) {
            final (received, total) = update;
            setState(() {
              if (total > 0) {
                _progress = received / total;
                final mb = (received / 1024 / 1024).toStringAsFixed(1);
                final totalMb = (total / 1024 / 1024).toStringAsFixed(1);
                _statusText = 'Downloading... $mb / $totalMb MB';
              } else {
                _phase = _SetupPhase.decompressing;
                _progress = -1; // indeterminate
                _statusText = 'Decompressing...';
              }
            });
          },
        );
      }

      // Phase 2: Import to database.
      setState(() {
        _phase = _SetupPhase.importing;
        _progress = 0;
        _statusText = 'Importing catalog...';
      });

      await for (final (count, estimated)
          in widget.service.importToDatabase()) {
        setState(() {
          _componentCount = count;
          _progress = estimated > 0 ? (count / estimated).clamp(0.0, 1.0) : 0;
          _statusText = 'Importing... $count components';
        });
      }

      setState(() {
        _phase = _SetupPhase.done;
        _statusText = 'Ready! $_componentCount components imported.';
      });

      await Future<void>.delayed(const Duration(milliseconds: 500));
      widget.onComplete();
    } catch (e) {
      setState(() {
        _phase = _SetupPhase.error;
        _error = e.toString();
        _statusText = 'Setup failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _phase == _SetupPhase.error
                      ? Icons.error_outline
                      : Icons.store_rounded,
                  size: 64,
                  color: _phase == _SetupPhase.error
                      ? theme.colorScheme.error
                      : theme.colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  _phase == _SetupPhase.downloading ||
                          _phase == _SetupPhase.decompressing
                      ? 'Fetching Catalog'
                      : _phase == _SetupPhase.importing
                      ? 'Building Database'
                      : _phase == _SetupPhase.done
                      ? 'All Set!'
                      : 'Error',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  _statusText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                if (_phase != _SetupPhase.error && _phase != _SetupPhase.done)
                  _progress < 0
                      ? const LinearProgressIndicator()
                      : LinearProgressIndicator(value: _progress),
                if (_phase == _SetupPhase.done)
                  Icon(
                    Icons.check_circle,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                if (_phase == _SetupPhase.error) ...[
                  const SizedBox(height: 8),
                  Text(
                    _error ?? 'Unknown error',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {
                      setState(() {
                        _phase = _SetupPhase.downloading;
                        _progress = 0;
                        _error = null;
                      });
                      _startSetup();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
