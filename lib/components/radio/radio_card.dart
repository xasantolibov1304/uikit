// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/components/loaders/loading_indicator.dart';
import 'package:uikit/components/radio/radio.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

class RadioCard extends StatelessWidget {
  const RadioCard({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.isLoading = false,
    this.trailingIcon,
    super.key,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final void Function(bool?) onChanged;

  final bool isLoading;

  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return CommonGestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        decoration: BoxDecoration(
          color: context.surfaceColors.primary,
          borderRadius: BorderRadius.circular(context.radii.xl),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioWidget(
                    value: value,
                    onChanged: onChanged,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.titleTextStyle.title3,
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: context.baseTextStyle.base4.regular,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (isLoading) ...[
              const SizedBox(width: 8),
              const LoadingIndicator(),
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
