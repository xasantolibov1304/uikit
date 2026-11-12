# uikit

A Flutter design system shared across projects: **theme tokens** (colors,
typography, radii, gradients, shadows), **70+ ready components** (buttons,
inputs, bottom sheets, indicators, …), common widgets, utils and services.

One codebase, many apps: every app plugs in its own colors, font and corner
radii through the theme. **uikit itself is never edited per project.**

![Version](https://img.shields.io/badge/version-2.0.0-blue)
![Flutter](https://img.shields.io/badge/flutter-%3E%3D3.32.0-02569B)
![Dart](https://img.shields.io/badge/dart-%3E%3D3.6.0-0175C2)

---

## Contents

- [How it works](#how-it-works)
- [Installation](#installation)
- [Quick start](#quick-start)
- [Customizing for your project](#customizing-for-your-project)
- [Design tokens](#design-tokens)
- [Components](#components)
- [Bottom sheets, dialogs & common widgets](#bottom-sheets-dialogs--common-widgets)
- [Utils & services](#utils--services)
- [Assets & font](#assets--font)
- [Native setup in the app](#native-setup-in-the-app)
- [Project structure](#project-structure)
- [Development](#development)
- [Versioning & releasing](#versioning--releasing)
- [Upgrading from 1.x](#upgrading-from-1x)
- [Known limitations](#known-limitations)

---

## How it works

```
  Your app                          uikit
 ┌──────────────────────┐   ┌──────────────────────────────────────────┐
 │ UikitTheme.light(    │   │ Tokens (ThemeExtension)                  │
 │   fontFamily: ...,   │──▶│  TextColors, ButtonColors, SurfaceColors │
 │   buttonColors: ..., │   │  BaseTextStyles, TitleTextStyles, ...    │
 │   radii: ...,        │   │  UikitRadii, AppGradients                │
 │ )                    │   │            │                             │
 └──────────────────────┘   │            ▼   ThemeData.extensions      │
                            │ Components read tokens from context:     │
                            │  context.buttonColors.primary            │
                            │  context.baseTextStyle.base1             │
                            │  context.radii.xl                        │
                            └──────────────────────────────────────────┘
```

1. **Tokens.** Every visual value is a token grouped in a `ThemeExtension`
   (`TextColors`, `ButtonColors`, `BaseTextStyles`, `UikitRadii`, …).
2. **Theme.** `UikitTheme.light()` / `.dark()` puts all tokens into a
   `ThemeData`. Anything you don't pass falls back to uikit's defaults.
3. **Components.** Widgets never hardcode colors, font or radii. They read
   tokens from the current theme (`context.textColors.primary`), so changing
   the theme changes every component at once.

So project A and project B use the **same uikit version** with **different
themes**.

---

## Installation

### From git (recommended)

In the app's `pubspec.yaml`, pin a tag so builds are reproducible:

```yaml
dependencies:
  uikit:
    git:
      url: https://github.com/xasantolibov1304/uikit.git
      ref: v2.0.0   # tag, branch or commit SHA
```

```bash
flutter pub get
```

> **Private repository:** every developer machine and CI runner needs git
> access (SSH key, or use `url: git@github.com:xasantolibov1304/uikit.git`).

### Local path (while developing uikit side by side)

```yaml
dependencies:
  uikit:
    path: ../uikit
```

### Import

```dart
import 'package:uikit/uikit.dart';
```

This single import gives you the theme, all tokens, components, common
widgets, utils and generated assets.

---

## Quick start

```dart
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UikitTheme.light(),
      darkTheme: UikitTheme.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Welcome', style: context.titleTextStyle.title1),
            const SizedBox(height: 16),
            const TextInputField(label: 'Name'),
            const SizedBox(height: 16),
            Button(
              text: 'Continue',
              onTap: () => showTopSnack(context, Snack.success('Saved', null)),
            ),
          ],
        ),
      ),
    );
  }
}
```

> uikit components read their tokens from the theme. Always set
> `theme: UikitTheme.light(...)` (or a theme built with `createThemeData`),
> otherwise the defaults are used.

---

## Customizing for your project

Pass only what differs from uikit defaults.

### Font

Declare your font in the **app's** `pubspec.yaml`, then:

```dart
UikitTheme.light(
  fontFamily: 'Inter',
  fontPackage: null, // null = font from the app; default = uikit's AeonikPro
)
```

The font is applied to every text style automatically (sizes, weights and
line heights stay the same).

### Colors

```dart
UikitTheme.light(
  textColors: lightTextColors.copyWith(primary: const Color(0xFF0A2540)),
  buttonColors: lightButtonColors.copyWith(
    primary: const Color(0xFF6200EE),
    positive: const Color(0xFF00C853),
  ),
  surfaceColors: lightSurfaceColors.copyWith(secondary: const Color(0xFFF7F7FA)),
)
```

`textColors` also re-colors the default typography.

### Corner radius

```dart
UikitTheme.light(
  radii: const UikitRadii(xl: 12, lg: 8), // the rest keep defaults
)
```

### Typography (advanced)

For full control build a text style group yourself:

```dart
UikitTheme.light(
  baseTextStyles: createBaseTextStyles(
    brightness: Brightness.light,
    fontFamily: 'Inter',
    fontPackage: null,
  ).copyWith(base1: const TextStyle(fontSize: 17, height: 22 / 17)),
)
```

Builders: `createBaseTextStyles`, `createTitleTextStyles`,
`createDisplayTextStyles`, `createOthersTextStyles`.

### App-specific tokens (e.g. brand colors)

Things only one app needs live **in that app** as its own `ThemeExtension`:

```dart
class BrandColors extends ThemeExtension<BrandColors> {
  const BrandColors({required this.accent});
  final Color accent;

  @override
  BrandColors copyWith({Color? accent}) => BrandColors(accent: accent ?? this.accent);

  @override
  BrandColors lerp(covariant BrandColors? other, double t) =>
      other == null ? this : BrandColors(accent: Color.lerp(accent, other.accent, t)!);
}

UikitTheme.light(extensions: const [BrandColors(accent: Color(0xFFFF5722))]);

// usage
final accent = Theme.of(context).extension<BrandColors>()!.accent;
```

### Recommended setup in an app

Keep the app's theme in one file:

```dart
// lib/theme/app_theme.dart
import 'package:uikit/uikit.dart';

const _font = 'Inter';

final appLightTheme = UikitTheme.light(
  fontFamily: _font,
  fontPackage: null,
  buttonColors: lightButtonColors.copyWith(primary: const Color(0xFF6200EE)),
  radii: const UikitRadii(xl: 12),
);

final appDarkTheme = UikitTheme.dark(fontFamily: _font, fontPackage: null);
```

```dart
MaterialApp(theme: appLightTheme, darkTheme: appDarkTheme, ...)
```

### Full control

`createThemeData(...)` takes every token group explicitly (all required) if
you prefer not to use defaults at all.

---

## Design tokens

All tokens are available from `BuildContext` (and `ThemeData`):

### Colors

| Group | Access | Tokens |
|---|---|---|
| Text | `context.textColors` | `primary` `secondary` `tertiary` `muted` `info` `error` `warning` `success` `invert` |
| Icon | `context.iconColors` | `primary` `secondary` `tertiary` `muted` `info` `error` `warning` `success` `invert` |
| Surface | `context.surfaceColors` | `primary` `secondary` `elevated` `tertiary` `grey` `muted` `dark` `info` `error` `warning` `success` |
| Border | `context.borderColors` | `primary` `secondary` `tertiary` `muted` `info` `error` `warning` `success` `invert` `black` |
| Button | `context.buttonColors` | `primary` `secondary` `tertiary` `inverted` `ghost` `positive` `negative` `disabled` |
| System | `context.systemColors` | `white` `black` `transparent` `red` |
| Additional | `context.additionalColors` | `additional1` … `additional4` |

Defaults: `lightTextColors`, `darkTextColors`, `lightButtonColors`, … (same
pattern for every group). Raw palette: `Palette.gray[0..100]`, `coolGray`,
`blue`, `orange`, `cyan`, `red`, `yellow`, `green`, `teal`, `purple`,
`magenta`.

### Typography

| Group | Access | Styles |
|---|---|---|
| Display | `context.displayTextStyle` | `display1` … `display5` (bold) |
| Title | `context.titleTextStyle` | `title1` … `title4` (semibold) |
| Base | `context.baseTextStyle` | `base1` … `base6` (regular) |
| Others | `context.othersTextStyle` | `cardBank` |

Weight helpers: `style.regular`, `.medium`, `.semibold`, `.bold`.

```dart
Text('Hello', style: context.baseTextStyle.base2.medium);
```

### Corner radius — `context.radii`

| Token | Default | Used for |
|---|---|---|
| `xs` | 2 | thin bars, segment indicators |
| `sm` | 4 | progress bars, small indicators |
| `md` | 8 | tabs, small controls, uploads |
| `lg` | 12 | small buttons, badges, dropdowns, snackbars, tooltips |
| `xl` | 16 | cards, inputs, large buttons, sheets, dialogs, alerts |
| `full` | 100 | pills, avatars, fully rounded shapes |

### Gradients — `context.appGradients`

`toast`, `shimmer`, `button`, `background`, `card` — each with its own
variants (e.g. `context.appGradients.button.primary`).

### Shadows — `CommonShadows`

`smallShadow`, `compactShadow`, `baseShadow`, `focusShadow`, `mediumShadow`,
`largeShadow`.

---

## Components

All components are exported from `package:uikit/uikit.dart`. The
[example app](example/) shows each of them.

### Buttons & actions

| Widget | Description |
|---|---|
| `Button` | Main button. `type`: `primary` `secondary` `tertiary` `inverted` `ghost` `positive` `negative`; `size`: `small` (40) `medium` (48) `large` (56); icons, subtext, counter badge, loading state |
| `ButtonCell` | List-row style action cell |
| `Filter` | Filter / sort chip with counter badge |
| `Breadcrumb` | Breadcrumb navigation (`BreadcrumbItem`) |

```dart
Button(
  text: 'Pay',
  type: ButtonType.positive,
  size: ButtonSize.medium,
  isLoading: state.isLoading,
  onTap: pay,
)
```

### Inputs

| Widget | Description |
|---|---|
| `InputField` | Base field used by all inputs (`InputFieldSize`, `InputFieldStatus`) |
| `TextInputField` | Text input with label, caption, validation |
| `PasswordInputField` | Password with visibility toggle |
| `PhoneTextField` | Phone number with mask |
| `AmountInputField` | Money amount with formatting |
| `CurrencyInputField` | Amount + currency (`CurrencyType`) |
| `AccountInputField` | Bank account number |
| `IdInputField` | Document / ID number |
| `DateInputField` / `TimeInputField` | Date / time with masks |
| `ExpireDateTextField` | Card expiry date (MM/YY) |
| `SearchInputField` | Search field |
| `AreaInputField` | Multi-line text |
| `SelectInputField` | Field that opens a picker |
| `SliderInputField` | Field with slider |
| `DoubleParameterInputField` | Two values in one field |
| `Pincode` | PIN / OTP input |

```dart
TextInputField(
  label: 'Email',
  hintText: 'name@mail.com',
  keyboardType: TextInputType.emailAddress,
  status: hasError ? InputFieldStatus.error : InputFieldStatus.info,
  captionText: hasError ? 'Invalid email' : null,
  onChanged: onEmailChanged,
)
```

### Selection controls

| Widget | Description |
|---|---|
| `CheckboxWidget` / `CheckboxCard` | Checkbox, checkbox inside a card |
| `RadioWidget` / `RadioCard` | Radio, radio inside a card |
| `Switcher` / `SwitcherMini` / `SwitcherCard` | Switches in three sizes / card |
| `CardSelect` | Selectable card |
| `CommonDropdown` / `ModalMenu` | Dropdown and modal menu |
| `InputSlider` / `DoubleSlider` | Single-value and range sliders |
| `CommonTabBar` | Segmented tab bar |

### Feedback & status

| Widget | Description |
|---|---|
| `showTopSnack(context, Snack.success(...))` | Snackbar: `neutral` `success` `warning` `error` `info` |
| `InfoAlert` | Inline alert (`InfoAlertType`), dismissible |
| `Notice` | Notice block (`NoticeType`) |
| `CommonTooltip` | Tooltip |
| `LoadingIndicator` / `OverlayLoader` | Spinner, full-screen loader overlay |
| `EmptyState` + `EmptyStateModel` | Empty list / no data screen |
| `StatusScreen` + `StatusActionButton` | Success / error result screens (`StatusScreenType`) |

### Progress & indicators

| Widget | Description |
|---|---|
| `CommonProgressIndicator`, `RoundedProgressIndicator` | Circular progress |
| `CommonLinearProgressIndicator`, `LinearProgressBarIndicator` | Linear progress |
| `SegmentProgressIndicator`, `PagedSegmentProgressIndicator` | Segmented / story-like progress |
| `StepIndicator`, `HorizontalStepIndicator` | Step flows (`StepData`) |
| `PageIndicator`, `NumericalPageIndicator` | Carousel page dots / "1 of 5" |
| `BadgeIndicator` | Counter badge over any widget |

### Content & layout

| Widget | Description |
|---|---|
| `TextWidget`, `TextDisplay`, `TextHighlight`, `CommonRichText` | Text helpers, highlighted text |
| `NumberSlideAnimation` | Animated number change |
| `TitleWidget` | Section title (`TitleWidgetSize`) |
| `InfoField` | Label + value row |
| `Accordion` | Expandable section |
| `AvatarWidget` | Avatar (`AvatarType`) |
| `BadgeWidget` | Status badge / tag |
| `PromoBanner`, `PromoBannerCarousel` | Promo banners |
| `CardBalanceMain`, `CardBalanceSub` | Balance overview cards |
| `FileLoader` (+ `FileLoaderItemModel`) | Uploaded files list with progress |

### Navigation

| Widget | Description |
|---|---|
| `AppBarInternal`, `NoAppBar` | App bars |
| `CommonBottomNavigationBar`, `BottomNavBarItem` | Bottom navigation |

---

## Bottom sheets, dialogs & common widgets

```dart
CustomBottomSheet.showStaticBottomSheet(context, title: 'Filter', child: FilterForm());
CustomBottomSheet.showScrollableBottomSheet(context, title: 'Cities', child: CityList());

CustomDialog.showAlertDialog(
  context,
  title: 'Delete card?',
  description: 'This cannot be undone',
  actionButtonText: 'Delete',
  actionButtonType: ButtonType.negative,
  cancelButtonText: 'Cancel',
  onAction: deleteCard,
);
```

| Widget | Description |
|---|---|
| `CustomBottomSheet`, `StaticBottomSheet`, `ScrollableBottomSheet` | Bottom sheets |
| `CustomActionSheet`, `CommonCupertinoActionSheet`, `CupertinoActionItem` | iOS-style action sheets |
| `TimePickerSheet` | Time picker sheet |
| `CustomDialog` | Alert dialogs |
| `CommonInkWell`, `CommonGestureDetector` | Tap handling with consistent feedback |
| `CommonRefresher` | Pull-to-refresh |
| `LazyLoadScrollView` | Infinite scroll / pagination |
| `FocusRemover` | Hides keyboard on outside tap |

---

## Utils & services

| Class | Purpose |
|---|---|
| `DateFormatterHelper`, `DateTextFormatter`, `DateUtilsHelper` | Date formatting / parsing |
| `NumberFormatterHelper` | Money / number formatting |
| `StringHelper`, `StringExtension` | String helpers |
| `TextMasks`, `CommonRegExps` | Input masks and regexps |
| `FileHelper`, `MediaHelper` | File types, screen / keyboard metrics |
| `ImagePickerService`, `FilePickerService`, `PermissionServiceImpl` | Camera/gallery, files, permissions |

Not exported from the main import (use the direct path if needed):

```dart
import 'package:uikit/utils/validation_helper.dart';     // ValidationHelper
import 'package:uikit/utils/passport_data_helper.dart';  // PassportDataUtil
import 'package:uikit/services/url_launcher_service.dart';
import 'package:uikit/services/device_info_service.dart';
import 'package:uikit/services/package_info_service.dart';
import 'package:uikit/components/file_upload/file_upload.dart';
import 'package:uikit/common/shake_widget.dart';
```

---

## Assets & font

Icons, flags and the font are bundled in the package — the app does **not**
need to declare them.

```dart
UikitAssets.icons24.arrowDown.svg(width: 24, height: 24);
UikitAssets.flags.uz.svg(width: 20);
```

| Folder | Content |
|---|---|
| `icons16` `icons20` `icons24` `icons32` `icons40` `icons96` | SVG icons by size |
| `flags` | `uz` `ru` `kz` `usa` `uae` |
| `menu` | Bottom navigation icons |
| `fonts` | Aeonik Pro (400, 500, 600, 700) |

`UikitAssets` is generated by `flutter_gen` (see [Development](#development)).

---

## Native setup in the app

uikit depends on a few plugins that need configuration **in the app**:

| Feature | Plugin | What to add |
|---|---|---|
| Camera / gallery | `image_picker` | iOS `Info.plist`: `NSCameraUsageDescription`, `NSPhotoLibraryUsageDescription` |
| Biometrics | `local_auth` | iOS `NSFaceIDUsageDescription`; Android: `MainActivity` extends `FlutterFragmentActivity`, `USE_BIOMETRIC` permission |
| Permissions | `permission_handler` | iOS `Podfile` `GCC_PREPROCESSOR_DEFINITIONS` for used permissions; Android manifest permissions |
| Links | `url_launcher` | Android `<queries>` / iOS `LSApplicationQueriesSchemes` for custom schemes |

---

## Project structure

```
lib/
├── uikit.dart              # single public entrypoint
├── theme/
│   ├── uikit_theme.dart    # UikitTheme.light / dark / create
│   ├── theme_helper.dart   # createThemeData, lightTheme, darkTheme
│   ├── colors/             # color token groups + default palettes
│   ├── typographies/       # text style groups, builders, UikitFont
│   ├── radii/              # UikitRadii
│   ├── gradients/          # gradient token groups
│   ├── shadows/            # CommonShadows
│   └── palette.dart        # raw color palette
├── components/             # UI components (buttons, inputs, ...)
├── common/                 # bottom sheets, dialogs, base widgets
├── states/  status/        # empty state, status screens
├── services/  utils/       # helpers and platform services
└── gen/                    # generated assets (do not edit)
assets/                     # icons, flags, fonts
example/                    # showcase app
test/                       # unit & widget tests
```

---

## Development

```bash
fvm flutter pub get

# regenerate lib/gen after adding/removing assets
fvm dart run build_runner build --delete-conflicting-outputs

fvm flutter analyze
fvm flutter test

# showcase app
cd example && fvm flutter run
```

Rules for contributing:

- **No hardcoded colors, font sizes or radii in components.** Use tokens
  (`context.textColors.*`, `context.baseTextStyle.*`, `context.radii.*`).
  If a value is missing, add a token instead of a literal.
- Nothing project-specific in uikit — that belongs in the app as a
  `ThemeExtension` (see [App-specific tokens](#app-specific-tokens-eg-brand-colors)).
- New public widgets must be exported from the barrel files
  (`components/components.dart`, `common/common.dart`, …).

---

## Versioning & releasing

uikit follows [semver](https://semver.org): breaking API changes bump the
major version.

1. Bump `version` in `pubspec.yaml` and describe changes in
   [CHANGELOG.md](CHANGELOG.md).
2. Merge to `main`, then tag: `git tag v2.1.0 && git push origin v2.1.0`.
3. In each app update `ref:` to the new tag when you're ready — apps never
   change until they opt in.

---

## Upgrading from 1.x

| 1.x | 2.0 |
|---|---|
| `theme: lightTheme` only | `UikitTheme.light(...)` with optional overrides |
| `context.brandColors.*` | removed — define your own `ThemeExtension` and pass it via `extensions:` |
| `x.copyWith(...) as TextColors` | `x.copyWith(...)` (cast no longer needed) |
| `createThemeData(brandColors: ...)` | parameter removed |

Full list in [CHANGELOG.md](CHANGELOG.md).

---

## Known limitations

- **Dark theme:** default dark palettes are currently identical to light
  ones. Pass your own dark tokens to `UikitTheme.dark(...)` until real dark
  palettes are added.
- `CommonShadows` are constants, not theme tokens yet.
