// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/typographies/input/input_text_styles.dart';

final lightInputTextStyles =
    _generateTypographyFromBrightness(Brightness.light);
final darkInputTextStyles = _generateTypographyFromBrightness(Brightness.dark);

InputTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  final color = brightness == Brightness.light
      ? lightTextColors.primary
      : darkTextColors.primary;
  return InputTextStyles(
    label: TextStyle(
      color: color,
      fontSize: 13,
      height: 16 / 13,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    placeholder: TextStyle(
      color: color,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    suffix: TextStyle(
      color: color,
      fontSize: 14,
      height: 22 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    caption: TextStyle(
      color: color,
      fontSize: 13,
      height: 16 / 13,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
  );
}
