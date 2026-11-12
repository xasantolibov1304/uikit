## 2.0.0

Makes uikit themeable per project. See README → "Customizing per project".

### Breaking
* Package renamed `iman_uikit` → `uikit` (`import 'package:uikit/uikit.dart'`).
* Removed `BrandColors` (`context.brandColors`, `lightBrandColors`, …).
  Apps that need brand colors define their own `ThemeExtension` and pass it
  via `UikitTheme.light(extensions: [...])`.
* `createThemeData` no longer takes `brandColors`.

### Added
* `UikitTheme.light/dark/create` — every token optional, defaults from uikit.
* `UikitFont` and `create{Base,Title,Display,Others}TextStyles` with
  `fontFamily`, `fontPackage`, `textColors`.
* `UikitRadii` corner radius tokens (`context.radii.xl`, …).
* `extensions` parameter for app-owned `ThemeExtension`s.
* All design tokens (colors, gradients, palette, shadows, typography) are
  exported from `package:uikit/uikit.dart`.

### Changed
* Components no longer use hardcoded colors or radii; everything comes from
  the theme.
* `copyWith` / `lerp` of theme extensions return concrete types (no `as` casts).
* Fixed package font not loading in consuming apps.
* Dependency constraints relaxed to caret ranges; Flutter `>=3.32.0`.

## 1.0.0

* Initial version.
