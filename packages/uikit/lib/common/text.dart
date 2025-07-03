import 'package:flutter/material.dart';
import 'package:iman_uikit/uikit.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({
    required this.text,
    this.style,
    this.maxLines = 3,
    this.isCollapsed = true,
    this.startButtonText,
    this.endButtonText,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final int maxLines;

  final bool isCollapsed;

  final String? startButtonText;
  final String? endButtonText;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _isExpanded = !widget.isCollapsed;
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.backgroundColors.primary,
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
                    if (_isExpanded) ...[
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
        if (widget.startButtonText != null) ...[
          Positioned(
            right: 16,
            bottom: 4,
            child: MyGestureDetector(
              onTap: () {
                _isExpanded = !_isExpanded;
                updateState();
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: RadialGradient(
                    colors: [
                      context.backgroundColors.primary,
                      context.backgroundColors.primary.withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: Text(
                  _isExpanded ? widget.endButtonText! : widget.startButtonText!,
                  style: context.button.main.copyWith(
                    color: context.textColors.success,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
