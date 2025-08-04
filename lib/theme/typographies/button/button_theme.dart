// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/typographies/button/button_text_styles.dart';

final lightButtonTextStyles =
    _generateTypographyFromBrightness(Brightness.light);
final darkButtonTextStyles = _generateTypographyFromBrightness(Brightness.dark);

ButtonTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  final color = brightness == Brightness.light
      ? lightTextColors.primary
      : darkTextColors.primary;
  return ButtonTextStyles(
    main: TextStyle(
      color: color,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    subtext: TextStyle(
      color: color,
      fontSize: 11,
      height: 12 / 11,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    count: TextStyle(
      color: color,
      fontSize: 16,
      height: 20 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
  );
}
