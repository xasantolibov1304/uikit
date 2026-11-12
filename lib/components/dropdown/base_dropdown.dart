// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/common/common.dart';
import 'package:uikit/theme/color_theme_data.dart';
import 'package:uikit/theme/shadows/shadows.dart';

class BaseDropdown extends StatefulWidget {
  const BaseDropdown({
    required this.targetChild,
    required this.itemCount,
    required this.itemBuilder,
    this.onSelected,
    this.isEnabled = true,
    this.minWidth,
    this.maxHeight,
    this.menuPadding,
    this.contentPadding,
    this.fitContent = true,
    this.offset,
    super.key,
  });

  final Widget targetChild;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  final void Function(int)? onSelected;

  final bool isEnabled;
  final bool fitContent;

  final Offset? offset;
  final double? minWidth;
  final double? maxHeight;

  final EdgeInsets? menuPadding;
  final EdgeInsets? contentPadding;

  @override
  State<BaseDropdown> createState() => _BaseDropdownState();
}

class _BaseDropdownState extends State<BaseDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;

  void _updateState() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _hideMenu();
    _isMenuOpen = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CommonGestureDetector(
        onTap: () {
          if (_isMenuOpen) {
            _hideMenu();
          } else {
            _showMenu();
          }
        },
        child: widget.targetChild,
      ),
    );
  }

  void _showMenu() {
    if (!widget.isEnabled || _isMenuOpen) return;
    FocusScope.of(context).unfocus();

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _isMenuOpen = true;
    _updateState();
  }

  void _hideMenu() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isMenuOpen = false;
      _updateState();
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(widget.offset ?? Offset.zero);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: _hideMenu,
              onPanDown: (_) => _hideMenu(),
              behavior: HitTestBehavior.translucent,
              child: IgnorePointer(
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy + size.height + 8,
              width: widget.minWidth ?? size.width,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: widget.menuPadding ?? EdgeInsets.zero,
                  constraints: BoxConstraints(
                    maxHeight: widget.maxHeight ?? 320,
                    minWidth: widget.minWidth ?? size.width,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: CommonShadows.baseShadow,
                    color: context.surfaceColors.tertiary,
                    borderRadius: BorderRadius.circular(context.radii.xl),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.itemCount,
                    padding: widget.contentPadding ?? const EdgeInsets.all(8),
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
