// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/dropdown/base_dropdown.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

enum DropdownType {
  tick,
  radio,
}

class CommonDropdown extends StatefulWidget {
  const CommonDropdown({
    required this.child,
    required this.items,
    this.onValueChanged,
    this.isEnabled = true,
    this.minWidth,
    this.maxHeight,
    this.highlightSelectedItem = true,
    this.leadingIcon,
    this.trailingIcon,
    super.key,
  }) : _type = null;

  const CommonDropdown.tick({
    required this.child,
    required this.items,
    this.onValueChanged,
    this.isEnabled = true,
    this.minWidth,
    this.maxHeight,
    super.key,
  })  : _type = DropdownType.tick,
        leadingIcon = null,
        trailingIcon = null,
        highlightSelectedItem = true;

  const CommonDropdown.radio({
    required this.child,
    required this.items,
    this.onValueChanged,
    this.isEnabled = true,
    this.minWidth,
    this.maxHeight,
    super.key,
  })  : _type = DropdownType.radio,
        leadingIcon = null,
        trailingIcon = null,
        highlightSelectedItem = true;

  final Widget child;
  final List<String> items;
  final void Function(String)? onValueChanged;

  final Widget? leadingIcon;
  final Widget? trailingIcon;

  final bool isEnabled;
  final bool highlightSelectedItem;

  final double? minWidth;
  final double? maxHeight;

  final DropdownType? _type;

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return BaseDropdown(
      targetChild: widget.child,
      minWidth: widget.minWidth,
      maxHeight: widget.maxHeight,
      isEnabled: widget.isEnabled,
      itemCount: widget.items.length,
      menuPadding: const EdgeInsets.all(8.0),
      onSelected: (index) {
        selectedItem = widget.items[index];
        if (selectedItem != null) {
          widget.onValueChanged?.call(selectedItem!);
        }
      },
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final isSelected = item == selectedItem;

        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.only(
            bottom: index == widget.items.length - 1 ? 0 : 10.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.highlightSelectedItem && isSelected
                ? context.surfaceColors.primary
                : null,
          ),
          child: Row(
            children: [
              _buildLeadingIcon(),
              if (widget.leadingIcon != null) const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: context.subtitleTextStyle.medium2,
                ),
              ),
              if (widget.trailingIcon != null) const SizedBox(width: 8),
              _buildTrailingIcon(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLeadingIcon() {
    if (widget._type == DropdownType.tick) {
      return UikitAssets.icons20.check.svg(
        colorFilter: ColorFilter.mode(
          context.iconColors.secondary,
          BlendMode.srcIn,
        ),
      );
    }
    return widget.leadingIcon ?? const SizedBox.shrink();
  }

  Widget _buildTrailingIcon() {
    if (widget._type == DropdownType.radio) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: context.borderColors.primary,
          ),
        ),
      );
    }
    return widget.trailingIcon ?? const SizedBox.shrink();
  }
}
