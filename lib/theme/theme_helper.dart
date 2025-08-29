// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/gradients/gradients.dart';
import 'package:iman_uikit/theme/system_overlay.dart';
import 'package:iman_uikit/theme/typographies/typographies.dart';

const _fontFamily = 'Aeonik Pro';

final lightTheme = createThemeData(
  brightness: Brightness.light,

  /// ---- Colors ----
  additionalColors: lightAdditionalColors,
  borderColors: lightBorderColors,
  brandColors: lightBrandColors,
  buttonColors: lightButtonColors,
  iconColors: lightIconColors,
  surfaceColors: lightSurfaceColors,
  systemColors: lightSystemColors,
  textColors: lightTextColors,

  /// ---- Gradients ----
  appGradients: AppGradients(
    toast: lightToastGradients,
    shimmer: lightShimmerGradients,
    button: lightButtonGradients,
    background: lightBackgroundGradients,
    card: lightCardGradients,
  ),

  /// ---- Typographies ----
  displayTextStyles: lightDisplayTextStyle,
  titleTextStyles: lightTitleTextStyles,
  baseTextStyles: lightBaseTextStyles,
  othersTextStyles: lightOthersTextStyles,
);

final darkTheme = createThemeData(
  brightness: Brightness.dark,

  /// ---- Colors ----
  additionalColors: darkAdditionalColors,
  borderColors: darkBorderColors,
  brandColors: darkBrandColors,
  buttonColors: darkButtonColors,
  iconColors: darkIconColors,
  surfaceColors: darkSurfaceColors,
  systemColors: darkSystemColors,
  textColors: darkTextColors,

  /// ---- Gradients ----
  appGradients: AppGradients(
    toast: darkToastGradients,
    shimmer: darkShimmerGradients,
    button: darkButtonGradients,
    background: darkBackgroundGradients,
    card: darkCardGradients,
  ),

  /// ---- Typographies ----
  displayTextStyles: darkDisplayTextStyle,
  titleTextStyles: darkTitleTextStyles,
  baseTextStyles: darkBaseTextStyles,
  othersTextStyles: darkOthersTextStyles,
);

