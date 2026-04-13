// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 Joel Winarske <joel.winarske@gmail.com>

import 'package:flutter/material.dart';

import 'screens/catalog_screen.dart';
import 'screens/setup_screen.dart';
import 'services/catalog_service.dart';

void main() {
  runApp(const FlathubCatalogApp());
}

class FlathubCatalogApp extends StatefulWidget {
  const FlathubCatalogApp({super.key});

  @override
  State<FlathubCatalogApp> createState() => _FlathubCatalogAppState();
}

class _FlathubCatalogAppState extends State<FlathubCatalogApp> {
  final _service = CatalogService();
  bool _ready = false;
  bool _initializing = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _service.init();
    final hasDb = _service.hasDatabase;
    if (hasDb) {
      await _service.loadAvailableLanguages();
    }
    if (mounted) {
      setState(() {
        _ready = hasDb;
        _initializing = false;
      });
    }
  }

  Future<void> _onSetupComplete() async {
    await _service.loadAvailableLanguages();
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _service.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flathub Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4A86CF),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: const Color(0xFF4A86CF),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: _initializing
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : _ready
          ? ListenableBuilder(
              listenable: _service,
              builder: (context, _) => CatalogScreen(service: _service),
            )
          : SetupScreen(service: _service, onComplete: _onSetupComplete),
    );
  }
}
