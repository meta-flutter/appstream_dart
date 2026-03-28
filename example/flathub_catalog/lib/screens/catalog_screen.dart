import 'package:appstream_dart/appstream.dart';
import 'package:flutter/material.dart';

import '../services/catalog_service.dart';
import '../widgets/app_card.dart';
import 'detail_screen.dart';

/// Main catalog browsing screen modeled after flathub.org.
class CatalogScreen extends StatefulWidget {
  final CatalogService service;

  const CatalogScreen({super.key, required this.service});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final _searchController = TextEditingController();

  // Data
  CatalogMetrics? _metrics;
  List<({String name, int count})> _categories = [];
  String? _selectedCategory;
  List<_AppEntry> _apps = [];
  bool _loading = true;
  bool _searching = false;

  CatalogDatabase get _db => widget.service.db;
  /// Language for filtering (only when user explicitly selected one).
  String? get _filterLocale => widget.service.effectiveLocale;
  /// Language for displaying translations (auto-detected or explicit).
  String? get _displayLocale => widget.service.displayLocale;

  @override
  void initState() {
    super.initState();
    _loadInitial();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Convert raw query results into localized app entries.
  Future<List<_AppEntry>> _localize(
      List<({ComponentRow component, String? iconUrl})> results) async {
    final locale = _displayLocale;
    if (locale == null) {
      return results
          .map((r) => _AppEntry(component: r.component, iconUrl: r.iconUrl))
          .toList();
    }

    final entries = <_AppEntry>[];
    for (final r in results) {
      final name =
          await _db.getTranslation(r.component.id, 'name', locale);
      final summary =
          await _db.getTranslation(r.component.id, 'summary', locale);
      entries.add(_AppEntry(
        component: r.component,
        iconUrl: r.iconUrl,
        displayName: name,
        displaySummary: summary,
      ));
    }
    return entries;
  }

  Future<void> _loadInitial() async {
    final metrics = await _db.getMetrics();
    final filter = _filterLocale;

    final List<({String name, int count})> cats;
    final List<({ComponentRow component, String? iconUrl})> results;

    if (filter != null) {
      cats = await _db.listCategoriesForLanguage(filter);
      results = await _db.componentsByTranslationLanguage(filter, limit: 60);
    } else {
      cats = await _db.listCategories();
      results = await _db.listComponents(limit: 60);
    }

    final apps = await _localize(results);

    if (mounted) {
      setState(() {
        _metrics = metrics;
        _categories = cats;
        _selectedCategory = null;
        _apps = apps;
        _loading = false;
      });
    }
  }

  Future<void> _onSearch(String query) async {
    if (query.trim().isEmpty) {
      _clearSearch();
      return;
    }

    setState(() {
      _searching = true;
      _selectedCategory = null;
    });

    final results = await _db.searchWithSnippets(query,
        limit: 60, locale: _filterLocale);
    final base = results
        .map((r) => (component: r.component, iconUrl: r.iconUrl))
        .toList();
    final apps = await _localize(base);
    if (mounted) {
      setState(() {
        _apps = apps;
        _searching = false;
      });
    }
  }

  Future<void> _selectCategory(String? category) async {
    setState(() {
      _selectedCategory = category;
      _loading = true;
      _searchController.clear();
    });

    final filter = _filterLocale;
    final List<({ComponentRow component, String? iconUrl})> results;

    if (category == null) {
      if (filter != null) {
        results =
            await _db.componentsByTranslationLanguage(filter, limit: 60);
      } else {
        results = await _db.listComponents(limit: 60);
      }
    } else {
      if (filter != null) {
        results = await _db.componentsByCategoryAndLanguage(
            category, filter,
            limit: 60);
      } else {
        results = await _db.componentsByCategory(category, limit: 60);
      }
    }

    final apps = await _localize(results);

    if (mounted) {
      setState(() {
        _apps = apps;
        _loading = false;
      });
    }
  }

  void _clearSearch() {
    _searchController.clear();
    _selectCategory(_selectedCategory);
  }

  void _openDetail(String componentId) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => DetailScreen(
          service: widget.service,
          componentId: componentId,
        ),
      ),
    );
  }

  /// Reload content after a language change, preserving search or category.
  Future<void> _reloadForLanguage() async {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      // Re-apply the active search
      await _onSearch(query);
      // Also refresh categories in the background
      final filter = _filterLocale;
      final cats = filter != null
          ? await _db.listCategoriesForLanguage(filter)
          : await _db.listCategories();
      if (mounted) setState(() => _categories = cats);
    } else if (_selectedCategory != null) {
      // Re-query the selected category; fall back to All if empty
      final filter = _filterLocale;
      final cats = filter != null
          ? await _db.listCategoriesForLanguage(filter)
          : await _db.listCategories();
      if (mounted) setState(() => _categories = cats);

      // Check if the current category still has results
      final catExists = cats.any((c) => c.name == _selectedCategory);
      if (catExists) {
        await _selectCategory(_selectedCategory);
      } else {
        await _selectCategory(null);
      }
    } else {
      await _loadInitial();
    }
  }

  void _showLanguagePicker() {
    final langs = widget.service.availableLanguages;
    if (langs.isEmpty) return;

    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              leading: const Icon(Icons.auto_awesome),
              title: const Text('Auto (System)'),
              selected: widget.service.locale == null,
              onTap: () {
                widget.service.locale = null;
                Navigator.pop(context);
                _reloadForLanguage();
              },
            ),
            const Divider(),
            ...langs.take(50).map((lang) => ListTile(
                  title: Text(lang),
                  selected: widget.service.locale == lang,
                  onTap: () {
                    widget.service.locale = lang;
                    Navigator.pop(context);
                    _reloadForLanguage();
                  },
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wide = MediaQuery.sizeOf(context).width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flathub Catalog'),
        actions: [
          if (widget.service.availableLanguages.isNotEmpty)
            TextButton.icon(
              onPressed: _showLanguagePicker,
              icon: const Icon(Icons.language),
              label: Text(
                widget.service.locale ?? 'Auto',
                style: theme.textTheme.labelMedium,
              ),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search apps...',
              leading: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.search),
              ),
              trailing: [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearSearch,
                  ),
              ],
              onSubmitted: _onSearch,
              onChanged: (v) {
                if (v.isEmpty) _clearSearch();
                setState(() {}); // update trailing clear button
              },
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          // Category sidebar (wide layout) or drawer.
          if (wide)
            SizedBox(
              width: 220,
              child: _buildCategorySidebar(theme),
            ),

          // Main content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category chips (narrow layout).
                if (!wide && _categories.isNotEmpty)
                  SizedBox(
                    height: 48,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      children: [
                        _categoryChip(theme, null, 'All'),
                        ..._categories.take(20).map(
                              (cat) =>
                                  _categoryChip(theme, cat.name, cat.name),
                            ),
                      ],
                    ),
                  ),

                // Stats bar
                if (_metrics != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                      _selectedCategory != null
                          ? '$_selectedCategory — ${_apps.length} apps'
                          : _searchController.text.isNotEmpty
                              ? '${_apps.length} results'
                              : '${_metrics!.componentCount} apps in catalog',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                // App grid
                Expanded(
                  child: _loading || _searching
                      ? const Center(child: CircularProgressIndicator())
                      : _apps.isEmpty
                          ? Center(
                              child: Text(
                                'No apps found.',
                                style: theme.textTheme.bodyLarge,
                              ),
                            )
                          : _buildAppGrid(wide),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySidebar(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _categoryTile(theme, null, 'All Apps', Icons.apps),
          const Divider(indent: 16, endIndent: 16),
          ..._categories.map(
            (cat) => _categoryTile(
              theme,
              cat.name,
              '${cat.name} (${cat.count})',
              _categoryIcon(cat.name),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryTile(
      ThemeData theme, String? value, String label, IconData icon) {
    final selected = _selectedCategory == value;
    return ListTile(
      dense: true,
      selected: selected,
      leading: Icon(icon, size: 20),
      title: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: () => _selectCategory(value),
    );
  }

  Widget _categoryChip(ThemeData theme, String? value, String label) {
    final selected = _selectedCategory == value;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: FilterChip(
        selected: selected,
        label: Text(label),
        onSelected: (_) => _selectCategory(value),
      ),
    );
  }

  Widget _buildAppGrid(bool wide) {
    final crossAxisCount = wide ? 2 : 1;

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 80,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _apps.length,
      itemBuilder: (context, i) {
        final app = _apps[i];
        return AppCard(
          component: app.component,
          iconUrl: app.iconUrl,
          displayName: app.displayName,
          displaySummary: app.displaySummary,
          onTap: () => _openDetail(app.component.id),
        );
      },
    );
  }

  static IconData _categoryIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('game')) return Icons.sports_esports;
    if (lower.contains('audio') || lower.contains('music')) return Icons.music_note;
    if (lower.contains('video') || lower.contains('player')) return Icons.videocam;
    if (lower.contains('graphic') || lower.contains('photo')) return Icons.image;
    if (lower.contains('office') || lower.contains('document')) return Icons.description;
    if (lower.contains('network') || lower.contains('web')) return Icons.language;
    if (lower.contains('develop') || lower.contains('ide') || lower.contains('text')) return Icons.code;
    if (lower.contains('system') || lower.contains('monitor')) return Icons.settings;
    if (lower.contains('education') || lower.contains('science')) return Icons.school;
    if (lower.contains('utility') || lower.contains('tool')) return Icons.build;
    if (lower.contains('accessibility')) return Icons.accessibility;
    if (lower.contains('security')) return Icons.security;
    if (lower.contains('finance')) return Icons.account_balance;
    if (lower.contains('maps') || lower.contains('navigation')) return Icons.map;
    if (lower.contains('chat') || lower.contains('instant')) return Icons.chat;
    if (lower.contains('email') || lower.contains('contact')) return Icons.email;
    return Icons.category;
  }
}

class _AppEntry {
  final ComponentRow component;
  final String? iconUrl;
  final String? displayName;
  final String? displaySummary;
  _AppEntry({
    required this.component,
    this.iconUrl,
    this.displayName,
    this.displaySummary,
  });
}
