import 'package:flutter/material.dart';
import 'package:iman_uikit/common/common.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/theme/shadows/shadows.dart';

class BaseDropdown extends StatefulWidget {
  const BaseDropdown({
    required this.targetChild,
    required this.itemCount,
    required this.itemBuilder,
    this.onSelected,
    this.isEnabled = true,
    this.maxHeight,
    this.menuPadding,
    super.key,
  });

  final Widget targetChild;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  final void Function(int)? onSelected;

  final bool isEnabled;

  final double? maxHeight;

  final EdgeInsets? menuPadding;

  @override
  State<BaseDropdown> createState() => _BaseDropdownState();
}

class _BaseDropdownState extends State<BaseDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _updateState() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _hideMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CommonGestureDetector(
        onTap: () {
          if (_overlayEntry == null) {
            _showMenu();
          } else {
            _hideMenu();
          }
        },
        child: widget.targetChild,
      ),
    );
  }

  void _showMenu() {
    if (!widget.isEnabled) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _updateState();
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _updateState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: _hideMenu,
              onPanDown: (_) => _hideMenu(),
              behavior: HitTestBehavior.translucent,
              child: IgnorePointer(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: offset.dx,
              width: size.width,
              top: offset.dy + size.height + 8,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: widget.maxHeight ?? 320,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: CommonShadows.baseShadow,
                    color: context.surfaceColors.tertiary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.itemCount,
                    padding: widget.menuPadding ?? const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return CommonGestureDetector(
                        onTap: () {
                          _hideMenu();
                          widget.onSelected?.call(index);
                        },
                        child: widget.itemBuilder(context, index),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
