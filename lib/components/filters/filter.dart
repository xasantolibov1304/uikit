// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/common/ink_well.dart';
import 'package:iman_uikit/components/indicators/badge_indicator.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

enum FilterType {
  tab,
  filter,
  sort,
}

const _top = -5.0;

class Filter extends StatelessWidget {
  const Filter.tab({
    required this.title,
    this.onTap,
    this.count = 0,
    this.isEnabled = true,
    this.focusNode,
    super.key,
  }) : _type = FilterType.tab;

  const Filter.filter({
    required this.title,
    this.onTap,
    this.count = 0,
    this.isEnabled = true,
    this.focusNode,
    super.key,
  }) : _type = FilterType.filter;

  const Filter.sort({
    this.onTap,
    this.count = 0,
    this.isEnabled = true,
    this.focusNode,
    super.key,
  })  : title = null,
        _type = FilterType.sort;

  final String? title;
  final int count;
  final VoidCallback? onTap;
  final bool isEnabled;
  final FocusNode? focusNode;

  final FilterType _type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BadgeIndicator(
          top: _top,
          end: _end,
          count: count,
          type: BadgeIndicatorType.danger,
          child: CommonInkWell(
            onTap: onTap,
            padding: _padding,
            focusNode: focusNode,
            color: context.buttonColors.secondary,
            splashColor: context.buttonColors.secondary,
            border: focusNode?.hasFocus == true
                ? Border.all(
                    width: 1.5,
                    color: context.buttonColors.positive,
                  )
                : null,
            borderRadius: BorderRadius.circular(100),
            hoverColor: context.buttonColors.secondary,
            child: Row(
              children: [
                UikitAssets.icons16.filter.svg(
                  colorFilter: ColorFilter.mode(
                    _color,
                    BlendMode.srcIn,
                  ),
                ),
                if (title != null) ...[
                  const SizedBox(width: 4),
                  Text(
                    title!,
                    style: context.labelTextStyle.medium1.copyWith(
                      color: _color,
                    ),
                  ),
                ],
                if (_type == FilterType.filter) ...[
                  const SizedBox(width: 4),
                  UikitAssets.icons20.chevronDown.svg(
                    colorFilter: ColorFilter.mode(
                      _color,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  double get _end {
    if (count > 9) {
      return -15;
    }
    switch (_type) {
      case FilterType.tab:
      case FilterType.filter:
        return -11;
      case FilterType.sort:
        return -7;
    }
  }

  EdgeInsets get _padding {
    switch (_type) {
      case FilterType.tab:
      case FilterType.filter:
        return const EdgeInsets.only(
          top: 4,
          left: 12,
          right: 10,
          bottom: 4,
        );
      case FilterType.sort:
        return const EdgeInsets.all(6);
    }
  }

  Color get _color {
    if (!isEnabled) {
      return const Color(0xFFC4C4C4);
    }
    return const Color(0xFF344054);
  }
}
