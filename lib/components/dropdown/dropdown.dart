import 'package:flutter/material.dart';
import 'package:iman_uikit/components/dropdown/base_dropdown.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

enum DropdownType {
  tick,
  radio,
  builder,
}

class CommonDropdown extends StatefulWidget {
  const CommonDropdown({
    required this.child,
    required this.items,
    this.onValueChanged,
    this.onSelected,
    this.isEnabled = true,
    this.offset,
    this.minWidth,
    this.maxHeight,
    this.highlightSelectedItem = true,
    super.key,
  })  : _type = null,
        itemCount = null,
        itemBuilder = null;

  const CommonDropdown.tick({
    required this.child,
    required this.items,
    this.onValueChanged,
    this.onSelected,
    this.isEnabled = true,
    this.offset,
    this.minWidth,
    this.maxHeight,
    super.key,
  })  : _type = DropdownType.tick,
        highlightSelectedItem = true,
        itemCount = null,
        itemBuilder = null;

  const CommonDropdown.radio({
    required this.child,
    required this.items,
    this.onValueChanged,
    this.onSelected,
    this.isEnabled = true,
    this.offset,
    this.minWidth,
    this.maxHeight,
    super.key,
  })  : _type = DropdownType.radio,
        highlightSelectedItem = true,
        itemCount = null,
        itemBuilder = null;

  const CommonDropdown.builder({
    required this.child,
    required this.itemBuilder,
    required this.itemCount,
    this.onSelected,
    this.isEnabled = true,
    this.offset,
    this.minWidth,
    this.maxHeight,
    this.highlightSelectedItem = true,
    super.key,
  })  : _type = null,
        items = const [],
        onValueChanged = null;

  final Widget child;
  final List<String> items;
  final void Function(String)? onValueChanged;
  final void Function(int)? onSelected;

  final int? itemCount;
  final Widget Function(BuildContext context, int index, bool isSelected)?
      itemBuilder;

  final bool isEnabled;
  final bool highlightSelectedItem;

  final Offset? offset;
  final double? minWidth;
  final double? maxHeight;

  final DropdownType? _type;

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.itemBuilder != null
        ? widget.itemCount ?? 0
        : widget.items.length;

    return BaseDropdown(
      offset: widget.offset,
      targetChild: widget.child,
      minWidth: widget.minWidth,
      maxHeight: widget.maxHeight,
      isEnabled: widget.isEnabled,
      menuPadding: const EdgeInsets.symmetric(vertical: 8.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: itemCount,
      onSelected: (index) {
        selectedIndex = index;
        if (widget.itemBuilder == null && widget.items.isNotEmpty) {
          widget.onValueChanged?.call(widget.items[index]);
        }
        widget.onSelected?.call(index);
      },
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;
        final isLastItem = index == itemCount - 1;

        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.only(bottom: isLastItem ? 0 : 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.highlightSelectedItem && isSelected
                ? context.surfaceColors.primary
                : null,
          ),
          child: (widget.itemBuilder != null)
              ? widget.itemBuilder!(context, index, isSelected)
              : _buildDefaultItem(context, widget.items[index], isSelected),
        );
      },
    );
  }

  Widget _buildDefaultItem(BuildContext context, String text, bool isSelected) {
    return Row(
      children: [
        if (widget._type == DropdownType.tick && isSelected) ...[
          UikitAssets.icons20.check.svg(
            colorFilter: ColorFilter.mode(
              context.iconColors.secondary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            text,
            style: context.subtitleTextStyle.medium2,
          ),
        ),
        if (widget._type == DropdownType.radio) ...[
          const SizedBox(width: 8),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: context.borderColors.primary,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: context.iconColors.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ],
    );
  }
}
