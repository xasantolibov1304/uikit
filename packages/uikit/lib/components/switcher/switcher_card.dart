// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:iman_uikit/components/switcher/switcher.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/theme/typographies/typographies.dart';

class SwitcherCard extends StatelessWidget {
  const SwitcherCard({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.titleTextStyle.main1,
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: context.subtitleTextStyle.compact2.regular,
                  ),
              ],
            ),
          ),
          Switcher(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
