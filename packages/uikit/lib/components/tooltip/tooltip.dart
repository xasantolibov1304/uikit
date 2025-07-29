import 'package:flutter/material.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _constraints = BoxConstraints(
  minWidth: 160,
  maxWidth: 240,
);

class CommonTooltip extends StatelessWidget {
  const CommonTooltip({
    required this.title,
    this.subtitle,
    this.child,
    this.showDuration = const Duration(seconds: 5),
    this.preferBelow = true,
    super.key,
  });

  final String title;
  final String? subtitle;

  final Widget? child;
  final Duration showDuration;
  final bool preferBelow;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      verticalOffset: 24,
      margin: EdgeInsets.zero,
      preferBelow: preferBelow,
      constraints: _constraints,
      showDuration: showDuration,
      triggerMode: TooltipTriggerMode.tap,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: context.borderColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      richMessage: WidgetSpan(
        baseline: TextBaseline.alphabetic,
        alignment: PlaceholderAlignment.baseline,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.titleTextStyle.compact1.copyWith(
                color: context.textColors.invert,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: context.bodyTextStyle.main.copyWith(
                  color: context.textColors.tertiary,
                ),
              ),
            ],
          ],
        ),
      ),
      child: child ?? const Icon(Icons.info, size: 24.0),
    );
  }
}
