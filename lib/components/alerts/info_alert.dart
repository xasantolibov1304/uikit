// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/gen/assets.gen.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';
import 'package:uikit/theme/shadows/shadows.dart';

enum InfoAlertType {
  neutral,
  info,
  error,
  warning,
  success,
}

class InfoAlert extends StatelessWidget {
  const InfoAlert({
    this.title,
    this.description,
    this.onDismiss,
    this.iconType = InfoAlertType.neutral,
    super.key,
  });

  final String? title;
  final String? description;

  final VoidCallback? onDismiss;

  final InfoAlertType iconType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: CommonShadows.baseShadow,
        color: context.surfaceColors.tertiary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _icon(context),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: context.titleTextStyle.title2,
                  ),
                ],
                if (title != null && description != null) ...[
                  const SizedBox(height: 2),
                ],
                if (description != null) ...[
                  Text(
                    description!,
                    style: context.baseTextStyle.base2.copyWith(
                      color: context.textColors.tertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onDismiss != null) ...[
            const SizedBox(width: 24),
            CommonGestureDetector(
              onTap: onDismiss,
              child: UikitAssets.icons24.closeCircle.svg(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _icon(BuildContext context) {
    switch (iconType) {
      case InfoAlertType.neutral:
        return SizedBox.shrink();
      case InfoAlertType.info:
        return UikitAssets.icons24.infoFilled.svg(
          colorFilter: ColorFilter.mode(
            _iconColor(context),
            BlendMode.srcIn,
          ),
        );
      case InfoAlertType.error:
        return UikitAssets.icons24.closeSquare.svg();
      case InfoAlertType.warning:
        return UikitAssets.icons24.warningTriangle.svg();
      case InfoAlertType.success:
        return UikitAssets.icons24.checkCircle.svg();
    }
  }

  Color _iconColor(BuildContext context) {
    switch (iconType) {
      case InfoAlertType.neutral:
        return context.iconColors.tertiary;
      case InfoAlertType.info:
        return context.iconColors.info;
      case InfoAlertType.error:
        return context.iconColors.error;
      case InfoAlertType.warning:
        return context.iconColors.warning;
      case InfoAlertType.success:
        return context.iconColors.success;
    }
  }
}
