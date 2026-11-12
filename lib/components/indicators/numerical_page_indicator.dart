// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/common/ink_well.dart';
import 'package:uikit/gen/assets.gen.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

const _buttonSize = 44.0;

class NumericalPageIndicator extends StatelessWidget {
  const NumericalPageIndicator({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    super.key,
  });

  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxPossibleButtons =
            ((constraints.maxWidth - _buttonSize * 2) / _buttonSize).floor();
        final window = (maxPossibleButtons - 2).clamp(0, totalPages - 2);
        final pageItems = _buildPageItems(context, window);

        if (_fitsInWidth(pageItems, constraints.maxWidth)) {
          return _buildMainRow(context, pageItems);
        }

        return _buildWithReducedWindow(context, constraints, window);
      },
    );
  }

  bool _fitsInWidth(List<Widget> pageItems, double maxWidth) {
    final totalWidth = _buttonSize * 2 + (pageItems.length * _buttonSize);
    return totalWidth <= maxWidth;
  }

  Widget _buildWithReducedWindow(
    BuildContext context,
    BoxConstraints constraints,
    int initialWindow,
  ) {
    for (int window = initialWindow; window >= 0; window--) {
      final pageItems = _buildPageItems(context, window);
      if (_fitsInWidth(pageItems, constraints.maxWidth)) {
        return _buildMainRow(context, pageItems);
      }
    }

    return _buildMinimalLayout(context);
  }

  List<Widget> _buildPageItems(BuildContext context, int window) {
    final items = <Widget>[];

    items.add(_pageButton(context, 1, isCurrent: currentPage == 1));

    if (totalPages <= 2) {
      if (totalPages > 1) {
        items.add(_pageButton(context, totalPages,
            isCurrent: currentPage == totalPages));
      }
      return items;
    }

    final pageRange = _calculatePageRange(window);

    if (pageRange.start > 2) {
      items.add(_ellipsis(context));
    }

    for (int i = pageRange.start; i <= pageRange.end; i++) {
      items.add(_pageButton(context, i, isCurrent: currentPage == i));
    }

    if (pageRange.end < totalPages - 1) {
      items.add(_ellipsis(context));
    }

    items.add(
        _pageButton(context, totalPages, isCurrent: currentPage == totalPages));

    return items;
  }

  ({int start, int end}) _calculatePageRange(int window) {
    if (window <= 0) {
      return (start: 2, end: 1);
    }

    final centerPage = currentPage;
    final halfWindow = window ~/ 2;

    int start = (centerPage - halfWindow).clamp(2, totalPages - 1);
    int end = (centerPage + halfWindow).clamp(2, totalPages - 1);

    if (start == 2) {
      end = (start + window - 1).clamp(2, totalPages - 1);
    } else if (end == totalPages - 1) {
      start = (end - window + 1).clamp(2, totalPages - 1);
    }

    return (start: start, end: end);
  }

  Widget _buildMainRow(BuildContext context, List<Widget> pageItems) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNavigationButton(context, isPrevious: true),
        ...pageItems,
        _buildNavigationButton(context, isPrevious: false),
      ],
    );
  }

  Widget _buildMinimalLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNavigationButton(context, isPrevious: true),
        _pageButton(context, 1, isCurrent: currentPage == 1),
        if (totalPages > 1) ...[
          if (totalPages > 2) _ellipsis(context),
          _pageButton(
            context,
            totalPages,
            isCurrent: currentPage == totalPages,
          ),
        ],
        _buildNavigationButton(context, isPrevious: false),
      ],
    );
  }

  Widget _buildNavigationButton(
    BuildContext context, {
    required bool isPrevious,
  }) {
    final canNavigate = isPrevious ? currentPage > 1 : currentPage < totalPages;

    final icon = isPrevious
        ? UikitAssets.icons24.chevronLeft.svg(
            fit: BoxFit.contain,
            colorFilter: canNavigate
                ? null
                : ColorFilter.mode(
                    context.textColors.muted,
                    BlendMode.srcIn,
                  ),
          )
        : UikitAssets.icons24.chevronRight.svg(
            fit: BoxFit.contain,
            colorFilter: canNavigate
                ? null
                : ColorFilter.mode(
                    context.textColors.muted,
                    BlendMode.srcIn,
                  ),
          );

    return _buttonWidget(
      context,
      onTap: canNavigate
          ? () => onPageChanged(isPrevious ? currentPage - 1 : currentPage + 1)
          : null,
      child: icon,
    );
  }

  Widget _pageButton(
    BuildContext context,
    int page, {
    bool isCurrent = false,
  }) {
    return _buttonWidget(
      context,
      onTap: isCurrent ? null : () => onPageChanged(page),
      color: isCurrent ? context.surfaceColors.grey : null,
      child: Text(
        '$page',
        style: isCurrent
            ? context.baseTextStyle.base2
            : context.baseTextStyle.base2.copyWith(
                color: context.textColors.tertiary,
              ),
      ),
    );
  }

  Widget _ellipsis(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '....',
        style: context.baseTextStyle.base1.copyWith(
          color: context.textColors.tertiary,
        ),
      ),
    );
  }

  Widget _buttonWidget(
    BuildContext context, {
    required Widget child,
    VoidCallback? onTap,
    Color? color,
  }) {
    return CommonInkWell(
      onTap: onTap,
      color: color,
      width: _buttonSize,
      height: _buttonSize,
      borderRadius: BorderRadius.circular(context.radii.md),
      child: Center(child: child),
    );
  }
}
