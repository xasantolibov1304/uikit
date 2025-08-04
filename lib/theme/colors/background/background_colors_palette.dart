// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/background/background_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightBackgroundColors = _generatePaletteFromBrightness(Brightness.light);
final darkBackgroundColors = _generatePaletteFromBrightness(Brightness.dark);

BackgroundColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return BackgroundColors(
      primary: Palette.gray[0]!,
      secondary: Palette.gray[10]!,
      transparent: const Color(0x00FFFFFF),
    );
  } else {
    return BackgroundColors(
      primary: Palette.gray[0]!,
      secondary: Palette.gray[10]!,
      transparent: const Color(0x00FFFFFF),
    );
  }
}