ThemeData createThemeData({
  required Brightness brightness,

  /// ---- Colors ----
  required AdditionalColors additionalColors,
  required BorderColors borderColors,
  required BrandColors brandColors,
  required ButtonColors buttonColors,
  required IconColors iconColors,
  required SurfaceColors surfaceColors,
  required SystemColors systemColors,
  required TextColors textColors,

  /// ---- Gradients ----
  required AppGradients appGradients,

  /// ---- Typographies ----
  required DisplayTextStyles displayTextStyles,
  required TitleTextStyles titleTextStyles,
  required BaseTextStyles baseTextStyles,
  required OthersTextStyles othersTextStyles,
}) =>
    ThemeData(
      brightness: brightness,
      extensions: {
        /// ---- Colors ----
        additionalColors,
        borderColors,
        brandColors,
        buttonColors,
        iconColors,
        surfaceColors,
        systemColors,
        textColors,

        /// ---- Gradients ----
        appGradients,

        /// ---- Typographies ----
        displayTextStyles,
        titleTextStyles,
        baseTextStyles,
        othersTextStyles,
      },
      fontFamily: _fontFamily,
      dividerColor: borderColors.primary,
      disabledColor: surfaceColors.muted,
      primaryColor: surfaceColors.primary,
      scaffoldBackgroundColor: surfaceColors.primary,

      /// ---- Text Theme ----
      textTheme: TextTheme(
        displayLarge: displayTextStyles.display1,
        displayMedium: displayTextStyles.display2,
        displaySmall: displayTextStyles.display3,
        headlineLarge: titleTextStyles.title1,
        headlineMedium: titleTextStyles.title2,
        headlineSmall: titleTextStyles.title3,
        titleLarge: titleTextStyles.title1,
        titleMedium: titleTextStyles.title2,
        titleSmall: titleTextStyles.title3,
        bodyLarge: baseTextStyles.base1,
        bodyMedium: baseTextStyles.base2,
        bodySmall: baseTextStyles.base3,
        labelLarge: baseTextStyles.base4,
        labelMedium: baseTextStyles.base5,
        labelSmall: baseTextStyles.base6,
      ),
      primaryTextTheme: TextTheme(
        displayLarge: displayTextStyles.display1,
        displayMedium: displayTextStyles.display2,
        displaySmall: displayTextStyles.display3,
        headlineLarge: titleTextStyles.title1,
        headlineMedium: titleTextStyles.title2,
        headlineSmall: titleTextStyles.title3,
        titleLarge: titleTextStyles.title1,
        titleMedium: titleTextStyles.title2,
        titleSmall: titleTextStyles.title3,
        bodyLarge: baseTextStyles.base1,
        bodyMedium: baseTextStyles.base2,
        bodySmall: baseTextStyles.base3,
        labelLarge: baseTextStyles.base4,
        labelMedium: baseTextStyles.base5,
        labelSmall: baseTextStyles.base6,
      ),

      /// ---- App Bar Theme ----
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColors.primary,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle:
            brightness == Brightness.light ? AppSystemUiOverlayStyle.light : AppSystemUiOverlayStyle.dark,
        titleTextStyle: titleTextStyles.title1.bold.copyWith(
          color: textColors.primary,
        ),
        iconTheme: IconThemeData(
          color: iconColors.primary,
          size: 24,
        ),
      ),

      /// ---- Tooltip Theme ----
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: surfaceColors.dark,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: baseTextStyles.base2.copyWith(
          color: textColors.primary,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        showDuration: const Duration(seconds: 4),
        waitDuration: const Duration(seconds: 1),
        triggerMode: TooltipTriggerMode.longPress,
      ),

      /// ---- Chip Theme ----
      chipTheme: ChipThemeData(
        backgroundColor: systemColors.black,
        disabledColor: systemColors.transparent,
        selectedColor: systemColors.red,
        secondarySelectedColor: systemColors.red,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        labelStyle: baseTextStyles.base4.copyWith(
          color: textColors.primary,
        ),
        secondaryLabelStyle: baseTextStyles.base4.copyWith(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        deleteIconColor: textColors.primary,
        color: WidgetStateProperty.all(systemColors.black),
      ),

      /// ---- Switcher Theme ----
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.all(
          surfaceColors.primary,
        ),
        thumbColor: WidgetStateProperty.all(
          surfaceColors.tertiary,
        ),
        trackOutlineColor: WidgetStateProperty.all(
          surfaceColors.primary,
        ),
      ),

      /// ---- Button Theme ----
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        textTheme: ButtonTextTheme.normal,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: buttonColors.primary,
          onPrimary: Colors.white,
          secondary: buttonColors.secondary,
          onSecondary: Colors.white,
          tertiary: buttonColors.tertiary,
          onTertiary: Colors.white,
          surface: surfaceColors.primary,
          onSurface: textColors.primary,
        ),
        disabledColor: buttonColors.disabled,
        focusColor: buttonColors.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: titleTextStyles.title3.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// ---- Input Field Theme ----
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        hoverColor: borderColors.secondary,
      ),

      /// Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        splashRadius: 24,
        side: BorderSide(
          width: 2,
          color: borderColors.secondary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        checkColor: WidgetStateProperty.all(systemColors.white),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return borderColors.success;
          }
          return systemColors.transparent;
        }),
        overlayColor: WidgetStateProperty.all(systemColors.transparent),
      ),

      /// Radio Theme
      radioTheme: RadioThemeData(
        splashRadius: 24,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return borderColors.success;
          }
          return borderColors.secondary;
        }),
        overlayColor: WidgetStateProperty.all(systemColors.black),
      ),

      /// Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surfaceColors.primary,
        surfaceTintColor: surfaceColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
