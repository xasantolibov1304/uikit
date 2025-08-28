// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

const _iconSize = 24.0;

enum ButtonType {
  primary,
  secondary,
  tertiary,
  inverted,
  ghost,
  positive,
  negative,
}

enum ButtonSize {
  small(40),
  medium(48),
  large(56);

  final double height;

  const ButtonSize(this.height);
}

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.onTap,
    this.textColor,
    //
    this.onLongPress,
    //
    this.iconStart,
    this.iconEnd,
    this.subtext,
    this.count,
    //
    this.size = ButtonSize.large,
    this.type = ButtonType.primary,
    //
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    //
    this.isLoading = false,
    this.showText = true,
    this.showSubtext = false,
    this.isEnabled = true,
    //
    this.width,
    super.key,
  });

  final String text;
  final Color? textColor;

  final Widget? iconStart;
  final Widget? iconEnd;

  final String? subtext;

  /// Show count badge on the button.
  final int? count;

  final ButtonType type;

  /// [ButtonSize.small] - 40px
  ///
  /// [ButtonSize.medium] - 48px
  ///
  /// [ButtonSize.large] - 56px
  final ButtonSize size;

  final void Function()? onTap;
  final void Function()? onLongPress;

  final EdgeInsets margin;
  final EdgeInsets padding;

  final bool isLoading;
  final bool showText;

  /// Show subtext on the button when [isLoading] is true.
  final bool showSubtext;
  final bool isEnabled;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 250),
      child: CommonInkWell(
        width: width,
        margin: margin,
        padding: padding,
        height: size.height,
        onLongPress: onLongPress,
        borderRadius: _borderRadius,
        splashColor: _splashColor(context),
        onTap: isEnabled && !isLoading ? onTap : null,
        hoverColor: isEnabled || isLoading ? _hoverColor(context) : null,
        color: isEnabled ? _enabledColor(context) : _disabledColor(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isLoading)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconStart != null) ...[
                    SizedBox(
                      width: _iconSize,
                      height: _iconSize,
                      child: iconStart!,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Column(
                    children: [
                      if (showText)
                        Text(
                          text,
                          style: _textStyle(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (subtext != null) _subtextWidget(context),
                    ],
                  ),
                  if (iconEnd != null) ...[
                    const SizedBox(width: 8),
                    SizedBox(
                      width: _iconSize,
                      height: _iconSize,
                      child: iconEnd!,
                    ),
                  ],
                  if (count != null) ...[
                    const SizedBox(width: 8),
                    SizedBox(
                      width: _badgeSize,
                      height: _badgeSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            _badgeColor(context),
                            BlendMode.srcOut,
                          ),
                          child: Center(
                            child: Text(
                              '$count',
                              maxLines: 1,
                              style: context.buttonTextStyle.count,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      LoadingIndicator(
                        size: _loadingSize,
                        color: _textColor(context),
                      ),
                      if (showSubtext && subtext != null) ...[
                        SizedBox(height: 4),
                        _subtextWidget(context),
                      ]
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  ///
  /// Subtext Widget
  ///

  Widget _subtextWidget(BuildContext context) {
    return Text(
      subtext ?? '',
      overflow: TextOverflow.ellipsis,
      style: context.buttonTextStyle.subtext.copyWith(
        color: _textColor(context),
      ),
    );
  }

  ///
  /// Button Border Radius
  ///

  BorderRadius get _borderRadius => switch (size) {
        ButtonSize.small => BorderRadius.circular(12),
        ButtonSize.large || ButtonSize.medium => BorderRadius.circular(16),
      };

  ///
  /// Button Sizes
  ///

  double get _loadingSize => switch (size) {
        ButtonSize.large || ButtonSize.medium => 24,
        ButtonSize.small => 20,
      };

  double get _badgeSize => switch (size) {
        ButtonSize.large || ButtonSize.medium => 28,
        ButtonSize.small => 24,
      };

  ///
  /// Button Text Styles
  ///

  TextStyle _textStyle(BuildContext context) {
    return context.buttonTextStyle.main.copyWith(
      color: _textColor(context),
    );
  }

  Color _textColor(BuildContext context) {
    final textColors = context.textColors;
    if (!isEnabled) {
      return textColors.tertiary;
    }
    if (textColor != null) {
      return textColor!;
    }
    return switch (type) {
      ButtonType.ghost ||
      ButtonType.tertiary ||
      ButtonType.secondary =>
        textColors.primary,
      ButtonType.inverted ||
      ButtonType.positive ||
      ButtonType.negative ||
      ButtonType.primary =>
        textColors.invert,
    };
  }

  ///
  /// Badge Colors
  ///

  Color _badgeColor(BuildContext context) {
    if (!isEnabled) {
      return context.surfaceColors.muted.withValues(alpha: 0.5);
    }
    return switch (type) {
      ButtonType.primary ||
      ButtonType.inverted ||
      ButtonType.positive ||
      ButtonType.negative =>
        Colors.white,
      ButtonType.secondary ||
      ButtonType.tertiary ||
      ButtonType.ghost =>
        Colors.black,
    };
  }

  ///
  /// Button States Colors
  ///

  Color _enabledColor(BuildContext context) {
    final buttonColors = Theme.of(context).buttonColors;
    return switch (type) {
      ButtonType.primary => buttonColors.primary,
      ButtonType.secondary => buttonColors.secondary,
      ButtonType.tertiary => buttonColors.tertiary,
      ButtonType.inverted => buttonColors.inverted,
      ButtonType.ghost => buttonColors.ghost,
      ButtonType.positive => buttonColors.positive,
      ButtonType.negative => buttonColors.negative,
    };
  }

  Color _hoverColor(BuildContext context) {
    final buttonColors = Theme.of(context).buttonColors;
    return switch (type) {
      ButtonType.primary => buttonColors.primary,
      ButtonType.secondary => buttonColors.secondary,
      ButtonType.tertiary => buttonColors.tertiary,
      ButtonType.inverted => buttonColors.inverted,
      ButtonType.ghost => buttonColors.ghost,
      ButtonType.positive => buttonColors.positive,
      ButtonType.negative => buttonColors.negative,
    };
  }

  Color _splashColor(BuildContext context) {
    final buttonColors = Theme.of(context).buttonColors;
    return switch (type) {
      ButtonType.primary => buttonColors.primary,
      ButtonType.secondary => buttonColors.secondary,
      ButtonType.tertiary => buttonColors.tertiary,
      ButtonType.inverted => buttonColors.inverted,
      ButtonType.ghost => buttonColors.ghost,
      ButtonType.positive => buttonColors.positive,
      ButtonType.negative => buttonColors.negative,
    };
  }

  Color _disabledColor(BuildContext context) {
    final buttonColors = Theme.of(context).buttonColors;
    return switch (type) {
      ButtonType.primary => buttonColors.disabled,
      ButtonType.secondary => buttonColors.secondary,
      ButtonType.tertiary => buttonColors.tertiary,
      ButtonType.inverted => buttonColors.inverted,
      ButtonType.ghost => buttonColors.ghost,
      ButtonType.positive => buttonColors.positive,
      ButtonType.negative => buttonColors.negative,
    };
  }
}
