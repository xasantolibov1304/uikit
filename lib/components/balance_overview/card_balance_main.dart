// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/components/text/number_slide_animation.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _hiddenBalance = '•••• •••';
const _animationDuration = Duration(milliseconds: 300);

class CardBalanceMain extends StatelessWidget {
  const CardBalanceMain({
    required this.title,
    required this.balance,
    this.currency,
    this.isHidden = false,
    //
    this.titleTextStyle,
    this.balanceTextStyle,
    this.currencyTextStyle,
    //
    this.onTitleTap,
    this.onBalanceTap,
    this.onHideTap,
    //
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    super.key,
  });

  final String title;
  final double balance;
  final String? currency;

  final bool isHidden;

  final TextStyle? titleTextStyle;
  final TextStyle? balanceTextStyle;
  final TextStyle? currencyTextStyle;

  final VoidCallback? onTitleTap;
  final VoidCallback? onBalanceTap;
  final void Function(bool isHidden)? onHideTap;

  final Widget? trailing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CommonGestureDetector(
                  onTap: onTitleTap,
                  child: Row(
                    children: [
                      Text(
                        title,
                        style:
                            titleTextStyle ?? context.baseTextStyle.base3,
                      ),
                      if (onTitleTap != null) ...[
                        const SizedBox(width: 4),
                        UikitAssets.icons16.chevronRight.svg(),
                      ]
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                CommonGestureDetector(
                  onTap: onBalanceTap,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isHidden
                          ? Text(
                              _hiddenBalance,
                              style: balanceTextStyle ??
                                  context.displayTextStyle.display3,
                            )
                          : NumberSlideAnimation(
                              number: balance,
                              fractionDigits: 0,
                              curve: Curves.easeInOut,
                              duration: _animationDuration,
                              textStyle: balanceTextStyle ??
                                  context.displayTextStyle.display3,
                            ),
                      if (currency != null && !isHidden) ...[
                        const SizedBox(width: 8),
                        Text(
                          currency!,
                          style: currencyTextStyle ??
                              context.displayTextStyle.display3.copyWith(
                                color: context.textColors.muted,
                              ),
                        ),
                      ],
                      const Expanded(child: SizedBox(width: 16)),
                      if (trailing != null) ...[
                        trailing!,
                        const SizedBox(width: 20),
                      ],
                      if (onHideTap != null)
                        CommonGestureDetector(
                          onTap: () => onHideTap!.call(!isHidden),
                          child: isHidden
                              ? UikitAssets.icons24.eyeSlash.svg()
                              : UikitAssets.icons24.eye.svg(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
