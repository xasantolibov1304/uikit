// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/field/field_colors.dart';
import 'package:iman_uikit/theme/palette.dart';

final lightFieldColors = _generatePaletteFromBrightness(Brightness.light);
final darkFieldColors = _generatePaletteFromBrightness(Brightness.dark);

FieldColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return FieldColors(
      background: Palette.gray[10]!,
      backgroundDisabled: Palette.gray[10]!,
      border: Palette.gray[20]!,
      borderHover: const Color(0x0F000000),
      borderFocused: Palette.gray[40]!,
      borderError: Palette.red[60]!,
      borderSuccess: Palette.green[50]!,
      borderDisabled: Palette.gray[10]!,
      cursor: Palette.gray[100]!,
      placeholder: Palette.gray[20]!,
      text: Palette.gray[90]!,
      textDisabled: Palette.gray[10]!,
      icon: Palette.gray[40]!,
      iconDisabled: Palette.gray[10]!,
      error: Palette.red[50]!,
      warning: Palette.yellow[30]!,
      success: Palette.green[50]!,
      helper: Palette.gray[40]!,
    );
  } else {
    return FieldColors(
      background: Palette.gray[10]!,
      backgroundDisabled: Palette.gray[10]!,
      border: Palette.gray[70]!,
      borderHover: Palette.gray[60]!,
      borderFocused: Palette.gray[40]!,
      borderError: Palette.red[50]!,
      borderSuccess: Palette.green[50]!,
      borderDisabled: Palette.gray[60]!,
      cursor: Palette.gray[100]!,
      placeholder: Palette.gray[30]!,
      text: Palette.gray[10]!,
      textDisabled: Palette.gray[50]!,
      icon: Palette.gray[10]!,
      iconDisabled: Palette.gray[50]!,
      error: Palette.red[50]!,
      warning: Palette.yellow[30]!,
      success: Palette.green[50]!,
      helper: Palette.gray[30]!,
    );
  }
}
