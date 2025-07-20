import 'package:flutter/material.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:super_tooltip/super_tooltip.dart';

class CustomTooltip extends StatefulWidget {
  const CustomTooltip({
    required this.title,
    this.subtitle,
    this.child,
    this.showDuration = const Duration(seconds: 4),
    this.preferBelow = true,
    this.verticalOffset = 8,
    this.horizontalOffset = 0,
    this.minWidth = 160,
    this.maxWidth = 240,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? child;
  final Duration showDuration;
  final bool preferBelow;
  final double verticalOffset;
  final double horizontalOffset;
  final double minWidth;
  final double maxWidth;

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip>
    with TickerProviderStateMixin {
  late SuperTooltipController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SuperTooltipController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      hasShadow: false,
      borderRadius: 12,
      showBarrier: false,
      controller: _controller,
      bubbleDimensions:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      backgroundColor: Theme.of(context).borderColors.black,
      barrierColor: context.borderColors.black,
      arrowTipRadius: 10,
      arrowLength: 12,
      arrowBaseWidth: 20,
      shadowBlurRadius: 10,
      content: _buildTooltipContent(),
      child: widget.child ?? const Icon(Icons.info, size: 24.0),
    );
  }

  Widget _buildTooltipContent() {
    return Container(
      constraints: BoxConstraints(
        minWidth: widget.minWidth,
        maxWidth: widget.maxWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).titleTextStyle.compact1.copyWith(
                  color: Theme.of(context).textColors.invert,
                ),
          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.subtitle!,
              style: Theme.of(context).bodyTextStyle.main.copyWith(
                    color: Theme.of(context).textColors.tertiary,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A more advanced tooltip widget with custom content and width constraints
class AdvancedTooltip extends StatefulWidget {
  const AdvancedTooltip({
    required this.title,
    this.subtitle,
    this.child,
    this.showDuration = const Duration(seconds: 4),
    this.preferBelow = true,
    this.verticalOffset = 8,
    this.horizontalOffset = 0,
    this.minWidth = 160,
    this.maxWidth = 240,
    this.tooltipDirection = TooltipDirection.down,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? child;
  final Duration showDuration;
  final bool preferBelow;
  final double verticalOffset;
  final double horizontalOffset;
  final double minWidth;
  final double maxWidth;
  final TooltipDirection tooltipDirection;

  @override
  State<AdvancedTooltip> createState() => _AdvancedTooltipState();
}

class _AdvancedTooltipState extends State<AdvancedTooltip>
    with TickerProviderStateMixin {
  late SuperTooltipController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SuperTooltipController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      controller: _controller,
      showBarrier: false,
      content: _buildTooltipContent(),
      child: widget.child ?? const Icon(Icons.info, size: 24.0),
    );
  }

  Widget _buildTooltipContent() {
    return Container(
      constraints: BoxConstraints(
        minWidth: widget.minWidth,
        maxWidth: widget.maxWidth,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).borderColors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).titleTextStyle.compact1.copyWith(
                  color: Theme.of(context).textColors.invert,
                ),
          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.subtitle!,
              style: Theme.of(context).bodyTextStyle.main.copyWith(
                    color: Theme.of(context).textColors.tertiary,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A custom tooltip overlay that provides more control over positioning and styling
class CustomTooltipOverlay extends StatefulWidget {
  const CustomTooltipOverlay({
    required this.title,
    this.subtitle,
    this.child,
    this.showDuration = const Duration(seconds: 4),
    this.preferBelow = true,
    this.verticalOffset = 8,
    this.horizontalOffset = 0,
    this.minWidth = 160,
    this.maxWidth = 240,
    this.tooltipDirection = TooltipDirection.down,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? child;
  final Duration showDuration;
  final bool preferBelow;
  final double verticalOffset;
  final double horizontalOffset;
  final double minWidth;
  final double maxWidth;
  final TooltipDirection tooltipDirection;

  @override
  State<CustomTooltipOverlay> createState() => _CustomTooltipOverlayState();
}

class _CustomTooltipOverlayState extends State<CustomTooltipOverlay>
    with TickerProviderStateMixin {
  late SuperTooltipController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SuperTooltipController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      controller: _controller,
      content: _buildTooltipContent(),
      child: widget.child ?? const Icon(Icons.info, size: 24.0),
    );
  }

  Widget _buildTooltipContent() {
    return Container(
      constraints: BoxConstraints(
        minWidth: widget.minWidth,
        maxWidth: widget.maxWidth,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).borderColors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).titleTextStyle.compact1.copyWith(
                  color: Theme.of(context).textColors.invert,
                ),
          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.subtitle!,
              style: Theme.of(context).bodyTextStyle.main.copyWith(
                    color: Theme.of(context).textColors.tertiary,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
