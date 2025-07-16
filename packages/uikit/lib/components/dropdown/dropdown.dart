import 'package:flutter/material.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';

class CustomDropdownMenu extends StatefulWidget {
  final Widget child;
  final List<String> items;
  final void Function(String)? onSelected;

  const CustomDropdownMenu({
    super.key,
    required this.child,
    required this.items,
    this.onSelected,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  void _showMenu() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _hideMenu,
        child: Stack(
          children: [
            Positioned(
              // left: offset.dx,
              // top: offset.dy + size.height + 8,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.items
                          .map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 40.0),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    widget.onSelected?.call(item);
                                    _hideMenu();
                                  },
                                  child: Text(
                                    item,
                                    style: context.titleTextStyle.compact1,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
      child: GestureDetector(
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

// Example usage:
// Place this widget in your build method to see the dropdown in action.
/*
CustomDropdownMenu(
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 8,
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('Open Menu', style: TextStyle(fontSize: 20)),
        Icon(Icons.arrow_drop_down),
      ],
    ),
  ),
  items: [
    'Label Menu',
    'Label Menu',
    'Label Menu',
    'Label Menu',
    'Label Menu',
    'Label Menu',
  ],
  onSelected: (item) {
    print('Selected: $item');
  },
)
*/
