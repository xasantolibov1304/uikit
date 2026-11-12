// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/text/text_colors.dart';
import 'package:uikit/theme/palette.dart';

final lightTextColors = _generatePaletteFromBrightness(Brightness.light);
final darkTextColors = _generatePaletteFromBrightness(Brightness.dark);

TextColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return TextColors(
      primary: Palette.gray[100]!,
      secondary: Palette.gray[70]!,
      tertiary: Palette.gray[50]!,
      muted: Palette.gray[30]!,
      info: Palette.cyan[60]!,
      error: Palette.red[60]!,
      warning: Palette.yellow[40]!,
      success: Palette.green[50]!,
      invert: Palette.gray[0]!,
    );
  } else {
    return TextColors(
      primary: Palette.gray[100]!,
      secondary: Palette.gray[70]!,
      tertiary: Palette.gray[50]!,
      muted: Palette.gray[30]!,
      info: Palette.cyan[60]!,
      error: Palette.red[60]!,
      warning: Palette.yellow[40]!,
      success: Palette.green[50]!,
      invert: Palette.gray[0]!,
    );
  }
}
