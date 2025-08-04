// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/gradients/background_gradient_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightBackgroundGradientColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkBackgroundGradientColors =
    _generatePaletteFromBrightness(Brightness.dark);

BackgroundGradientColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return BackgroundGradientColors(
      primaryStart: Palette.purple[10]!,
      primaryEnd: Palette.blue[10]!,
      secondaryStart: Palette.gray[10]!,
      secondaryEnd: Palette.gray[10]!,
      accentStart: Palette.purple[40]!,
      accentEnd: Palette.blue[50]!,
    );
  } else {
    return BackgroundGradientColors(
      primaryStart: Palette.purple[90]!,
      primaryEnd: Palette.blue[90]!,
      secondaryStart: Palette.gray[90]!,
      secondaryEnd: Palette.gray[80]!,
      accentStart: Palette.purple[70]!,
      accentEnd: Palette.blue[70]!,
    );
  }
}
