// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/gen/assets.gen.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

const _snackDuration = Duration(seconds: 4);

enum _SnackType {
  neutral,
  success,
  warning,
  error,
  info,
}

class Snack {
  const Snack._(
    this.title,
    this.message,
    this._type,
  );

  factory Snack.neutral(String title, String? message) => Snack._(
        title,
        message,
        _SnackType.neutral,
      );

  factory Snack.success(String title, String? message) => Snack._(
        title,
        message,
        _SnackType.success,
      );

  factory Snack.warning(String title, String? message) => Snack._(
        title,
        message,
        _SnackType.warning,
      );

  factory Snack.error(String title, String? message) => Snack._(
        title,
        message,
        _SnackType.error,
      );

  factory Snack.info(String title, String? message) => Snack._(
        title,
        message,
        _SnackType.info,
      );

  final String title;
  final String? message;

  final _SnackType _type;

  Widget _icon(BuildContext context) {
    switch (_type) {
      case _SnackType.neutral:
        return UikitAssets.icons24.infoFilled.svg(
          colorFilter: ColorFilter.mode(
            context.iconColors.tertiary,
            BlendMode.srcIn,
          ),
        );
      case _SnackType.info:
        return UikitAssets.icons24.infoFilled.svg(
          colorFilter: ColorFilter.mode(
            context.iconColors.info,
            BlendMode.srcIn,
          ),
        );
      case _SnackType.error:
        return UikitAssets.icons24.closeSquare.svg(
          colorFilter: ColorFilter.mode(
            context.iconColors.error,
            BlendMode.srcIn,
          ),
        );
      case _SnackType.warning:
        return UikitAssets.icons24.warningTriangle.svg(
          colorFilter: ColorFilter.mode(
            context.iconColors.warning,
            BlendMode.srcIn,
          ),
        );
      case _SnackType.success:
        return UikitAssets.icons24.checkCircle.svg(
          colorFilter: ColorFilter.mode(
            context.iconColors.success,
            BlendMode.srcIn,
          ),
        );
    }
  }
}

void showTopSnack(
  BuildContext context,
  Snack snack,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      duration: _snackDuration,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.radii.lg),
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: context.borderColors.black,
          borderRadius: BorderRadius.circular(context.radii.lg),
        ),
        child: Row(
          children: [
            snack._icon(context),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snack.title,
                    style: context.baseTextStyle.base1.copyWith(
                      color: context.textColors.invert,
                    ),
                  ),
                  if (snack.message != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      snack.message ?? '',
                      style: context.baseTextStyle.base4.copyWith(
                        color: context.textColors.tertiary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            CommonGestureDetector(
              onTap: ScaffoldMessenger.of(context).removeCurrentSnackBar,
              child: UikitAssets.icons24.closeCircle.svg(),
            ),
          ],
        ),
      ),
    ),
  );
}
