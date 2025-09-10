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
    this.autoplay = false,
    this.autoplayDuration = const Duration(seconds: 3),
    this.onSegmentChanged,
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

  /// Number of segments
  final int segments;

  /// Current step index
  final int currentStepIndex;

  final SegmentProgressIndicatorType type;

  /// Whether to automatically change the progress
  final bool autoplay;

  /// Duration for animating each segment during autoplay
  final Duration autoplayDuration;

  /// Callback when segment changes
  final ValueChanged<int>? onSegmentChanged;

  /// Height of the segment
  final double height;

  /// Spacing between segments
  final double spacing;

  /// Padding around the indicator
  final EdgeInsetsGeometry padding;

  /// Whether to show labels
  final bool showLabels;

  /// Labels for each segment
  final List<String>? labels;

  /// Caption for the indicator
  final String? caption;

  /// Subtitle for the indicator
  final String? subtitle;

  @override
  State<SegmentProgressIndicator> createState() =>
      _SegmentProgressIndicatorState();
}

class _SegmentProgressIndicatorState extends State<SegmentProgressIndicator>
    with TickerProviderStateMixin {
  double _currentProgress = 0.0;

  late AnimationController _autoplayController;
  late Animation<double> _autoplayAnimation;

  @override
  void initState() {
    super.initState();
    _currentProgress = widget.currentStepIndex.toDouble();

    if (widget.autoplay) {
      _initAutoplay();
    }
  }

  @override
  void didUpdateWidget(SegmentProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentStepIndex != oldWidget.currentStepIndex) {
      _currentProgress = widget.currentStepIndex.toDouble();

      if (widget.autoplay) {
        _restartAutoplay();
      }
    }

    if (widget.autoplay != oldWidget.autoplay) {
      if (widget.autoplay) {
        _initAutoplay();
      } else {
        _disposeAutoplay();
      }
    }

    if (widget.autoplay &&
        (widget.autoplayDuration != oldWidget.autoplayDuration ||
            widget.segments != oldWidget.segments)) {
      _updateAutoplay();
    }
  }

  @override
  void dispose() {
    if (widget.autoplay) {
      _disposeAutoplay();
    }
    super.dispose();
  }

  void _initAutoplay() {
    final remainingSegments = widget.segments - widget.currentStepIndex;
    final totalDuration = Duration(
      milliseconds: widget.autoplayDuration.inMilliseconds * remainingSegments,
    );

    _autoplayController = AnimationController(
      duration: totalDuration,
      vsync: this,
    );

    _autoplayAnimation = Tween<double>(
      begin: widget.currentStepIndex.toDouble(),
      end: widget.segments.toDouble(),
    ).animate(CurvedAnimation(
      parent: _autoplayController,
      curve: Curves.linear,
    ));

    _autoplayAnimation.addListener(() {
      setState(() {
        _currentProgress = _autoplayAnimation.value;
      });

      // Notify when segment changes
      final currentSegment = _autoplayAnimation.value.floor();
      if (widget.onSegmentChanged != null &&
          currentSegment != widget.currentStepIndex) {
        widget.onSegmentChanged!(currentSegment);
      }
    });

    _autoplayController.forward();
  }

  void _disposeAutoplay() {
    _autoplayController.dispose();
  }

  void _updateAutoplay() {
    _disposeAutoplay();
    _initAutoplay();
  }

  void _restartAutoplay() {
    if (widget.autoplay) {
      _disposeAutoplay();
      _initAutoplay();
    }
  }

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
              style: context.baseTextStyle.base4.copyWith(
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
                      style: context.baseTextStyle.base2.copyWith(
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
              style: context.baseTextStyle.base3.copyWith(
                color: context.textColors.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSegment(int index) {
    final progress =
        widget.autoplay ? _currentProgress : widget.currentStepIndex.toDouble();

    final segmentStart = index.toDouble();
    final segmentEnd = (index + 1).toDouble();

    if (progress >= segmentEnd) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: _progressColor(context),
        ),
      );
    }

    if (progress > segmentStart) {
      final fillPercentage = (progress - segmentStart).clamp(0.0, 1.0);

      return Stack(
        children: [
          // Background (unfilled part)
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: context.borderColors.primary,
            ),
          ),
          // Filled part
          FractionallySizedBox(
            widthFactor: fillPercentage,
            child: Container(
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _progressColor(context),
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: context.borderColors.primary,
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
