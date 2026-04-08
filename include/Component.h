/*
 * Copyright 2026 Joel Winarske
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef COMPONENT_H
#define COMPONENT_H

#include <cstdint>
#include <optional>
#include <string>
#include <string_view>
#include <utility>
#include <vector>

/// Maximum number of releases to store per component.
inline constexpr size_t kMaxReleasesPerComponent = 3;

class Component {
public:
  // ================================================================
  // Component type (from <component type="...">)
  // ================================================================

  enum class Type : uint8_t {
    UNKNOWN = 0,
    GENERIC,
    DESKTOP_APPLICATION,
    CONSOLE_APPLICATION,
    WEB_APPLICATION,
    ADDON,
    FONT,
    CODEC,
    INPUT_METHOD,
    FIRMWARE,
    DRIVER,
    LOCALIZATION,
    SERVICE,
    REPOSITORY,
    OPERATING_SYSTEM,
    ICON_THEME,
    RUNTIME
  };

  // ================================================================
  // Bundle
  // ================================================================

  enum class BundleType : uint8_t {
    UNKNOWN = 0,
    PACKAGE,
    LIMBA,
    FLATPAK,
    APPIMAGE,
    SNAP,
    TARBALL,
    CABINET,
    LINGLONG
  };

  struct Bundle {
    std::string id;
    BundleType type = BundleType::UNKNOWN;
  };

  // ================================================================
  // Icon
  // ================================================================

  enum class IconType : uint8_t { UNKNOWN = 0, STOCK, CACHED, LOCAL, URL, REMOTE };

  struct Icon {
    IconType type = IconType::UNKNOWN;
    std::string value;
    std::optional<int> width;
    std::optional<int> height;
    std::optional<int> scale;
  };

  // ================================================================
  // Screenshot (spec section 2.1)
  // ================================================================

  struct Image {
    std::string url;
    std::string type; // "source", "thumbnail"
    std::optional<int> width;
    std::optional<int> height;
  };

  struct Video {
    std::string url;
    std::string codec;     // "vp9", "av1"
    std::string container; // "matroska", "webm"
    std::optional<int> width;
    std::optional<int> height;
  };

  struct Screenshot {
    bool isDefault = false;
    std::string caption; // translatable
    std::vector<Image> images;
    std::vector<Video> videos;
  };

  // ================================================================
  // Content rating (OARS)
  // ================================================================

  struct ContentRating {
    std::string type; // "oars-1.0", "oars-1.1"
    // id → value: e.g. "violence-cartoon" → "moderate"
    std::vector<std::pair<std::string, std::string>> attributes;
  };

  // ================================================================
  // Provides
  // ================================================================

  struct Provides {
    std::vector<std::string> binaries;
    std::vector<std::string> libraries;
    std::vector<std::string> mediatypes;
    std::vector<std::pair<std::string, std::string>> dbus; // type → name
    std::vector<std::string> firmware;
    std::vector<std::string> ids; // provided component IDs
  };

  // ================================================================
  // Branding
  // ================================================================

  struct BrandingColor {
    std::string scheme_preference; // "light", "dark"
    std::string value;             // hex color e.g. "#3584e4"
  };

  // ================================================================
  // Requires / Recommends
  // ================================================================

  struct Relation {
    std::string type; // "display_length", "control", "internet", "memory", "id"
    std::string value;
    std::string compare; // "ge", "le", "eq", etc.
    std::string version;
  };

  // ================================================================
  // Enums shared across release/issue/etc
  // ================================================================

  enum class CompulsoryForDesktop : uint8_t {
    UNKNOWN = 0,
    COSMIC,
    GNOME,
    GNOME_Classic,
    GNOME_Flashback,
    KDE,
    LXDE,
    LXQt,
    MATE,
    Razor,
    ROX,
    TDE,
    Unity,
    XFCE,
    EDE,
    Cinnamon,
    Pantheon,
    DDE,
    Endless,
    Old
  };

  enum class UrlType : uint8_t {
    UNKNOWN = 0,
    HOMEPAGE,
    BUGTRACKER,
    FAQ,
    HELP,
    DONATION,
    TRANSLATE,
    CONTACT,
    VCS_BROWSER,
    CONTRIBUTE
  };

  enum class LaunchableType : uint8_t { UNKNOWN = 0, DESKTOP_ID, SERVICE, COCKPIT_MANIFEST, URL };

  enum class ReleaseType : uint8_t { UNKNOWN = 0, STABLE, DEVELOPMENT, SNAPSHOT };

  enum class ReleaseUrgency : uint8_t { UNKNOWN = 0, LOW, MEDIUM, HIGH, CRITICAL };

  enum class IssueType : uint8_t { UNKNOWN = 0, GENERIC, CVE };

  // ================================================================
  // Artifact, Issue, Release
  // ================================================================

  struct Artifact {
    std::string location;
    std::vector<std::pair<std::string, std::string>> checksums;
    std::vector<std::pair<std::string, size_t>> sizes;
  };

  struct Issue {
    IssueType type = IssueType::UNKNOWN;
    std::string url;
    std::string value;
  };

  struct Release {
    ReleaseType type = ReleaseType::STABLE;
    std::string version;
    std::string date;
    std::string timestamp;
    std::string date_eol;
    ReleaseUrgency urgency = ReleaseUrgency::MEDIUM;
    std::string description; // HTML markup
    std::string url;
    std::vector<Issue> issues;
    std::vector<Artifact> artifacts;
  };

  // ================================================================
  // Component data fields
  // ================================================================

  // -- Identity --
  Type type = Type::UNKNOWN;
  int priority = 0;  // catalog merge priority
  std::string merge; // "append", "replace", "remove-component"
  std::string id;
  std::string name;
  std::string summary;
  std::string description; // HTML markup (<p>, <ul>, <li>, <em>, etc.)
  std::string name_variant_suffix;

  // -- Licensing --
  std::string metadata_license;
  std::string projectLicense;

  // -- Package info --
  std::string pkgname;
  std::string source_pkgname;
  std::string project_group;
  std::string media_baseurl;
  std::string architecture;

  // -- URLs (sparse) --
  std::vector<std::pair<UrlType, std::string>> urls;

  // -- Developer --
  struct {
    std::string id;
    std::string name;
  } developer;

  // -- Launchable --
  struct {
    LaunchableType type = LaunchableType::UNKNOWN;
    std::string value;
  } launchable;

  // -- Collections --
  std::vector<Icon> icons;
  std::vector<CompulsoryForDesktop> compulsory_for_desktop;
  Bundle bundle;
  std::vector<std::string> keywords;
  std::vector<std::string> categories;
  std::vector<Release> releases;
  std::vector<std::string> supportedLanguages;

  // -- Screenshots --
  std::vector<Screenshot> screenshots;

  // -- Content rating --
  ContentRating content_rating;

  // -- Provides --
  Provides provides;

  // -- Branding --
  std::vector<BrandingColor> branding_colors;

  // -- Relations --
  std::vector<Relation> requires_; // trailing _ to avoid keyword
  std::vector<Relation> recommends;

  // -- Cross-references --
  std::vector<std::string> extends;      // component IDs this extends
  std::vector<std::string> replaces;     // component IDs this replaces
  std::vector<std::string> suggests_ids; // suggested component IDs

  // -- Custom --
  std::vector<std::pair<std::string, std::string>> custom; // key → value

  // -- Translation --
  std::vector<std::pair<std::string, std::string>> translations; // type → id

  // -- Localized field translations (xml:lang variants) --
  struct FieldTranslation {
    std::string field;    // "name", "summary", "description", "developer_name",
                          // "caption:<screenshot_index>"
    std::string language; // "de", "fr", "pt-BR", etc.
    std::string value;
  };
  std::vector<FieldTranslation> field_translations;

  // -- Agreements (simplified as string) --
  std::string agreement;

  // ================================================================
  // Methods
  // ================================================================

  [[nodiscard]] std::string_view getUrl(UrlType type) const;
  void setUrl(UrlType type, std::string value);
  void Dump() const;
  void addSupportedLanguage(const std::string &language);
  void shrinkToFit();

  // -- Enum conversions --
  static Type stringToComponentType(std::string_view s);
  static BundleType stringToBundleType(std::string_view s);
  static IconType stringToIconType(std::string_view s);
  static CompulsoryForDesktop stringToCompulsoryForDesktop(std::string_view s);
  static UrlType stringToUrlType(std::string_view s);
  static LaunchableType stringToLaunchableType(std::string_view s);
  static ReleaseType stringToReleaseType(std::string_view s);
  static ReleaseUrgency stringToReleaseUrgency(std::string_view s);
  static IssueType stringToIssueType(std::string_view s);

  static std::string_view componentTypeToString(Type type);
  static std::string_view bundleTypeToString(BundleType type);
  static std::string_view iconTypeToString(IconType type);
  static std::string_view compulsoryForDesktopToString(CompulsoryForDesktop d);
  static std::string_view urlTypeToString(UrlType type);
  static std::string_view releaseTypeToString(ReleaseType type);
  static std::string_view releaseUrgencyToString(ReleaseUrgency type);
  static std::string_view issueTypeToString(IssueType type);
};

#endif // COMPONENT_H