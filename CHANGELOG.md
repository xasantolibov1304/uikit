## 2.3.0

### Changed
* Real dark defaults. `darkSurfaceColors`, `darkTextColors`,
  `darkIconColors`, `darkBorderColors` and `darkButtonColors` were copies of
  the light palettes, so `UikitTheme.dark()` looked light. They are now the
  gray scale turned over — dark surfaces (`gray 100`/`90`/`80`), light text
  and icons — with the lighter step of each accent (`cyan 40`, `red 40`,
  `yellow 30`, `green 40`) so it reads on dark.
* Dark primary, inverted, positive and negative buttons have light fills:
  their text is `textColors.invert`, which is dark in the dark theme.
* `systemColors` and `additionalColors` are unchanged.

### Fixed
* `StaticBottomSheet` was always white (`systemColors.white`); it now takes
  `surfaceColors.primary` like `ScrollableBottomSheet`, so it is dark in the
  dark theme. Unchanged in light, where that token is white too.

Apps that already pass their own dark tokens to `UikitTheme.dark(...)` see
no change.

## 2.2.0

### Added
* `CommonRefresher` drips out of the Dynamic Island on an iPhone that has
  one (`IslandRefresher`): a black drop swells out of the island on a gooey
  neck and follows the finger; at the trigger point the neck snaps with a
  haptic tick and the drop wobbles free; it hangs below the island while
  the refresh runs and is sucked back in when `onRefresh` completes. The
  drop shows the same indicator as elsewhere — the theme Lottie, the logo,
  or a spinner.
  Only in portrait, with system animations on; Android, notched iPhones,
  iPads and landscape keep the indicator they had.
  Opt out with `UikitRefresherTheme(dynamicIsland: false)`.
* `DynamicIsland.rectOf(context)`: the island's rectangle on screen, or
  `null` when the device has none.

## 2.1.1

### Changed
* Lottie refresher: the animation now plays on its own as soon as the
  indicator appears and loops until the refresh completes. Before, it only
  followed the finger while pulling, so it looked frozen until release.
  The old behavior is available with `UikitRefresherTheme(lottieScrubOnPull: true)`
  (`lottiePullEnd` applies only then).
* The Lottie is paused while the indicator is hidden.

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
