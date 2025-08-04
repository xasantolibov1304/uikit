// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/balance_overview/card_balance_main.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class CardBalanceSub extends StatelessWidget {
  const CardBalanceSub({
    required this.title,
    required this.balance,
    this.currency,
    this.isHidden = false,
    this.titleTextStyle,
    this.balanceTextStyle,
    this.currencyTextStyle,
    this.onBalanceTap,
    super.key,
  });

  final String title;
  final double balance;
  final String? currency;

  final bool isHidden;

  final TextStyle? titleTextStyle;
  final TextStyle? balanceTextStyle;
  final TextStyle? currencyTextStyle;

  final VoidCallback? onBalanceTap;

  @override
  Widget build(BuildContext context) {
    return CardBalanceMain(
      title: title,
      balance: balance,
      currency: currency,
      isHidden: isHidden,
      onBalanceTap: onBalanceTap,
      titleTextStyle: titleTextStyle ??
          context.subtitleTextStyle.large1.copyWith(
            color: context.textColors.tertiary,
          ),
      balanceTextStyle: balanceTextStyle ?? context.displayTextStyle.large,
      currencyTextStyle: currencyTextStyle ??
          context.displayTextStyle.large.copyWith(
            color: context.textColors.muted,
          ),
    );
  }
}
