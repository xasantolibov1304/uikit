// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/gradients/toast_gradient_colors.dart';
import 'package:uikit/theme/palette.dart';

final lightToastGradientColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkToastGradientColors = _generatePaletteFromBrightness(Brightness.dark);

ToastGradientColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ToastGradientColors(
      grayStart: Palette.gray[10]!,
      grayEnd: Palette.gray[10]!,
    );
  } else {
    return ToastGradientColors(
      grayStart: Palette.gray[70]!,
      grayEnd: Palette.gray[60]!,
    );
  }
}
