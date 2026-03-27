# Flathub Catalog - Flutter Example App

A Flutter Linux desktop app that browses the Flathub app catalog, modeled after [flathub.org](https://flathub.org/en). Demonstrates the `appstream` package's download, parse, and query capabilities.

## Features

- **Setup Screen** - Automatically downloads the Flathub AppStream XML catalog and imports it into a local SQLite database with progress indicators. Skips download/import if a fresh cache exists (< 24 hours).
- **Catalog Screen** - Browse apps by category (sidebar on wide screens, chips on narrow), search via FTS5 full-text search, view app counts and stats.
- **Detail Screen** - App icon, name, developer, summary, screenshot gallery, description, category chips, links (homepage, bug tracker, source code, etc.), recent releases, and supported languages.

## Requirements

- Flutter SDK with Linux desktop support enabled
- The `appstream` native library (`libappstream.so`) built from the parent project

## Running

```bash
# From the project root, build the native library first
make

# Then run the Flutter app
cd example/flathub_catalog
flutter pub get
flutter run -d linux
```

The app's CMakeLists.txt automatically bundles `libappstream.so` from `../../lib/` into the Flutter build output.

## Architecture

```
FlathubCatalogApp (main.dart)
├── CatalogService (services/catalog_service.dart)
│   ├── downloadXml()        - HTTP streaming download + gzip decompress
│   ├── importToDatabase()   - Appstream.parseToSqlite() with progress stream
│   └── db                   - CatalogDatabase (Drift ORM) for queries
└── Screens
    ├── SetupScreen           - Download + import progress (skipped if DB exists)
    ├── CatalogScreen         - Browse/search grid with category sidebar
    └── DetailScreen          - Full app detail with screenshots, releases, links
```

### Widgets

- **AppCard** - Horizontal card with icon scaled to available height, name, and summary
- **AppIcon** - Resolves best icon URL from remote/cached/stock types with Flathub CDN fallback

## Dependencies

- `appstream` (local path) - Native XML parser + Drift database
- `cached_network_image` - Icon and screenshot caching
- `drift` / `sqlite3` - Type-safe database access
- `http` - HTTP client for catalog download
- `path_provider` - App support directory for cache
- `url_launcher` - Open links in browser