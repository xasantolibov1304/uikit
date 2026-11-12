// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:badges/badges.dart' as badges;

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

const _textHeight = 1.4;
const _maxCount = 99;

enum BadgeIndicatorType {
  danger,
  success,
  warning,
  info,
}

class BadgeIndicator extends StatelessWidget {
  const BadgeIndicator({
    required this.count,
    this.child,
    this.top = -8,
    this.end = -10,
    this.type = BadgeIndicatorType.info,
    super.key,
  });

  final int count;
  final Widget? child;

  final double top;
  final double end;

  final BadgeIndicatorType type;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: count > 0,
      badgeStyle: badges.BadgeStyle(
        elevation: 0,
        shape: badges.BadgeShape.square,
        badgeColor: _badgeColor(context),
        borderRadius: BorderRadius.circular(context.radii.full),
        padding: const EdgeInsets.symmetric(horizontal: 6),
      ),
      badgeAnimation: const badges.BadgeAnimation.scale(),
      badgeContent: Text(
        '${count > _maxCount ? '$_maxCount+' : count}',
        style: context.baseTextStyle.base4.copyWith(
          height: _textHeight,
          color: _textColor(context),
        ),
      ),
      position: badges.BadgePosition.topEnd(top: top, end: end),
      child: child,
    );
  }

  Color _textColor(BuildContext context) {
    switch (type) {
      case BadgeIndicatorType.danger:
      case BadgeIndicatorType.success:
      case BadgeIndicatorType.warning:
      case BadgeIndicatorType.info:
        return context.textColors.invert;
    }
  }

  Color _badgeColor(BuildContext context) {
    switch (type) {
      case BadgeIndicatorType.danger:
        return context.surfaceColors.error;
      case BadgeIndicatorType.success:
        return context.surfaceColors.success;
      case BadgeIndicatorType.warning:
        return context.surfaceColors.warning;
      case BadgeIndicatorType.info:
        return context.surfaceColors.info;
    }
  }
}
