// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/border/border_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightBorderColors = _generatePaletteFromBrightness(Brightness.light);
final darkBorderColors = _generatePaletteFromBrightness(Brightness.dark);

BorderColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return BorderColors(
      primary: Palette.gray[20]!,
      secondary: Palette.gray[40]!,
      tertiary: Palette.gray[70]!,
      muted: Palette.gray[20]!,
      info: Palette.cyan[60]!,
      error: Palette.red[70]!,
      warning: Palette.yellow[40]!,
      success: Palette.green[50]!,
      invert: Palette.gray[0]!,
      black: Palette.gray[100]!,
    );
  } else {
    return BorderColors(
      primary: Palette.gray[20]!,
      secondary: Palette.gray[40]!,
      tertiary: Palette.gray[40]!,
      muted: Palette.gray[20]!,
      info: Palette.cyan[60]!,
      error: Palette.red[70]!,
      warning: Palette.yellow[60]!,
      success: Palette.green[70]!,
      invert: Palette.gray[0]!,
      black: Palette.gray[100]!,
    );
  }
}
