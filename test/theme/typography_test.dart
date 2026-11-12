// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:uikit/uikit.dart';

void main() {
  group('Typography builders', () {
    test('default font comes from the uikit package', () {
      expect(lightBaseTextStyles.base1.fontFamily, 'packages/uikit/AeonikPro');
      expect(
          lightTitleTextStyles.title1.fontFamily, 'packages/uikit/AeonikPro');
      expect(lightTheme.textTheme.bodyMedium?.fontFamily,
          'packages/uikit/AeonikPro');
    });

    test('app font is used without package prefix', () {
      final styles = createBaseTextStyles(
        brightness: Brightness.light,
        fontFamily: 'Inter',
        fontPackage: null,
      );
      expect(styles.base1.fontFamily, 'Inter');
      // sizes and weights are preserved
      expect(styles.base1.fontSize, lightBaseTextStyles.base1.fontSize);
      expect(styles.base1.fontWeight, lightBaseTextStyles.base1.fontWeight);
    });

    test('custom text colors are applied', () {
      const brand = Color(0xFF0A2540);
      final colors = lightTextColors.copyWith(primary: brand);
      final styles = createDisplayTextStyles(
        brightness: Brightness.light,
        textColors: colors,
      );
      expect(styles.display1.color, brand);
    });
  });
}
