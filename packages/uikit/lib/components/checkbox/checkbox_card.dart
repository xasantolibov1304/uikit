// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/components/checkbox/checkbox.dart';
import 'package:iman_uikit/components/indicators/progress_indicator.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class CheckboxCard extends StatelessWidget {
  const CheckboxCard({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.tristate = false,
    this.isLoading = false,
    this.trailingIcon,
    super.key,
  });

  final String title;
  final String? subtitle;

  final bool value;
  final void Function(bool?) onChanged;
  final bool tristate;

  final bool isLoading;

  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return CommonGestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        decoration: BoxDecoration(
          color: context.surfaceColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CheckboxWidget(
                    value: value,
                    tristate: tristate,
                    onChanged: onChanged,
                    size: CheckboxSize.small,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.titleTextStyle.main1,
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: context.subtitleTextStyle.compact2.regular,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (isLoading) ...[
              const SizedBox(width: 8),
              const CommonProgressIndicator(),
            ],
            if (trailingIcon != null) ...[
              const SizedBox(width: 8),
              trailingIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
