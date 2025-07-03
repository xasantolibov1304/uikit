// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/status/status_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightStatusColors = _generatePaletteFromBrightness(Brightness.light);
final darkStatusColors = _generatePaletteFromBrightness(Brightness.dark);

StatusColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return StatusColors(
      info: Palette.cyan[40]!,
      error: Palette.red[40]!,
      warning: Palette.yellow[30]!,
      success: Palette.green[40]!,
    );
  } else {
    return StatusColors(
      info: Palette.cyan[40]!,
      error: Palette.red[40]!,
      warning: Palette.yellow[30]!,
      success: Palette.green[40]!,
    );
  }
}
