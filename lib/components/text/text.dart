// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

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

  @override
  void didUpdateWidget(TextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapsed != widget.isCollapsed) {
      _isExpanded = !widget.isCollapsed;
    }
  }

  void _updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.radii.xl),
            color: context.surfaceColors.primary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                firstChild: Text(
                  widget.text,
                  maxLines: widget.maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: widget.style ?? context.baseTextStyle.base2,
                ),
                secondChild: Column(
                  children: [
                    Text(
                      widget.text,
                      style: widget.style ?? context.baseTextStyle.base2,
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
            child: CommonGestureDetector(
              onTap: () {
                _isExpanded = !_isExpanded;
                _updateState();
              },
              child: Button(
                size: ButtonSize.small,
                type: ButtonType.secondary,
                text: _isExpanded
                    ? widget.endButtonText!
                    : widget.startButtonText!,
                onTap: () {
                  _isExpanded = !_isExpanded;
                  _updateState();
                },
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
