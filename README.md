# uikit

Design system for Flutter: theme (colors, gradients, typography, shadows),
components (buttons, inputs, bottom sheets, indicators, …), common widgets,
utils and services. Ships the **Aeonik Pro** font and all icons/flags as package assets.

Requires Flutter `>=3.32.0`, Dart `>=3.6.0`.

## Installation

Add to the consuming app's `pubspec.yaml` (pin a tag so builds are reproducible):

```yaml
dependencies:
  uikit:
    git:
      url: https://github.com/xasantolibov1304/uikit.git
      ref: v1.0.0   # tag, branch or commit SHA
```

For local development side-by-side:

```yaml
dependencies:
  uikit:
    path: ../uikit
```

Then run `flutter pub get`.

> If the repository is private, every machine/CI that builds the app needs git access
> to it (SSH key or a token in the URL, e.g. `git@github.com:xasantolibov1304/uikit.git`).

## Usage

```dart
import 'package:uikit/uikit.dart';
```

Fonts and assets are resolved from the package automatically — the consuming app does
**not** need to declare them. Generated asset accessors are available via `UikitAssets`:

```dart
UikitAssets.icons24.arrowDown.svg(width: 24, height: 24);
```

## Native setup required in the consuming app

Some dependencies are plugins that need platform configuration in the **app**:

| Feature | Plugin | What to add |
|---|---|---|
| Camera / gallery | `image_picker` | iOS `Info.plist`: `NSCameraUsageDescription`, `NSPhotoLibraryUsageDescription` |
| Biometrics | `local_auth` | iOS: `NSFaceIDUsageDescription`; Android: `MainActivity` extends `FlutterFragmentActivity`, `USE_BIOMETRIC` permission |
| Permissions | `permission_handler` | iOS `Podfile` `GCC_PREPROCESSOR_DEFINITIONS` for used permissions; Android manifest permissions |
| Links | `url_launcher` | Android `<queries>` / iOS `LSApplicationQueriesSchemes` for custom schemes |

## Development

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs   # regenerate lib/gen
cd example && fvm flutter run                                    # showcase app
```

## Releasing a new version

1. Bump `version` in `pubspec.yaml` and add an entry to `CHANGELOG.md`.
2. Commit, then tag: `git tag v1.1.0 && git push origin v1.1.0`.
3. In consuming apps update `ref:` to the new tag.
