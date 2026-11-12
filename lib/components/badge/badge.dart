// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:uikit/uikit.dart';

const _badgeHeight = 32.0;

enum BadgeWidgetType {
  primary,
  info,
  error,
  warning,
  success,
}

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    this.title,
    this.count = 0,
    this.isEnabled = true,
    this.type = BadgeWidgetType.primary,
    this.leadingIcon,
    super.key,
  });

  final String? title;
  final int count;
  final bool isEnabled;
  final BadgeWidgetType type;
  final SvgPicture? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _badgeHeight,
      decoration: BoxDecoration(
        color: _backgroundColor(context),
        borderRadius: BorderRadius.circular(context.radii.lg),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: 6),
          ],
          if (title != null) ...[
            Text(
              title!,
              style: context.baseTextStyle.base4.copyWith(
                color: _textColor(context),
              ),
            ),
            const SizedBox(width: 6),
          ],
          if (count > 0) ...[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: context.surfaceColors.tertiary,
                borderRadius: BorderRadius.circular(context.radii.full),
              ),
              child: Text(
                '$count',
                style: context.baseTextStyle.base3.copyWith(
                  color: _indicatorTextColor(context),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _textColor(BuildContext context) {
    if (!isEnabled) {
      return context.textColors.tertiary;
    }
    return context.textColors.primary;
  }

  Color _backgroundColor(BuildContext context) {
    if (!isEnabled) {
      return context.surfaceColors.muted;
    }

    switch (type) {
      case BadgeWidgetType.primary:
        return context.surfaceColors.primary;
      case BadgeWidgetType.info:
        return context.surfaceColors.info;
      case BadgeWidgetType.error:
        return context.surfaceColors.error;
      case BadgeWidgetType.warning:
        return context.surfaceColors.warning;
      case BadgeWidgetType.success:
        return context.surfaceColors.success;
    }
  }

  Color _indicatorTextColor(BuildContext context) {
    if (!isEnabled) {
      return context.textColors.tertiary;
    }

    switch (type) {
      case BadgeWidgetType.primary:
        return context.textColors.secondary;
      case BadgeWidgetType.info:
        return context.textColors.info;
      case BadgeWidgetType.error:
        return context.textColors.error;
      case BadgeWidgetType.warning:
        return context.textColors.warning;
      case BadgeWidgetType.success:
        return context.textColors.success;
    }
  }
}
