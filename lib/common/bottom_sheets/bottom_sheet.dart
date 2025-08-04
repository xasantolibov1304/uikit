// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/common/bottom_sheets/scrollable_bottom_sheet.dart';
import 'package:iman_uikit/common/bottom_sheets/static_bottom_sheet.dart';

class CustomBottomSheet {
  static Future<T?> showStaticBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    String? title,
    bool hasIndicator = true,
    double? fixedHeight,
  }) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => StaticBottomSheet(
        hasIndicator: hasIndicator,
        fixedHeight: fixedHeight,
        title: title,
        child: child,
      ),
    );
  }

  static Future<T?> showScrollableBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    String? title,
    List<Widget> slivers = const [],
    bool isLoading = false,
    bool hasIndicator = true,
    double minChildSize = 0.5,
    double maxChildSize = 0.95,
    double initialChildSize = 0.5,
  }) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => ScrollableBottomSheet(
        title: title,
        slivers: slivers,
        isLoading: isLoading,
        hasIndicator: hasIndicator,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        initialChildSize: initialChildSize,
        children: [child],
      ),
    );
  }
}
