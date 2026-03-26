/*
 * Copyright 2024 Joel Winarske
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

#include "Component.h"
#include "../include/spdlog.h"
#include <algorithm>

using namespace std::string_view_literals;

// ---- String constants ----

static constexpr auto kUnknown = "unknown"sv;

// Component types
static constexpr auto kGeneric = "generic"sv;
static constexpr auto kDesktopApplication = "desktop-application"sv;
static constexpr auto kDesktop = "desktop"sv; // legacy alias
static constexpr auto kConsoleApplication = "console-application"sv;
static constexpr auto kWebApplication = "web-application"sv;
static constexpr auto kAddon = "addon"sv;
static constexpr auto kFont = "font"sv;
static constexpr auto kCodec = "codec"sv;
static constexpr auto kInputMethod = "input-method"sv;
static constexpr auto kFirmware = "firmware"sv;
static constexpr auto kDriver = "driver"sv;
static constexpr auto kLocalization = "localization"sv;
static constexpr auto kServiceType = "service"sv;
static constexpr auto kRepository = "repository"sv;
static constexpr auto kOperatingSystem = "operating-system"sv;
static constexpr auto kIconTheme = "icon-theme"sv;
static constexpr auto kRuntime = "runtime"sv;

// Bundle types
static constexpr auto kPackage = "package"sv;
static constexpr auto kLimba = "limba"sv;
static constexpr auto kFlatpak = "flatpak"sv;
static constexpr auto kAppimage = "appimage"sv;
static constexpr auto kSnap = "snap"sv;
static constexpr auto kTarball = "tarball"sv;
static constexpr auto kCabinet = "cabinet"sv;
static constexpr auto kLinglong = "linglong"sv;

// Icon types
static constexpr auto kStock = "stock"sv;
static constexpr auto kCached = "cached"sv;
static constexpr auto kLocal = "local"sv;
static constexpr auto kUrl = "url"sv;
static constexpr auto kRemote = "remote"sv;

// Desktop
static constexpr auto kCosmic = "COSMIC"sv;
static constexpr auto kGnome = "GNOME"sv;
static constexpr auto kGnomeClassic = "GNOME-Classic"sv;
static constexpr auto kGnomeFlashback = "GNOME-Flashback"sv;
static constexpr auto kKde = "KDE"sv;
static constexpr auto kLxde = "LXDE"sv;
static constexpr auto kLxqt = "LXQt"sv;
static constexpr auto kMate = "MATE"sv;
static constexpr auto kRazor = "Razor"sv;
static constexpr auto kRox = "ROX"sv;
static constexpr auto kTde = "TDE"sv;
static constexpr auto kUnity = "Unity"sv;
static constexpr auto kXfce = "XFCE"sv;
static constexpr auto kEde = "EDE"sv;
static constexpr auto kCinnamon = "Cinnamon"sv;
static constexpr auto kPantheon = "Pantheon"sv;
static constexpr auto kDde = "DDE"sv;
static constexpr auto kEndless = "Endless"sv;
static constexpr auto kOld = "Old"sv;

// URL types
static constexpr auto kHomepage = "homepage"sv;
static constexpr auto kBugtracker = "bugtracker"sv;
static constexpr auto kFaq = "faq"sv;
static constexpr auto kHelp = "help"sv;
static constexpr auto kDonation = "donation"sv;
static constexpr auto kTranslate = "translate"sv;
static constexpr auto kContact = "contact"sv;
static constexpr auto kVcsBrowser = "vcs-browser"sv;
static constexpr auto kContribute = "contribute"sv;

// Launchable types
static constexpr auto kDesktopId = "desktop-id"sv;
static constexpr auto kService = "service"sv;
static constexpr auto kCockpitManifest = "cockpit-manifest"sv;

// Release
static constexpr auto kStable = "stable"sv;
static constexpr auto kDevelopment = "development"sv;
static constexpr auto kSnapshot = "snapshot"sv;
static constexpr auto kLow = "low"sv;
static constexpr auto kMedium = "medium"sv;
static constexpr auto kHigh = "high"sv;
static constexpr auto kCritical = "critical"sv;
static constexpr auto kGenericIssue = "generic"sv;
static constexpr auto kCve = "cve"sv;

// ================================================================
// URL helpers
// ================================================================

std::string_view Component::getUrl(UrlType t) const {
  for (const auto &[ut, v] : urls) {
    if (ut == t)
      return v;
  }
  return {};
}

void Component::setUrl(UrlType t, std::string value) {
  for (auto &[ut, v] : urls) {
    if (ut == t) {
      v = std::move(value);
      return;
    }
  }
  urls.emplace_back(t, std::move(value));
}

// ================================================================
// shrinkToFit
// ================================================================

void Component::shrinkToFit() {
  urls.shrink_to_fit();
  icons.shrink_to_fit();
  compulsory_for_desktop.shrink_to_fit();
  keywords.shrink_to_fit();
  categories.shrink_to_fit();
  releases.shrink_to_fit();
  supportedLanguages.shrink_to_fit();
  screenshots.shrink_to_fit();
  content_rating.attributes.shrink_to_fit();
  provides.binaries.shrink_to_fit();
  provides.libraries.shrink_to_fit();
  provides.mediatypes.shrink_to_fit();
  provides.dbus.shrink_to_fit();
  provides.firmware.shrink_to_fit();
  provides.ids.shrink_to_fit();
  branding_colors.shrink_to_fit();
  requires_.shrink_to_fit();
  recommends.shrink_to_fit();
  extends.shrink_to_fit();
  replaces.shrink_to_fit();
  suggests_ids.shrink_to_fit();
  custom.shrink_to_fit();
  translations.shrink_to_fit();
  for (auto &rel : releases) {
    rel.issues.shrink_to_fit();
    rel.artifacts.shrink_to_fit();
    for (auto &art : rel.artifacts) {
      art.checksums.shrink_to_fit();
      art.sizes.shrink_to_fit();
    }
  }
  for (auto &ss : screenshots) {
    ss.images.shrink_to_fit();
    ss.videos.shrink_to_fit();
  }
}

// ================================================================
// Component type conversion
// ================================================================

Component::Type Component::stringToComponentType(std::string_view s) {
  if (s == kDesktopApplication || s == kDesktop)
    return Type::DESKTOP_APPLICATION;
  if (s == kConsoleApplication)
    return Type::CONSOLE_APPLICATION;
  if (s == kWebApplication)
    return Type::WEB_APPLICATION;
  if (s == kAddon)
    return Type::ADDON;
  if (s == kFont)
    return Type::FONT;
  if (s == kCodec)
    return Type::CODEC;
  if (s == kInputMethod)
    return Type::INPUT_METHOD;
  if (s == kFirmware)
    return Type::FIRMWARE;
  if (s == kDriver)
    return Type::DRIVER;
  if (s == kLocalization)
    return Type::LOCALIZATION;
  if (s == kServiceType)
    return Type::SERVICE;
  if (s == kRepository)
    return Type::REPOSITORY;
  if (s == kOperatingSystem)
    return Type::OPERATING_SYSTEM;
  if (s == kIconTheme)
    return Type::ICON_THEME;
  if (s == kRuntime)
    return Type::RUNTIME;
  if (s == kGeneric)
    return Type::GENERIC;
  return Type::UNKNOWN;
}

std::string_view Component::componentTypeToString(Type t) {
  switch (t) {
  case Type::DESKTOP_APPLICATION:
    return kDesktopApplication;
  case Type::CONSOLE_APPLICATION:
    return kConsoleApplication;
  case Type::WEB_APPLICATION:
    return kWebApplication;
  case Type::ADDON:
    return kAddon;
  case Type::FONT:
    return kFont;
  case Type::CODEC:
    return kCodec;
  case Type::INPUT_METHOD:
    return kInputMethod;
  case Type::FIRMWARE:
    return kFirmware;
  case Type::DRIVER:
    return kDriver;
  case Type::LOCALIZATION:
    return kLocalization;
  case Type::SERVICE:
    return kServiceType;
  case Type::REPOSITORY:
    return kRepository;
  case Type::OPERATING_SYSTEM:
    return kOperatingSystem;
  case Type::ICON_THEME:
    return kIconTheme;
  case Type::RUNTIME:
    return kRuntime;
  case Type::GENERIC:
    return kGeneric;
  default:
    return kUnknown;
  }
}

// ================================================================
// Remaining enum conversions (unchanged logic, string_view API)
// ================================================================

Component::BundleType Component::stringToBundleType(std::string_view s) {
  if (s == kPackage)
    return BundleType::PACKAGE;
  if (s == kLimba)
    return BundleType::LIMBA;
  if (s == kFlatpak)
    return BundleType::FLATPAK;
  if (s == kAppimage)
    return BundleType::APPIMAGE;
  if (s == kSnap)
    return BundleType::SNAP;
  if (s == kTarball)
    return BundleType::TARBALL;
  if (s == kCabinet)
    return BundleType::CABINET;
  if (s == kLinglong)
    return BundleType::LINGLONG;
  return BundleType::UNKNOWN;
}

std::string_view Component::bundleTypeToString(BundleType t) {
  switch (t) {
  case BundleType::PACKAGE:
    return kPackage;
  case BundleType::LIMBA:
    return kLimba;
  case BundleType::FLATPAK:
    return kFlatpak;
  case BundleType::APPIMAGE:
    return kAppimage;
  case BundleType::SNAP:
    return kSnap;
  case BundleType::TARBALL:
    return kTarball;
  case BundleType::CABINET:
    return kCabinet;
  case BundleType::LINGLONG:
    return kLinglong;
  default:
    return kUnknown;
  }
}

Component::IconType Component::stringToIconType(std::string_view s) {
  if (s == kStock)
    return IconType::STOCK;
  if (s == kCached)
    return IconType::CACHED;
  if (s == kLocal)
    return IconType::LOCAL;
  if (s == kUrl)
    return IconType::URL;
  if (s == kRemote)
    return IconType::REMOTE;
  return IconType::UNKNOWN;
}

std::string_view Component::iconTypeToString(IconType t) {
  switch (t) {
  case IconType::STOCK:
    return kStock;
  case IconType::CACHED:
    return kCached;
  case IconType::LOCAL:
    return kLocal;
  case IconType::URL:
    return kUrl;
  case IconType::REMOTE:
    return kRemote;
  default:
    return kUnknown;
  }
}

Component::CompulsoryForDesktop
Component::stringToCompulsoryForDesktop(std::string_view s) {
  if (s == kCosmic)
    return CompulsoryForDesktop::COSMIC;
  if (s == kGnome)
    return CompulsoryForDesktop::GNOME;
  if (s == kGnomeClassic)
    return CompulsoryForDesktop::GNOME_Classic;
  if (s == kGnomeFlashback)
    return CompulsoryForDesktop::GNOME_Flashback;
  if (s == kKde)
    return CompulsoryForDesktop::KDE;
  if (s == kLxde)
    return CompulsoryForDesktop::LXDE;
  if (s == kLxqt)
    return CompulsoryForDesktop::LXQt;
  if (s == kMate)
    return CompulsoryForDesktop::MATE;
  if (s == kRazor)
    return CompulsoryForDesktop::Razor;
  if (s == kRox)
    return CompulsoryForDesktop::ROX;
  if (s == kTde)
    return CompulsoryForDesktop::TDE;
  if (s == kUnity)
    return CompulsoryForDesktop::Unity;
  if (s == kXfce)
    return CompulsoryForDesktop::XFCE;
  if (s == kEde)
    return CompulsoryForDesktop::EDE;
  if (s == kCinnamon)
    return CompulsoryForDesktop::Cinnamon;
  if (s == kPantheon)
    return CompulsoryForDesktop::Pantheon;
  if (s == kDde)
    return CompulsoryForDesktop::DDE;
  if (s == kEndless)
    return CompulsoryForDesktop::Endless;
  if (s == kOld)
    return CompulsoryForDesktop::Old;
  return CompulsoryForDesktop::UNKNOWN;
}

std::string_view
Component::compulsoryForDesktopToString(CompulsoryForDesktop d) {
  switch (d) {
  case CompulsoryForDesktop::COSMIC:
    return kCosmic;
  case CompulsoryForDesktop::GNOME:
    return kGnome;
  case CompulsoryForDesktop::GNOME_Classic:
    return kGnomeClassic;
  case CompulsoryForDesktop::GNOME_Flashback:
    return kGnomeFlashback;
  case CompulsoryForDesktop::KDE:
    return kKde;
  case CompulsoryForDesktop::LXDE:
    return kLxde;
  case CompulsoryForDesktop::LXQt:
    return kLxqt;
  case CompulsoryForDesktop::MATE:
    return kMate;
  case CompulsoryForDesktop::Razor:
    return kRazor;
  case CompulsoryForDesktop::ROX:
    return kRox;
  case CompulsoryForDesktop::TDE:
    return kTde;
  case CompulsoryForDesktop::Unity:
    return kUnity;
  case CompulsoryForDesktop::XFCE:
    return kXfce;
  case CompulsoryForDesktop::EDE:
    return kEde;
  case CompulsoryForDesktop::Cinnamon:
    return kCinnamon;
  case CompulsoryForDesktop::Pantheon:
    return kPantheon;
  case CompulsoryForDesktop::DDE:
    return kDde;
  case CompulsoryForDesktop::Endless:
    return kEndless;
  case CompulsoryForDesktop::Old:
    return kOld;
  default:
    return kUnknown;
  }
}

Component::UrlType Component::stringToUrlType(std::string_view s) {
  if (s == kHomepage)
    return UrlType::HOMEPAGE;
  if (s == kBugtracker)
    return UrlType::BUGTRACKER;
  if (s == kFaq)
    return UrlType::FAQ;
  if (s == kHelp)
    return UrlType::HELP;
  if (s == kDonation)
    return UrlType::DONATION;
  if (s == kTranslate)
    return UrlType::TRANSLATE;
  if (s == kContact)
    return UrlType::CONTACT;
  if (s == kVcsBrowser)
    return UrlType::VCS_BROWSER;
  if (s == kContribute)
    return UrlType::CONTRIBUTE;
  return UrlType::UNKNOWN;
}

std::string_view Component::urlTypeToString(UrlType t) {
  switch (t) {
  case UrlType::HOMEPAGE:
    return kHomepage;
  case UrlType::BUGTRACKER:
    return kBugtracker;
  case UrlType::FAQ:
    return kFaq;
  case UrlType::HELP:
    return kHelp;
  case UrlType::DONATION:
    return kDonation;
  case UrlType::TRANSLATE:
    return kTranslate;
  case UrlType::CONTACT:
    return kContact;
  case UrlType::VCS_BROWSER:
    return kVcsBrowser;
  case UrlType::CONTRIBUTE:
    return kContribute;
  default:
    return kUnknown;
  }
}

Component::LaunchableType
Component::stringToLaunchableType(std::string_view s) {
  if (s == kDesktopId)
    return LaunchableType::DESKTOP_ID;
  if (s == kService)
    return LaunchableType::SERVICE;
  if (s == kCockpitManifest)
    return LaunchableType::COCKPIT_MANIFEST;
  if (s == kUrl)
    return LaunchableType::URL;
  return LaunchableType::UNKNOWN;
}

Component::ReleaseType Component::stringToReleaseType(std::string_view s) {
  if (s == kStable)
    return ReleaseType::STABLE;
  if (s == kDevelopment)
    return ReleaseType::DEVELOPMENT;
  if (s == kSnapshot)
    return ReleaseType::SNAPSHOT;
  return ReleaseType::UNKNOWN;
}

std::string_view Component::releaseTypeToString(ReleaseType t) {
  switch (t) {
  case ReleaseType::STABLE:
    return kStable;
  case ReleaseType::DEVELOPMENT:
    return kDevelopment;
  case ReleaseType::SNAPSHOT:
    return kSnapshot;
  default:
    return kUnknown;
  }
}

Component::ReleaseUrgency
Component::stringToReleaseUrgency(std::string_view s) {
  if (s == kLow)
    return ReleaseUrgency::LOW;
  if (s == kMedium)
    return ReleaseUrgency::MEDIUM;
  if (s == kHigh)
    return ReleaseUrgency::HIGH;
  if (s == kCritical)
    return ReleaseUrgency::CRITICAL;
  return ReleaseUrgency::UNKNOWN;
}

std::string_view Component::releaseUrgencyToString(ReleaseUrgency t) {
  switch (t) {
  case ReleaseUrgency::LOW:
    return kLow;
  case ReleaseUrgency::MEDIUM:
    return kMedium;
  case ReleaseUrgency::HIGH:
    return kHigh;
  case ReleaseUrgency::CRITICAL:
    return kCritical;
  default:
    return kUnknown;
  }
}

Component::IssueType Component::stringToIssueType(std::string_view s) {
  if (s == kGenericIssue)
    return IssueType::GENERIC;
  if (s == kCve)
    return IssueType::CVE;
  return IssueType::UNKNOWN;
}

std::string_view Component::issueTypeToString(IssueType t) {
  switch (t) {
  case IssueType::GENERIC:
    return kGenericIssue;
  case IssueType::CVE:
    return kCve;
  default:
    return kUnknown;
  }
}

void Component::addSupportedLanguage(const std::string &language) {
  supportedLanguages.push_back(language);
}

// ================================================================
// Dump (diagnostic output)
// ================================================================

void Component::Dump() const {
  spdlog::info("id: {} (type: {})", id, componentTypeToString(type));
  spdlog::info("  name: {}", name);
  if (!name_variant_suffix.empty())
    spdlog::info("  name_variant_suffix: {}", name_variant_suffix);
  spdlog::info("  summary: {}", summary);
  if (!projectLicense.empty())
    spdlog::info("  project_license: {}", projectLicense);
  if (!metadata_license.empty())
    spdlog::info("  metadata_license: {}", metadata_license);
  if (!description.empty())
    spdlog::info("  description: {}...", description.substr(0, 120));

  for (const auto &[t, v] : urls) {
    spdlog::info("  url [{}]: {}", urlTypeToString(t), v);
  }

  if (!extends.empty()) {
    for (const auto &e : extends)
      spdlog::info("  extends: {}", e);
  }

  if (!screenshots.empty()) {
    spdlog::info("  screenshots: {}", screenshots.size());
    for (const auto &ss : screenshots) {
      spdlog::info("    default={} images={} caption={}", ss.isDefault,
                   ss.images.size(), ss.caption);
    }
  }

  if (!content_rating.type.empty()) {
    spdlog::info("  content_rating: {} ({} attrs)", content_rating.type,
                 content_rating.attributes.size());
  }

  if (!provides.binaries.empty() || !provides.libraries.empty() ||
      !provides.mediatypes.empty() || !provides.ids.empty()) {
    spdlog::info("  provides: {} bins, {} libs, {} mediatypes",
                 provides.binaries.size(), provides.libraries.size(),
                 provides.mediatypes.size());
  }

  if (!branding_colors.empty()) {
    for (const auto &[scheme, val] : branding_colors) {
      spdlog::info("  branding: {}={}", scheme, val);
    }
  }

  for (const auto &rel : releases) {
    spdlog::info("  release: {} {} ({})", rel.version,
                 releaseTypeToString(rel.type),
                 rel.date.empty() ? rel.timestamp : rel.date);
  }
}