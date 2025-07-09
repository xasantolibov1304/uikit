// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/uikit.dart';

enum NoticeType {
  neutral,
  info,
  error,
  warning,
  success,
}

class Notice extends StatelessWidget {
  const Notice({
    this.title,
    this.description,
    this.onDismiss,
    this.buttonText,
    this.backgroundType = NoticeType.neutral,
    this.iconType = NoticeType.neutral,
    this.buttonType = ButtonType.primary,
    this.onButtonTap,
    super.key,
  });

  final String? title;
  final String? description;

  final VoidCallback? onDismiss;

  final String? buttonText;
  final ButtonType buttonType;
  final VoidCallback? onButtonTap;

  final NoticeType backgroundType;
  final NoticeType iconType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _backgroundColor(context),
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
                    style: context.titleTextStyle.main1,
                  ),
                ],
                if (title != null && description != null) ...[
                  const SizedBox(height: 8),
                ],
                if (description != null) ...[
                  Text(
                    description!,
                    style: context.bodyTextStyle.main.copyWith(
                      color: context.textColors.secondary,
                    ),
                  ),
                ],
                if (buttonText != null) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Button(
                        type: buttonType,
                        text: buttonText!,
                        onTap: onButtonTap,
                        size: ButtonSize.small,
                      ),
                    ],
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
      case NoticeType.neutral:
        return UikitAssets.icons24.infoFilled.svg(
          colorFilter: ColorFilter.mode(
            _iconColor(context),
            BlendMode.srcIn,
          ),
        );
      case NoticeType.info:
        return UikitAssets.icons24.infoFilled.svg(
          colorFilter: ColorFilter.mode(
            _iconColor(context),
            BlendMode.srcIn,
          ),
        );
      case NoticeType.error:
        return UikitAssets.icons24.closeSquare.svg();
      case NoticeType.warning:
        return UikitAssets.icons24.warningTriangle.svg();
      case NoticeType.success:
        return UikitAssets.icons24.checkCircle.svg();
    }
  }

  Color _iconColor(BuildContext context) {
    switch (iconType) {
      case NoticeType.neutral:
        return context.iconColors.tertiary;
      case NoticeType.info:
        return context.iconColors.info;
      case NoticeType.error:
        return context.iconColors.error;
      case NoticeType.warning:
        return context.iconColors.warning;
      case NoticeType.success:
        return context.iconColors.success;
    }
  }

  Color _backgroundColor(BuildContext context) {
    switch (backgroundType) {
      case NoticeType.neutral:
        return context.surfaceColors.tertiary;
      case NoticeType.info:
        return context.surfaceColors.info;
      case NoticeType.error:
        return context.surfaceColors.error;
      case NoticeType.warning:
        return context.surfaceColors.warning;
      case NoticeType.success:
        return context.surfaceColors.success;
    }
  }
}
