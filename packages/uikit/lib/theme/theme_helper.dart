// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/gradients/gradients.dart';
import 'package:iman_uikit/theme/system_overlay.dart';
import 'package:iman_uikit/theme/typographies/typographies.dart';

const _fontFamily = 'Aeonik Pro';

final lightTheme = createThemeData(
  brightness: Brightness.light,

  /// ---- Colors ----
  systemColors: lightSystemColors,
  backgroundColors: lightBackgroundColors,
  surfaceColors: lightSurfaceColors,
  textColors: lightTextColors,
  iconColors: lightIconColors,
  borderColors: lightBorderColors,
  statusColors: lightStatusColors,
  buttonColors: lightButtonColors,
  fieldColors: lightFieldColors,

  /// ---- Gradients ----
  appGradients: PaynetGradients(
    toast: lightToastGradients,
    shimmer: lightShimmerGradients,
    button: lightButtonGradients,
    background: lightBackgroundGradients,
    card: lightCardGradients,
  ),

  /// ---- Typographies ----
  displayTextStyles: lightDisplayTextStyle,
  titleTextStyles: lightTitleTextStyles,
  subtitleTextStyles: lightSubtitleTextStyles,
  labelTextStyles: lightLabelTextStyles,
  bodyTextStyles: lightBodyTextStyles,
  buttonTextStyles: lightButtonTextStyles,
  inputTextStyles: lightInputTextStyles,
);

final darkTheme = createThemeData(
  brightness: Brightness.dark,

  /// ---- Colors ----
  systemColors: darkSystemColors,
  backgroundColors: darkBackgroundColors,
  surfaceColors: darkSurfaceColors,
  textColors: darkTextColors,
  iconColors: darkIconColors,
  borderColors: darkBorderColors,
  statusColors: darkStatusColors,
  buttonColors: darkButtonColors,
  fieldColors: darkFieldColors,

  /// ---- Gradients ----
  appGradients: PaynetGradients(
    toast: darkToastGradients,
    shimmer: darkShimmerGradients,
    button: darkButtonGradients,
    background: darkBackgroundGradients,
    card: darkCardGradients,
  ),

  /// ---- Typographies ----
  displayTextStyles: darkDisplayTextStyle,
  titleTextStyles: darkTitleTextStyles,
  subtitleTextStyles: darkSubtitleTextStyles,
  labelTextStyles: darkLabelTextStyles,
  bodyTextStyles: darkBodyTextStyles,
  buttonTextStyles: darkButtonTextStyles,
  inputTextStyles: darkInputTextStyles,
);

ThemeData createThemeData({
  required Brightness brightness,

  /// ---- Colors ----
  required SystemColors systemColors,
  required BackgroundColors backgroundColors,
  required SurfaceColors surfaceColors,
  required TextColors textColors,
  required IconColors iconColors,
  required BorderColors borderColors,
  required StatusColors statusColors,
  required ButtonColors buttonColors,
  required FieldColors fieldColors,

  /// ---- Gradients ----
  required PaynetGradients appGradients,

  /// ---- Typographies ----
  required DisplayTextStyles displayTextStyles,
  required TitleTextStyles titleTextStyles,
  required SubtitleTextStyles subtitleTextStyles,
  required LabelTextStyles labelTextStyles,
  required BodyTextStyles bodyTextStyles,
  required ButtonTextStyles buttonTextStyles,
  required InputTextStyles inputTextStyles,
}) =>
    ThemeData(
      brightness: brightness,
      extensions: {
        /// ---- Colors ----
        systemColors,
        backgroundColors,
        surfaceColors,
        textColors,
        iconColors,
        borderColors,
        statusColors,
        buttonColors,
        fieldColors,

        /// ---- Gradients ----
        appGradients,
      },
      fontFamily: _fontFamily,
      dividerColor: borderColors.primary,
      disabledColor: surfaceColors.muted,
      primaryColor: backgroundColors.primary,
      scaffoldBackgroundColor: backgroundColors.primary,

      /// ---- Text Theme ----
      textTheme: TextTheme(
        displayLarge: displayTextStyles.large,
        displayMedium: displayTextStyles.main,
        displaySmall: displayTextStyles.main,
        headlineLarge: titleTextStyles.large1,
        headlineMedium: titleTextStyles.medium1,
        headlineSmall: titleTextStyles.compact1,
        titleLarge: titleTextStyles.main1,
        titleMedium: titleTextStyles.medium1,
        titleSmall: titleTextStyles.compact1,
        bodyLarge: bodyTextStyles.large,
        bodyMedium: bodyTextStyles.medium2,
        bodySmall: bodyTextStyles.compact1,
        labelLarge: labelTextStyles.large,
        labelMedium: labelTextStyles.medium1,
        labelSmall: labelTextStyles.main,
      ),
      primaryTextTheme: TextTheme(
        displayLarge: displayTextStyles.large,
        displayMedium: displayTextStyles.main,
        displaySmall: displayTextStyles.main,
        headlineLarge: titleTextStyles.large1,
        headlineMedium: titleTextStyles.medium1,
        headlineSmall: titleTextStyles.compact1,
        titleLarge: titleTextStyles.main1,
        titleMedium: titleTextStyles.medium1,
        titleSmall: titleTextStyles.compact1,
        bodyLarge: bodyTextStyles.large,
        bodyMedium: bodyTextStyles.medium2,
        bodySmall: bodyTextStyles.compact1,
        labelLarge: labelTextStyles.large,
        labelMedium: labelTextStyles.medium1,
        labelSmall: labelTextStyles.main,
      ),

      /// ---- App Bar Theme ----
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColors.primary,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: brightness == Brightness.light
            ? MySystemUiOverlayStyle.light
            : MySystemUiOverlayStyle.dark,
        titleTextStyle: titleTextStyles.large1.bold.copyWith(
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
          color: backgroundColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: bodyTextStyles.medium2.copyWith(
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
        labelStyle: bodyTextStyles.compact1.copyWith(
          color: textColors.primary,
        ),
        secondaryLabelStyle: bodyTextStyles.compact1.copyWith(
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
          surface: backgroundColors.primary,
          onSurface: textColors.primary,
        ),
        disabledColor: buttonColors.primaryDisable,
        focusColor: buttonColors.primaryPressed,
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
          textStyle: titleTextStyles.medium1.copyWith(
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
        hoverColor: fieldColors.borderHover,
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
        backgroundColor: backgroundColors.primary,
        surfaceTintColor: backgroundColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
