// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Where the iPhone Dynamic Island is on screen, if this device has one.
///
/// iOS does not report the island, so it is recognised by the status bar
/// height: every iPhone with a Dynamic Island has a top safe area of 59 pt
/// or more (14 Pro: 59, 16 Pro: 62, Air: 68), every notched one 50 pt or
/// less (X–14, minis included), older iPhones and iPads 24 pt or less.
/// The island only sits at the top in portrait.
abstract final class DynamicIsland {
  /// Island size on the 14 Pro – 17 Pro (126 × 37.33 pt, within a point).
  static const double width = 126;
  static const double height = 37.33;

  /// The island is a hardware cut-out: pitch black in light and dark mode,
  /// so whatever grows out of it must be this black to look like part of it.
  static const Color color = Color(0xFF000000);

  static const double _minStatusBar = 54;

  /// The island's rectangle in global logical pixels, or `null` when there
  /// is none (Android, a notch, landscape, iPad).
  static Rect? rectOf(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.iOS) return null;

    // The raw view padding: a Scaffold removes the top inset from the
    // MediaQuery its body sees. Depending on the size rebuilds on rotation.
    final size = MediaQuery.sizeOf(context);
    final view = View.of(context);
    final statusBar = view.viewPadding.top / view.devicePixelRatio;
    if (statusBar < _minStatusBar || size.width > size.height) return null;

    // The island is centred vertically in the status bar.
    final top = (statusBar - height) / 2;
    return Rect.fromLTWH((size.width - width) / 2, top, width, height);
  }
}
