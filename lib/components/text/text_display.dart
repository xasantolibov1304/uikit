import 'package:flutter/material.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

enum TextDisplayType {
  large,
  small,
}

class TextDisplay extends StatelessWidget {
  const TextDisplay({
    super.key,
    required this.title,
    this.description,
    required this.type,
  });

  final String title;
  final String? description;
  final TextDisplayType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _titleStyle(context)),
          if (description != null) ...[
            SizedBox(height: 8),
            Text(
              description!,
              style: context.baseTextStyle.base1.copyWith(
                color: context.textColors.tertiary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  TextStyle _titleStyle(BuildContext context) {
    return switch (type) {
      TextDisplayType.large => context.displayTextStyle.display4,
      TextDisplayType.small => context.titleTextStyle.title2,
    };
  }
}
