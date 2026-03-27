# Flathub Catalog - Flutter Example App

A Flutter Linux desktop app that browses the Flathub app catalog, modeled after [flathub.org](https://flathub.org/en). Demonstrates the `appstream` package's download, parse, multi-language translation, and query capabilities.

## Features

- **Setup Screen** - Automatically downloads the Flathub AppStream XML catalog and imports it into a local SQLite database with all translations (`--lang '*'`). Shows progress indicators. Skips download/import if a fresh cache exists (< 24 hours).
- **Catalog Screen** - Browse apps by category (sidebar on wide screens, chips on narrow), search via FTS5 full-text search, view app counts and stats. All listings respect the selected language.
- **Global Language Picker** - Auto-detects system locale. Language button in the app bar opens a bottom sheet with 327+ languages. Selecting a language filters the catalog to only components with translations in that language and displays localized names/summaries.
- **Detail Screen** - App icon, name, developer, summary (all localized), HTML description rendering with paragraphs/lists/emphasis/links, screenshot gallery with resolution-appropriate images, category chips, URL links (http/https only), recent releases, and supported languages.
- **Screenshot Viewer** - Tap any screenshot for fullscreen view. Swipe, arrow keys, or scroll wheel to navigate. Escape to close. Uses highest resolution source image.
- **Keyboard Navigation** - Escape key goes back from detail/viewer screens.

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

On first launch, the app downloads the Flathub catalog (~7 MB compressed), decompresses it, and imports with all translations (~50 MB database). Subsequent launches skip this if the database is less than 24 hours old.

## Architecture

```
FlathubCatalogApp (main.dart)
|-- CatalogService (services/catalog_service.dart)
|   |-- downloadXml()           - HTTP streaming download + gzip decompress
|   |-- importToDatabase()      - Appstream.parseToSqlite(language: '*')
|   |-- db                      - CatalogDatabase (Drift ORM)
|   |-- locale / displayLocale  - Global language state (ChangeNotifier)
|   '-- loadAvailableLanguages  - Queries translation table for picker
'-- Screens
    |-- SetupScreen             - Download + import progress (skipped if DB exists)
    |-- CatalogScreen           - Browse/search grid with category sidebar + language picker
    '-- DetailScreen            - Full app detail with localized fields + HTML rendering
```

### Widgets

- **AppCard** - Horizontal card with icon scaled to available height, localized name and summary
- **AppIcon** - Resolves best icon URL from remote/cached/stock types with Flathub CDN fallback
- **_AppStreamHtml** - Renders AppStream HTML description (`<p>`, `<ul>`, `<ol>`, `<li>`, `<em>`, `<code>`, `<a href>`) as Flutter widgets with proper text styling and tappable links (http/https only)
- **_ScreenshotGroup** - Groups screenshot images by screenshot ID, selects best resolution for display size (gallery) or highest resolution (fullscreen)
- **_FullScreenImageViewer** - Fullscreen image viewer with PageView, keyboard/scroll wheel navigation, page indicator

### Language Selection

The language picker works like flathub.org:
- **Auto (System)** - Shows all components, applies translations from system locale where available
- **Explicit language** - Filters catalog to only components with translations in that language, updates categories, search results, and detail views

Language selection is global and persists across all screens via `CatalogService.locale`.

## Dependencies

- `appstream` (local path) - Native XML parser + Drift database
- `cached_network_image` - Icon and screenshot caching
- `drift` / `sqlite3` - Type-safe database access
- `http` - HTTP client for catalog download
- `path_provider` - App support directory for cache
- `url_launcher` - Open links in browser (http/https only)
