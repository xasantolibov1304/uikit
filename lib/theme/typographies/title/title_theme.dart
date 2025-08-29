// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/text/text_colors_palette.dart';
import 'package:iman_uikit/theme/typographies/title/title_text_styles.dart';

const _fontFamily = 'Aeonik Pro';

final lightTitleTextStyles = _generateTypographyFromBrightness(Brightness.light);
final darkTitleTextStyles = _generateTypographyFromBrightness(Brightness.dark);

TitleTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return TitleTextStyles(
      title1: _baseTypography.copyWith(
        fontSize: 24,
        height: 28 / 24,
        color: lightTextColors.primary,
      ),
      title2: _baseTypography.copyWith(
        fontSize: 20,
        height: 24 / 20,
        color: lightTextColors.primary,
      ),
      title3: _baseTypography.copyWith(
        fontSize: 16,
        height: 20 / 16,
        color: lightTextColors.primary,
      ),
      title4: _baseTypography.copyWith(
        fontSize: 14,
        height: 16 / 14,
        color: lightTextColors.primary,
      ),
    );
  } else {
    return TitleTextStyles(
      title1: _baseTypography.copyWith(
        fontSize: 24,
        height: 28 / 24,
        color: darkTextColors.primary,
      ),
      title2: _baseTypography.copyWith(
        fontSize: 20,
        height: 24 / 20,
        color: darkTextColors.primary,
      ),
      title3: _baseTypography.copyWith(
        fontSize: 16,
        height: 20 / 16,
        color: darkTextColors.primary,
      ),
      title4: _baseTypography.copyWith(
        fontSize: 14,
        height: 16 / 14,
        color: darkTextColors.primary,
      ),
    );
  }
}

const _baseTypography = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: _fontFamily,
  letterSpacing: 0,
);
