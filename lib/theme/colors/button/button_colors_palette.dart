// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/button/button_colors.dart';
import 'package:uikit/theme/palette.dart';

final lightButtonColors = _generatePaletteFromBrightness(Brightness.light);
final darkButtonColors = _generatePaletteFromBrightness(Brightness.dark);

ButtonColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ButtonColors(
      primary: Palette.gray[80]!,
      secondary: Palette.gray[20]!,
      tertiary: Palette.gray[0]!,
      inverted: Palette.gray[100]!,
      ghost: const Color(0x00000000),
      positive: Palette.green[50]!,
      negative: Palette.red[60]!,
      disabled: Palette.gray[40]!,
    );
  } else {
    return ButtonColors(
      primary: Palette.gray[80]!,
      secondary: Palette.gray[20]!,
      tertiary: Palette.gray[0]!,
      inverted: Palette.gray[100]!,
      ghost: const Color(0x00000000),
      positive: Palette.green[50]!,
      negative: Palette.red[60]!,
      disabled: Palette.gray[40]!,
    );
  }
}
