// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/button/button_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightButtonColors = _generatePaletteFromBrightness(Brightness.light);
final darkButtonColors = _generatePaletteFromBrightness(Brightness.dark);

ButtonColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ButtonColors(
      primary: Palette.gray[80]!,
      primaryHover: Palette.gray[70]!,
      primaryPressed: Palette.gray[90]!,
      primaryDisable: const Color(0x1A111111),
      secondary: Palette.gray[20]!,
      secondaryHover: Palette.gray[30]!,
      secondaryPressed: Palette.gray[10]!,
      secondaryDisable: Palette.gray[30]!,
      tertiary: Palette.gray[0]!,
      tertiaryHover: Palette.gray[10]!,
      tertiaryPressed: Palette.gray[20]!,
      tertiaryDisable: const Color(0x1A111111),
      inverted: Palette.gray[100]!,
      invertedHover: Palette.gray[100]!,
      invertedPressed: Palette.gray[100]!,
      invertedDisable: const Color(0x1A111111),
      ghost: const Color(0x00000000),
      ghostHover: Palette.gray[10]!,
      ghostPressed: const Color(0x0D000000),
      ghostDisable: const Color(0x1A111111),
      positive: Palette.green[50]!,
      positiveHover: Palette.green[60]!,
      positivePressed: Palette.green[40]!,
      positiveDisable: const Color(0x1A111111),
      negative: Palette.red[60]!,
      negativeHover: Palette.red[70]!,
      negativePressed: Palette.red[50]!,
      negativeDisable: const Color(0x1A111111),
    );
  } else {
    return ButtonColors(
      primary: Palette.gray[80]!,
      primaryHover: Palette.gray[70]!,
      primaryPressed: Palette.gray[90]!,
      primaryDisable: const Color(0x1A111111),
      secondary: Palette.gray[20]!,
      secondaryHover: Palette.gray[30]!,
      secondaryPressed: Palette.gray[10]!,
      secondaryDisable: Palette.gray[30]!,
      tertiary: Palette.gray[0]!,
      tertiaryHover: Palette.gray[10]!,
      tertiaryPressed: Palette.gray[20]!,
      tertiaryDisable: const Color(0x1A111111),
      inverted: Palette.gray[100]!,
      invertedHover: Palette.gray[100]!,
      invertedPressed: Palette.gray[100]!,
      invertedDisable: const Color(0x1A111111),
      ghost: const Color(0x00000000),
      ghostHover: Palette.gray[10]!,
      ghostPressed: const Color(0x0D000000),
      ghostDisable: const Color(0x1A111111),
      positive: Palette.green[50]!,
      positiveHover: Palette.green[60]!,
      positivePressed: Palette.green[40]!,
      positiveDisable: const Color(0x1A111111),
      negative: Palette.red[60]!,
      negativeHover: Palette.red[70]!,
      negativePressed: Palette.red[50]!,
      negativeDisable: const Color(0x1A111111),
    );
  }
}
