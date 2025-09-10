// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/components/switcher/switcher.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

enum SwitcherCardPosition { start, end }

class SwitcherCard extends StatelessWidget {
  const SwitcherCard({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.position = SwitcherCardPosition.end,
    super.key,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final void Function(bool) onChanged;

  final SwitcherCardPosition position;

  @override
  Widget build(BuildContext context) {
    return CommonGestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        decoration: BoxDecoration(
          color: context.surfaceColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (position == SwitcherCardPosition.start) ...[
              _buildSwitcher(context),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.baseTextStyle.base1,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: context.baseTextStyle.base4.regular.copyWith(
                        color: context.textColors.tertiary,
                      ),
                    ),
                ],
              ),
            ),
            if (position == SwitcherCardPosition.end) ...[
              const SizedBox(width: 8),
              _buildSwitcher(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSwitcher(BuildContext context) {
    return Switcher(
      value: value,
      onChanged: onChanged,
    );
  }
}
