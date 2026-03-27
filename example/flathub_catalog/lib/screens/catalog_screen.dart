import 'package:appstream/appstream.dart';
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

  Future<void> _loadInitial() async {
    final metrics = await _db.getMetrics();
    final cats = await _db.listCategories();

    // Load all apps sorted by name.
    final featured = await _db.listComponents(limit: 60);

    if (mounted) {
      setState(() {
        _metrics = metrics;
        _categories = cats;
        _apps = featured
            .map((r) => _AppEntry(component: r.component, iconUrl: r.iconUrl))
            .toList();
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

    final results = await _db.searchWithSnippets(query, limit: 60);
    if (mounted) {
      setState(() {
        _apps = results
            .map((r) => _AppEntry(component: r.component, iconUrl: r.iconUrl))
            .toList();
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

    final List<({ComponentRow component, String? iconUrl})> results;
    if (category == null) {
      results = await _db.listComponents(limit: 60);
    } else {
      results = await _db.componentsByCategory(category, limit: 60);
    }

    if (mounted) {
      setState(() {
        _apps = results
            .map((r) => _AppEntry(component: r.component, iconUrl: r.iconUrl))
            .toList();
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wide = MediaQuery.sizeOf(context).width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flathub Catalog'),
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
  _AppEntry({required this.component, this.iconUrl});
}
