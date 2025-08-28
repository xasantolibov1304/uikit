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
      primary: Palette.gray[0]!,
      secondary: Palette.gray[10]!,
      tertiary: Palette.gray[0]!,
      grey: Palette.gray[20]!,
      muted: Palette.gray[30]!,
      dark: Palette.gray[100]!,
      info: Palette.cyan[60]!.withValues(alpha: 0.1),
      error: Palette.red[60]!.withValues(alpha: 0.1),
      warning: Palette.yellow[40]!.withValues(alpha: 0.1),
      success: Palette.green[50]!.withValues(alpha: 0.1),
    );
  } else {
    return SurfaceColors(
      primary: Palette.gray[0]!,
      secondary: Palette.gray[10]!,
      tertiary: Palette.gray[0]!,
      grey: Palette.gray[20]!,
      muted: Palette.gray[30]!,
      dark: Palette.gray[100]!,
      info: Palette.cyan[60]!.withValues(alpha: 0.1),
      error: Palette.red[60]!.withValues(alpha: 0.1),
      warning: Palette.yellow[40]!.withValues(alpha: 0.1),
      success: Palette.green[50]!.withValues(alpha: 0.1),
    );
  }
}
