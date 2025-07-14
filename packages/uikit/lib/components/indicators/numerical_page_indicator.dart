// Flutter imports:
import 'package:flutter/material.dart';
import 'package:iman_uikit/common/ink_well.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return _buildWithOverflowDetection(context, constraints);
    });
  }

  Widget _buildWithOverflowDetection(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    int maxPossibleButtons =
        ((constraints.maxWidth - _buttonSize * 2) / _buttonSize).floor();
    int window = (maxPossibleButtons - 2).clamp(0, totalPages - 2);

    List<Widget> pageItems = _buildPageItems(context, window);

    double totalWidth = _buttonSize * 2 + (pageItems.length * _buttonSize);

    if (totalWidth <= constraints.maxWidth) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonInkWell(
            width: _buttonSize,
            height: _buttonSize,
            borderRadius: BorderRadius.circular(8),
            onTap:
                currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
            child: UikitAssets.icons24.chevronLeft.svg(
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
          ...pageItems,
          CommonInkWell(
            width: _buttonSize,
            height: _buttonSize,
            borderRadius: BorderRadius.circular(8),
            onTap: currentPage < totalPages
                ? () => onPageChanged(currentPage + 1)
                : null,
            child: UikitAssets.icons24.chevronRight.svg(
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
        ],
      );
    }

    return _buildWithReducedWindow(context, constraints, window);
  }

  Widget _buildWithReducedWindow(
    BuildContext context,
    BoxConstraints constraints,
    int initialWindow,
  ) {
    for (int window = initialWindow; window >= 0; window--) {
      List<Widget> pageItems = _buildPageItems(context, window);
      double totalWidth = _buttonSize * 2 + (pageItems.length * _buttonSize);

      if (totalWidth <= constraints.maxWidth) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonInkWell(
              width: _buttonSize,
              height: _buttonSize,
              borderRadius: BorderRadius.circular(8),
              onTap:
                  currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
              child: UikitAssets.icons24.chevronLeft.svg(
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            ...pageItems,
            CommonInkWell(
              width: _buttonSize,
              height: _buttonSize,
              borderRadius: BorderRadius.circular(8),
              onTap: currentPage < totalPages
                  ? () => onPageChanged(currentPage + 1)
                  : null,
              child: UikitAssets.icons24.chevronRight.svg(
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
          ],
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonInkWell(
          width: _buttonSize,
          height: _buttonSize,
          borderRadius: BorderRadius.circular(8),
          onTap: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          child: UikitAssets.icons24.chevronLeft.svg(
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
        _pageButton(context, 1, isCurrent: currentPage == 1),
        if (totalPages > 1) ...[
          if (totalPages > 2) _ellipsis(context),
          _pageButton(
            context,
            totalPages,
            isCurrent: currentPage == totalPages,
          ),
        ],
        CommonInkWell(
          width: _buttonSize,
          height: _buttonSize,
          onTap: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
          borderRadius: BorderRadius.circular(8),
          child: UikitAssets.icons24.chevronRight.svg(
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPageItems(BuildContext context, int window) {
    List<Widget> items = [];

    items.add(_pageButton(context, 1, isCurrent: currentPage == 1));

    if (totalPages <= 2) {
      if (totalPages > 1) {
        items.add(_pageButton(context, totalPages,
            isCurrent: currentPage == totalPages));
      }
      return items;
    }

    int start = 2;
    int end = totalPages - 1;

    if (window > 0) {
      int centerPage = currentPage;
      int halfWindow = window ~/ 2;

      start = (centerPage - halfWindow).clamp(2, totalPages - 1);
      end = (centerPage + halfWindow).clamp(2, totalPages - 1);

      if (start == 2) {
        end = (start + window - 1).clamp(2, totalPages - 1);
      } else if (end == totalPages - 1) {
        start = (end - window + 1).clamp(2, totalPages - 1);
      }
    } else {
      start = 2;
      end = 1;
    }

    if (start > 2) {
      items.add(_ellipsis(context));
    }

    for (int i = start; i <= end; i++) {
      items.add(_pageButton(context, i, isCurrent: currentPage == i));
    }

    if (end < totalPages - 1) {
      items.add(_ellipsis(context));
    }

    items.add(
        _pageButton(context, totalPages, isCurrent: currentPage == totalPages));

    return items;
  }

  Widget _pageButton(
    BuildContext context,
    int page, {
    bool isCurrent = false,
  }) {
    return CommonInkWell(
      width: _buttonSize,
      height: _buttonSize,
      borderRadius: BorderRadius.circular(8),
      onTap: isCurrent ? null : () => onPageChanged(page),
      color: isCurrent ? context.surfaceColors.grey : null,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Text(
        '$page',
        textAlign: TextAlign.center,
        style: context.bodyTextStyle.medium1.copyWith(
          color: isCurrent
              ? context.textColors.primary
              : context.textColors.tertiary,
        ),
      ),
    );
  }

  Widget _ellipsis(BuildContext context) {
    return Container(
      width: _buttonSize,
      height: _buttonSize,
      alignment: Alignment.center,
      child: Text(
        '...',
        style: context.bodyTextStyle.medium1.copyWith(
          color: context.textColors.tertiary,
        ),
      ),
    );
  }
}
