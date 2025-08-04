// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class BreadcrumbItem {
  BreadcrumbItem({
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  final String label;
  final bool isActive;
  final void Function(BreadcrumbItem) onTap;
}

class Breadcrumb extends StatelessWidget {
  const Breadcrumb({
    required this.items,
    super.key,
  });

  final List<BreadcrumbItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _buildCrumb(context, items[i]),
            if (i < items.length - 1)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    '/',
                    style: context.labelTextStyle.main1.copyWith(
                      color: context.textColors.muted,
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildCrumb(BuildContext context, BreadcrumbItem item) {
    final isActive = item.isActive;
    return CommonGestureDetector(
      onTap: isActive ? null : () => item.onTap(item),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: isActive ? 12 : 8,
        ),
        decoration: isActive
            ? BoxDecoration(
                color: context.surfaceColors.grey,
                borderRadius: BorderRadius.circular(100),
              )
            : null,
        child: Text(
          item.label,
          style: isActive
              ? context.labelTextStyle.main1
              : context.labelTextStyle.main1.copyWith(
                  color: context.textColors.tertiary,
                ),
        ),
      ),
    );
  }

  static Widget builder({
    required List<String> labels,
    int initialActive = 0,
    void Function(int index)? onChanged,
  }) {
    return _BreadcrumbBuilder(
      labels: labels,
      initialActive: initialActive,
      onChanged: onChanged,
    );
  }
}

class _BreadcrumbBuilder extends StatefulWidget {
  const _BreadcrumbBuilder({
    required this.labels,
    this.initialActive = 0,
    this.onChanged,
  });

  final List<String> labels;
  final int initialActive;
  final void Function(int index)? onChanged;

  @override
  State<_BreadcrumbBuilder> createState() => _BreadcrumbBuilderState();
}

class _BreadcrumbBuilderState extends State<_BreadcrumbBuilder> {
  late int _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.initialActive;
  }

  void _updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Breadcrumb(
      items: [
        for (int i = 0; i < widget.labels.length; i++)
          BreadcrumbItem(
            label: widget.labels[i],
            isActive: _activeIndex == i,
            onTap: (_) {
              _activeIndex = i;
              widget.onChanged?.call(i);
              _updateState();
            },
          ),
      ],
    );
  }
}
