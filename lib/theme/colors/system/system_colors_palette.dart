// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/colors.dart';

final lightSystemColors = _generatePaletteFromBrightness(Brightness.light);
final darkSystemColors = _generatePaletteFromBrightness(Brightness.dark);

SystemColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return SystemColors(
      white: const Color(0xFFFFFFFF),
      black: const Color(0xFF000000),
      transparent: const Color(0x00FFFFFF),
      red: const Color(0xFFF20000),
    );
  } else {
    return SystemColors(
      white: const Color(0xFFFFFFFF),
      black: const Color(0xFF000000),
      transparent: const Color(0x00FFFFFF),
      red: const Color(0xFFF20000),
    );
  }
}
