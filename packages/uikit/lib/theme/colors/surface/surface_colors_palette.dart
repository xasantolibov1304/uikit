// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/surface/surface_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightSurfaceColors = _generatePaletteFromBrightness(Brightness.light);
final darkSurfaceColors = _generatePaletteFromBrightness(Brightness.dark);

SurfaceColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return SurfaceColors(
      primary: Palette.gray[10]!,
      secondary: Palette.coolGray[10]!,
      tertiary: Palette.gray[0]!,
      muted: Palette.gray[30]!,
      info: Palette.cyan[40]!,
      error: Palette.red[40]!,
      warning: Palette.yellow[30]!,
      success: Palette.green[40]!,
    );
  } else {
    return SurfaceColors(
      primary: Palette.gray[10]!,
      secondary: Palette.coolGray[10]!,
      tertiary: Palette.gray[0]!,
      muted: Palette.gray[30]!,
      info: Palette.cyan[40]!,
      error: Palette.red[40]!,
      warning: Palette.yellow[30]!,
      success: Palette.green[40]!,
    );
  }
}
