import 'package:flutter/material.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

class CardSelect extends StatelessWidget {
  const CardSelect({
    required this.cardLogo,
    this.amount,
    this.currency,
    this.ownerName,
    this.cardNumber,
    this.cardName,
    this.onTap,
    this.label,
    super.key,
  });

  final Widget cardLogo;
  final String? amount;
  final String? currency;
  final String? ownerName;
  final String? cardNumber;
  final String? cardName;
  final Function()? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.baseTextStyle.base2.copyWith(
              color: context.textColors.tertiary,
            ),
          ),
          SizedBox(height: 8),
        ],
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: context.surfaceColors.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    cardLogo,
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (amount != null && currency != null) ...[
                          Text(amount!, style: context.baseTextStyle.base1),
                          SizedBox(width: 2),
                          Text(
                            currency!,
                            style: context.baseTextStyle.base3.copyWith(color: context.textColors.muted),
                          ),
                        ],
                        if (ownerName != null) ...[Text(ownerName!, style: context.baseTextStyle.base1)],
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    if (cardNumber != null) ...[
                      Text(
                        "• $cardNumber",
                        style: context.baseTextStyle.base4.copyWith(
                          color: context.textColors.tertiary,
                        ),
                      ),
                    ],
                    if (cardName != null) ...[
                      Text(
                        " | $cardName",
                        style: context.baseTextStyle.base4.copyWith(
                          color: context.textColors.tertiary,
                        ),
                      )
                    ],
                  ],
                ),
                if (onTap != null)
                  Column(
                    children: [
                      Icon(Icons.keyboard_arrow_up, color: context.textColors.muted),
                      SizedBox(height: 2),
                      Icon(Icons.keyboard_arrow_down, color: context.textColors.muted),
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
