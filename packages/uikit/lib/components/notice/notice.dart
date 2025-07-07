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
  const Notice.neutral({
    this.title,
    this.description,
    this.onDismiss,
    this.buttonText,
    this.buttonType = ButtonType.primary,
    this.onButtonTap,
    super.key,
  }) : _type = NoticeType.neutral;

  const Notice.info({
    this.title,
    this.description,
    this.onDismiss,
    this.buttonText,
    this.buttonType = ButtonType.primary,
    this.onButtonTap,
    super.key,
  }) : _type = NoticeType.info;

  const Notice.error({
    this.title,
    this.description,
    this.onDismiss,
    this.buttonText,
    this.buttonType = ButtonType.primary,
    this.onButtonTap,
    super.key,
  }) : _type = NoticeType.error;

  const Notice.warning({
    this.title,
    this.description,
    this.onDismiss,
    this.buttonText,
    this.buttonType = ButtonType.primary,
    this.onButtonTap,
    super.key,
  }) : _type = NoticeType.warning;

  const Notice.success({
    this.title,
    this.description,
    this.onDismiss,
    this.buttonText,
    this.buttonType = ButtonType.primary,
    this.onButtonTap,
    super.key,
  }) : _type = NoticeType.success;

  final String? title;
  final String? description;

  final VoidCallback? onDismiss;

  final String? buttonText;
  final ButtonType buttonType;
  final VoidCallback? onButtonTap;

  final NoticeType _type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // color: _backgroundColor(context),
        color: context.surfaceColors.tertiary,
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (onDismiss != null) ...[
            const SizedBox(width: 24),
            MyGestureDetector(
              onTap: onDismiss,
              child: UikitAssets.icons24.closeCircle.svg(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _icon(BuildContext context) {
    switch (_type) {
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
    switch (_type) {
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

  // Color _backgroundColor(BuildContext context) {
  //   switch (_type) {
  //     case NoticeType.neutral:
  //       return context.surfaceColors.tertiary.withValues(alpha: 0.1);
  //     case NoticeType.info:
  //       return context.surfaceColors.info.withValues(alpha: 0.1);
  //     case NoticeType.error:
  //       return context.surfaceColors.error.withValues(alpha: 0.1);
  //     case NoticeType.warning:
  //       return context.surfaceColors.warning.withValues(alpha: 0.1);
  //     case NoticeType.success:
  //       return context.surfaceColors.success.withValues(alpha: 0.1);
  //   }
  // }
}
