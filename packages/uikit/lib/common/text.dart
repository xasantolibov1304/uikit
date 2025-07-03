import 'package:flutter/material.dart';
import 'package:iman_uikit/uikit.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({
    required this.text,
    this.style,
    this.buttonText,
    this.onTap,
    this.maxLines = 3,
    this.showReadMore = true,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final int maxLines;
  final String? buttonText;
  final VoidCallback? onTap;
  final bool showReadMore;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool _isExpanded = false;

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    final needsReadMore = widget.text.split('\n').length > widget.maxLines;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.backgroundColors.secondary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                firstChild: Text(
                  widget.text,
                  maxLines: widget.maxLines,
                  style: widget.style ?? context.body.main,
                  overflow: TextOverflow.ellipsis,
                ),
                secondChild: Column(
                  children: [
                    Text(
                      widget.text,
                      style: widget.style ?? context.body.main,
                    ),
                    if (needsReadMore) ...[
                      const SizedBox(height: 36),
                    ],
                  ],
                ),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
        if (widget.buttonText != null) ...[
          Positioned(
            right: 16,
            bottom: 4,
            child: Button(
              text: widget.buttonText!,
              onTap: () {
                _isExpanded = !_isExpanded;
                updateState();
              },
              type: ButtonType.ghost,
              size: ButtonSize.small,
              textColor: context.textColors.success,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ],
      ],
    );
  }
}
