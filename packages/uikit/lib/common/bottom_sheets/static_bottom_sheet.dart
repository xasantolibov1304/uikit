// Flutter imports:
import 'package:flutter/material.dart';
import 'package:iman_uikit/common/focus_remover.dart';
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/common/safe_area.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/utils/media_helper.dart';

class StaticBottomSheet extends StatelessWidget {
  const StaticBottomSheet({
    required this.child,
    this.withIndicator = true,
    this.fixedHeight,
    super.key,
  });

  final Widget child;

  final bool withIndicator;
  final double? fixedHeight;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaHelper.keybord(context);
    final isKeyboardVisible = bottom != 0;

    return FocusRemover(
      child: Container(
        height: fixedHeight,
        decoration: BoxDecoration(
          color: context.backgroundColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (withIndicator)
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   child: PackageAssets.icons64.scrollElement.svg(),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonGestureDetector(
                  padding: const EdgeInsets.all(12),
                  onTap: () => Navigator.of(context).pop(),
                  child: UikitAssets.icons24.closeCircle.svg(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  child,
                ],
              ),
            ),
            isKeyboardVisible ? SizedBox(height: bottom) : MySafeArea.b24(),
          ],
        ),
      ),
    );
  }
}
