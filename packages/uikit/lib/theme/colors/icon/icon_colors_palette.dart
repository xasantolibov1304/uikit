// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/icon/icon_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightIconColors = _generatePaletteFromBrightness(Brightness.light);
final darkIconColors = _generatePaletteFromBrightness(Brightness.dark);

IconColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return IconColors(
      primary: Palette.gray[100]!,
      secondary: Palette.gray[70]!,
      tertiary: Palette.gray[50]!,
      muted: Palette.gray[20]!,
      info: Palette.cyan[60]!,
      error: Palette.red[70]!,
      warning: Palette.yellow[60]!,
      success: Palette.green[60]!,
      invert: Palette.gray[0]!,
    );
  } else {
    return IconColors(
      primary: Palette.gray[100]!,
      secondary: Palette.gray[70]!,
      tertiary: Palette.gray[50]!,
      muted: Palette.gray[20]!,
      info: Palette.cyan[60]!,
      error: Palette.red[70]!,
      warning: Palette.yellow[60]!,
      success: Palette.green[60]!,
      invert: Palette.gray[0]!,
    );
  }
}
