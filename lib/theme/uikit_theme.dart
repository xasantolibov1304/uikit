// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/colors.dart';
import 'package:uikit/theme/gradients/gradients.dart';
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/theme/theme_helper.dart';
import 'package:uikit/theme/typographies/typographies.dart';

/// Builds a uikit [ThemeData] where every token is optional.
///
/// Anything not passed falls back to uikit's defaults for the given
/// brightness, so an app only overrides what differs:
///
/// ```dart
/// MaterialApp(
///   theme: UikitTheme.light(
///     fontFamily: 'Inter',
///     fontPackage: null, // font declared in the app's pubspec
///     buttonColors: myButtonColors,
///   ),
///   darkTheme: UikitTheme.dark(fontFamily: 'Inter', fontPackage: null),
/// );
/// ```
///
/// [fontFamily], [fontPackage] and [textColors] are also applied to the
/// default typography. Passing explicit text styles (e.g. [baseTextStyles])
/// replaces that group entirely. [radii] overrides corner radius tokens.
abstract final class UikitTheme {
  static ThemeData light({
    AdditionalColors? additionalColors,
    BorderColors? borderColors,
    BrandColors? brandColors,
    ButtonColors? buttonColors,
    IconColors? iconColors,
    SurfaceColors? surfaceColors,
    SystemColors? systemColors,
    TextColors? textColors,
    AppGradients? appGradients,
    DisplayTextStyles? displayTextStyles,
    TitleTextStyles? titleTextStyles,
    BaseTextStyles? baseTextStyles,
    OthersTextStyles? othersTextStyles,
    UikitRadii? radii,
    String fontFamily = UikitFont.family,
    String? fontPackage = UikitFont.package,
  }) =>
      create(
        brightness: Brightness.light,
        additionalColors: additionalColors,
        borderColors: borderColors,
        brandColors: brandColors,
        buttonColors: buttonColors,
        iconColors: iconColors,
        surfaceColors: surfaceColors,
        systemColors: systemColors,
        textColors: textColors,
        appGradients: appGradients,
        displayTextStyles: displayTextStyles,
        titleTextStyles: titleTextStyles,
        baseTextStyles: baseTextStyles,
        othersTextStyles: othersTextStyles,
        radii: radii,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
      );

  static ThemeData dark({
    AdditionalColors? additionalColors,
    BorderColors? borderColors,
    BrandColors? brandColors,
    ButtonColors? buttonColors,
    IconColors? iconColors,
    SurfaceColors? surfaceColors,
    SystemColors? systemColors,
    TextColors? textColors,
    AppGradients? appGradients,
    DisplayTextStyles? displayTextStyles,
    TitleTextStyles? titleTextStyles,
    BaseTextStyles? baseTextStyles,
    OthersTextStyles? othersTextStyles,
    UikitRadii? radii,
    String fontFamily = UikitFont.family,
    String? fontPackage = UikitFont.package,
  }) =>
      create(
        brightness: Brightness.dark,
        additionalColors: additionalColors,
        borderColors: borderColors,
        brandColors: brandColors,
        buttonColors: buttonColors,
        iconColors: iconColors,
        surfaceColors: surfaceColors,
        systemColors: systemColors,
        textColors: textColors,
        appGradients: appGradients,
        displayTextStyles: displayTextStyles,
        titleTextStyles: titleTextStyles,
        baseTextStyles: baseTextStyles,
        othersTextStyles: othersTextStyles,
        radii: radii,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
      );

  static ThemeData create({
    required Brightness brightness,
    AdditionalColors? additionalColors,
    BorderColors? borderColors,
    BrandColors? brandColors,
    ButtonColors? buttonColors,
    IconColors? iconColors,
    SurfaceColors? surfaceColors,
    SystemColors? systemColors,
    TextColors? textColors,
    AppGradients? appGradients,
    DisplayTextStyles? displayTextStyles,
    TitleTextStyles? titleTextStyles,
    BaseTextStyles? baseTextStyles,
    OthersTextStyles? othersTextStyles,
    UikitRadii? radii,
    String fontFamily = UikitFont.family,
    String? fontPackage = UikitFont.package,
  }) {
    final isLight = brightness == Brightness.light;
    final resolvedTextColors =
        textColors ?? (isLight ? lightTextColors : darkTextColors);

    return createThemeData(
      brightness: brightness,

      /// ---- Colors ----
      additionalColors: additionalColors ??
          (isLight ? lightAdditionalColors : darkAdditionalColors),
      borderColors:
          borderColors ?? (isLight ? lightBorderColors : darkBorderColors),
      brandColors: brandColors ?? (isLight ? lightBrandColors : darkBrandColors),
      buttonColors:
          buttonColors ?? (isLight ? lightButtonColors : darkButtonColors),
      iconColors: iconColors ?? (isLight ? lightIconColors : darkIconColors),
      surfaceColors:
          surfaceColors ?? (isLight ? lightSurfaceColors : darkSurfaceColors),
      systemColors:
          systemColors ?? (isLight ? lightSystemColors : darkSystemColors),
      textColors: resolvedTextColors,

      /// ---- Gradients ----
      appGradients: appGradients ?? _defaultGradients(isLight),

      /// ---- Typographies ----
      displayTextStyles: displayTextStyles ??
          createDisplayTextStyles(
            brightness: brightness,
            fontFamily: fontFamily,
            fontPackage: fontPackage,
            textColors: resolvedTextColors,
          ),
      titleTextStyles: titleTextStyles ??
          createTitleTextStyles(
            brightness: brightness,
            fontFamily: fontFamily,
            fontPackage: fontPackage,
            textColors: resolvedTextColors,
          ),
      baseTextStyles: baseTextStyles ??
          createBaseTextStyles(
            brightness: brightness,
            fontFamily: fontFamily,
            fontPackage: fontPackage,
            textColors: resolvedTextColors,
          ),
      othersTextStyles: othersTextStyles ??
          createOthersTextStyles(
            brightness: brightness,
            fontFamily: fontFamily,
            fontPackage: fontPackage,
            textColors: resolvedTextColors,
          ),

      /// ---- Shape ----
      radii: radii ?? const UikitRadii(),

      /// ---- Font ----
      fontFamily: fontFamily,
      fontPackage: fontPackage,
    );
  }

  static AppGradients _defaultGradients(bool isLight) => isLight
      ? AppGradients(
          toast: lightToastGradients,
          shimmer: lightShimmerGradients,
          button: lightButtonGradients,
          background: lightBackgroundGradients,
          card: lightCardGradients,
        )
      : AppGradients(
          toast: darkToastGradients,
          shimmer: darkShimmerGradients,
          button: darkButtonGradients,
          background: darkBackgroundGradients,
          card: darkCardGradients,
        );
}
