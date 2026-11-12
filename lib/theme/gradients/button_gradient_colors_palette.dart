// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/gradients/button_gradient_colors.dart';
import 'package:uikit/theme/palette.dart';

final lightButtonGradientColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkButtonGradientColors =
    _generatePaletteFromBrightness(Brightness.dark);

ButtonGradientColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ButtonGradientColors(
      primaryStart: Palette.blue[40]!,
      primaryEnd: Palette.blue[50]!,
      secondaryStart: Palette.gray[10]!,
      secondaryEnd: Palette.gray[10]!,
      successStart: Palette.green[40]!,
      successEnd: Palette.green[50]!,
    );
  } else {
    return ButtonGradientColors(
      primaryStart: Palette.blue[70]!,
      primaryEnd: Palette.blue[90]!,
      secondaryStart: Palette.gray[80]!,
      secondaryEnd: Palette.gray[70]!,
      successStart: Palette.green[70]!,
      successEnd: Palette.green[90]!,
    );
  }
}
