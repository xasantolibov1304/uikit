// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class StatusActionButton extends StatelessWidget {
  const StatusActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final Widget icon;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CommonGestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.surfaceColors.success,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: icon),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: context.baseTextStyle.base4,
          ),
        ],
      ),
    );
  }
}
