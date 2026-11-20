## 2.1.0

### Added
* `CommonRefresher` can show a Lottie animation or the app's logo instead of
  the spinner. Set it once for the app with `UikitRefresherTheme` in
  `UikitTheme.light(extensions: [...])`:
  `lottieAsset` / `lottiePackage` / `lottiePullEnd` (takes priority) or
  `logo` / `color`. A single refresher can pass `logo:`.
  Without either the refresher is unchanged (Flutter `RefreshIndicator`).
* `LottieLoader`: plays a Lottie as a loader. While pulling, the animation
  follows the finger up to `pullEnd` of its timeline; while loading, it loops
  from there.
* `LogoLoader`: animated logo loader. While pulling, the logo spins in and
  the ring fills with the pull progress; while loading, the ring rotates and
  the logo pulses. Usable on its own as a loader.
* New dependency: `custom_refresh_indicator`.

## 2.0.3

### Fixed
* `CommonRefresher` made the page jump once after the indicator hid.
  `pull_to_refresh` swaps the scroll physics twice when a refresh completes,
  and every swap rebuilds the scroll position. `CommonRefresher` is now built
  on Flutter's own `RefreshIndicator`, which looks the same and waits for
  `onRefresh`'s `Future`.
* A child without its own `physics` can now be pulled when its content is
  shorter than the screen.

### Deprecated
* `CommonRefresher.scrollController` is ignored. Pass the controller to the
  child scroll view.

## 2.0.2

### Fixed
* `CommonRefresher` froze when pulled far down: `enableTwoLevel` was on, so a
  pull past 150 px opened the unused "second floor" instead of refreshing, and
  `onRefresh` was never called. Two-level mode is now off.
* `CommonRefresher` hid its indicator the moment `onRefresh` was called, so the
  list jumped when the data arrived afterwards. `onRefresh` may now return a
  `Future` (`FutureOr<void> Function()`); the indicator stays until it
  completes. A plain `void` callback still works and hides at once.
* `CommonRefresher` never disposed its `RefreshController`.

## 2.0.1

### Fixed
* `PasswordInputField` ignored its `controller` — the text never reached it.
* `PasswordInputField` forced `TextCapitalization.characters`, so the keyboard
  upper-cased every letter (`Demo-4Prep` was typed as `DEMO-4PREP`). It is now
  `TextCapitalization.none`.
* `InputField` disposed a `controller` / `focusNode` passed in by the caller,
  which then failed with "used after being disposed" when the caller disposed
  it too. It now disposes only what it created.
* `InputField` cleared a passed-in `controller`'s text when no `initialValue`
  was given.

## 2.0.0

Makes uikit themeable per project. See README → "Customizing per project".

### Breaking
* Package renamed to `uikit` (`import 'package:uikit/uikit.dart'`).
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
