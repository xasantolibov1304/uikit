// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/text/text_colors_palette.dart';
import 'package:uikit/theme/typographies/display/display_text_styles.dart';

const _fontFamily = 'AeonikPro';
const _fontPackage = 'uikit';

final lightDisplayTextStyle = _generateTypographyFromBrightness(Brightness.light);
final darkDisplayTextStyle = _generateTypographyFromBrightness(Brightness.dark);

DisplayTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return DisplayTextStyles(
      display1: _baseTypography.copyWith(
        fontSize: 44,
        height: 44 / 44,
        color: lightTextColors.primary,
      ),
      display2: _baseTypography.copyWith(
        fontSize: 40,
        height: 40 / 40,
        color: lightTextColors.primary,
      ),
      display3: _baseTypography.copyWith(
        fontSize: 36,
        height: 38 / 36,
        color: lightTextColors.primary,
      ),
      display4: _baseTypography.copyWith(
        fontSize: 32,
        height: 36 / 32,
        color: lightTextColors.primary,
      ),
      display5: _baseTypography.copyWith(
        fontSize: 28,
        height: 32 / 28,
        color: lightTextColors.primary,
      ),
    );
  } else {
    return DisplayTextStyles(
      display1: _baseTypography.copyWith(
        fontSize: 44,
        height: 44 / 44,
        color: darkTextColors.primary,
      ),
      display2: _baseTypography.copyWith(
        fontSize: 40,
        height: 40 / 40,
        color: darkTextColors.primary,
      ),
      display3: _baseTypography.copyWith(
        fontSize: 36,
        height: 38 / 36,
        color: darkTextColors.primary,
      ),
      display4: _baseTypography.copyWith(
        fontSize: 32,
        height: 36 / 32,
        color: darkTextColors.primary,
      ),
      display5: _baseTypography.copyWith(
        fontSize: 28,
        height: 32 / 28,
        color: darkTextColors.primary,
      ),
    );
  }
}

const _baseTypography = TextStyle(
  fontWeight: FontWeight.w700,
  fontFamily: _fontFamily,
  package: _fontPackage,
  letterSpacing: 0,
);
