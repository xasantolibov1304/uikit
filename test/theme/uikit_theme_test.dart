// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class _AppBrand extends ThemeExtension<_AppBrand> {
  const _AppBrand(this.accent);

  final Color accent;

  @override
  _AppBrand copyWith({Color? accent}) => _AppBrand(accent ?? this.accent);

  @override
  _AppBrand lerp(covariant _AppBrand? other, double t) =>
      other == null ? this : _AppBrand(Color.lerp(accent, other.accent, t)!);
}

void main() {
  group('UikitTheme', () {
    test('defaults match uikit tokens', () {
      final theme = UikitTheme.light();
      expect(theme.brightness, Brightness.light);
      expect(theme.buttonColors, same(lightButtonColors));
      expect(theme.textColors, same(lightTextColors));
      expect(theme.baseTextStyle.base1, lightBaseTextStyles.base1);
      expect(theme.titleTextStyle.title1, lightTitleTextStyles.title1);
      expect(UikitTheme.dark().brightness, Brightness.dark);
    });

    test('overrides only what is passed', () {
      final buttons = lightButtonColors.copyWith(
        primary: const Color(0xFF6200EE),
      );
      final theme = UikitTheme.light(buttonColors: buttons);
      expect(theme.buttonColors.primary, const Color(0xFF6200EE));
      expect(theme.surfaceColors, same(lightSurfaceColors));
    });

    test('font and text colors flow into default typography', () {
      const brand = Color(0xFF0A2540);
      final theme = UikitTheme.light(
        fontFamily: 'Inter',
        fontPackage: null,
        textColors: lightTextColors.copyWith(primary: brand),
      );
      for (final style in [
        theme.baseTextStyle.base1,
        theme.titleTextStyle.title1,
        theme.displayTextStyle.display1,
        theme.textTheme.bodyMedium!,
      ]) {
        expect(style.fontFamily, 'Inter');
      }
      expect(theme.baseTextStyle.base1.color, brand);
    });

    test('radii default and partial override', () {
      expect(UikitTheme.light().radii.xl, 16);
      final theme = UikitTheme.light(radii: const UikitRadii(xl: 12));
      expect(theme.radii.xl, 12);
      expect(theme.radii.lg, 12);
      expect(theme.radii.full, 100);
    });

    testWidgets('components use radius tokens', (tester) async {
      Future<BorderRadius?> alertRadius(UikitRadii radii) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: UikitTheme.light(radii: radii),
            home: const Scaffold(body: InfoAlert(title: 't')),
          ),
        );
        await tester.pumpAndSettle();
        final box = tester.widgetList<Container>(find.byType(Container))
            .map((c) => c.decoration)
            .whereType<BoxDecoration>()
            .firstWhere((d) => d.borderRadius != null);
        return box.borderRadius as BorderRadius?;
      }

      expect(await alertRadius(const UikitRadii()), BorderRadius.circular(16));
      expect(
        await alertRadius(const UikitRadii(xl: 4)),
        BorderRadius.circular(4),
      );
    });

    test('app extensions are added next to uikit tokens', () {
      final theme = UikitTheme.light(
        extensions: const [_AppBrand(Color(0xFFFF5722))],
      );
      expect(theme.extension<_AppBrand>()?.accent, const Color(0xFFFF5722));
      expect(theme.buttonColors, same(lightButtonColors));
    });

    testWidgets('components read overridden tokens', (tester) async {
      const cursor = Color(0xFF123456);
      await tester.pumpWidget(
        MaterialApp(
          theme: UikitTheme.light(
            textColors: lightTextColors.copyWith(primary: cursor),
          ),
          home: Builder(
            builder: (context) => Text(
              'x',
              style: context.baseTextStyle.base1,
            ),
          ),
        ),
      );
      final text = tester.widget<Text>(find.text('x'));
      expect(text.style?.color, cursor);
    });
  });
}
