// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/common/common.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/theme/shadows/shadows.dart';

class CommonDropdown extends StatefulWidget {
  const CommonDropdown({
    required this.child,
    required this.items,
    this.onSelected,
    this.selectedValue,
    this.isEnabled = true,
    this.maxHeight,
    this.menuPadding,
    super.key,
  });

  final Widget child;
  final List<String> items;

  final void Function(String)? onSelected;

  final String? selectedValue;

  final bool isEnabled;

  final double? maxHeight;
  final EdgeInsets? menuPadding;

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

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
      builder: (context) => GestureDetector(
        onTap: _hideMenu,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              right: 16,
              top: offset.dy + size.height + 8,
              child: Material(
                color: Colors.transparent,
                type: MaterialType.transparency,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
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
                    itemCount: widget.items.length,
                    padding: widget.menuPadding ?? const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      final item = widget.items[index];

                      return CommonGestureDetector(
                        onTap: () {
                          _hideMenu();
                          widget.onSelected?.call(item);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              UikitAssets.icons20.check.svg(
                                colorFilter: ColorFilter.mode(
                                  context.iconColors.secondary,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item,
                                  style: context.titleTextStyle.compact1,
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: context.borderColors.primary,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateState() => {if (mounted) setState(() {})};

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
        child: widget.child,
      ),
    );
  }
}
