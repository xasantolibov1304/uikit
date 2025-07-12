// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/color_theme_data.dart';

const _indicatorSize = Size(36, 5);

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _indicatorSize.width,
      height: _indicatorSize.height,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: context.borderColors.primary,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
