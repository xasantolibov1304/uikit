// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

enum SegmentProgressIndicatorType {
  pirmary,
  success,
  warning,
  error,
  info,
}

class SegmentProgressIndicator extends StatefulWidget {
  const SegmentProgressIndicator({
    required this.segments,
    this.currentStepIndex = 0,
    //
    this.type = SegmentProgressIndicatorType.info,
    this.animate = true,
    this.duration = const Duration(milliseconds: 200),
    this.height = 4.0,
    this.spacing = 8.0,
    this.padding = EdgeInsets.zero,
    //
    this.showLabels = false,
    this.labels,
    //
    this.caption,
    this.subtitle,
    //
    super.key,
  });

  final int segments;
  final int currentStepIndex;

  final SegmentProgressIndicatorType type;

  final bool animate;
  final Duration duration;

  final double height;
  final double spacing;
  final EdgeInsetsGeometry padding;

  final bool showLabels;
  final List<String>? labels;

  final String? caption;
  final String? subtitle;

  @override
  State<SegmentProgressIndicator> createState() =>
      _SegmentProgressIndicatorState();
}

class _SegmentProgressIndicatorState extends State<SegmentProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.caption != null) ...[
            Text(
              widget.caption!,
              style: context.bodyTextStyle.main.copyWith(
                color: context.textColors.primary,
              ),
            ),
            const SizedBox(height: 4),
          ],
          Row(
            children: List.generate(
              widget.segments,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < widget.segments - 1 ? widget.spacing : 0,
                  ),
                  child: _buildSegment(index),
                ),
              ),
            ),
          ),
          if (widget.showLabels && widget.labels != null) ...[
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                widget.segments,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index < widget.segments - 1 ? widget.spacing : 0,
                    ),
                    child: Text(
                      widget.labels![index],
                      style: context.bodyTextStyle.compact2.copyWith(
                        color: context.textColors.primary,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (widget.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.subtitle!,
              style: context.bodyTextStyle.compact2.copyWith(
                color: context.textColors.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSegment(int index) {
    final validStepIndex =
        widget.currentStepIndex.clamp(0, widget.segments - 1);
    final isCompleted = index <= validStepIndex;

    return AnimatedContainer(
      duration: widget.animate ? widget.duration : Duration.zero,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isCompleted
            ? _progressColor(context)
            : context.borderColors.primary,
      ),
    );
  }

  Color _progressColor(BuildContext context) {
    switch (widget.type) {
      case SegmentProgressIndicatorType.pirmary:
        return context.borderColors.primary;
      case SegmentProgressIndicatorType.success:
        return context.borderColors.success;
      case SegmentProgressIndicatorType.warning:
        return context.borderColors.warning;
      case SegmentProgressIndicatorType.error:
        return context.borderColors.error;
      case SegmentProgressIndicatorType.info:
        return context.borderColors.info;
    }
  }
}
