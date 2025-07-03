// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/button.dart';
import 'package:iman_uikit/components/buttons/ink_well.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _duration = Duration(milliseconds: 300);

class Accordion extends StatefulWidget {
  const Accordion({
    required this.title,
    this.content,
    this.buttonText,
    this.onButtonTap,
    super.key,
  });

  final Widget title;
  final Widget? content;
  final String? buttonText;
  final VoidCallback? onButtonTap;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin {
  late final AnimationController _expandController;
  late final Animation<double> _animation;
  bool _opened = false;

  @override
  void initState() {
    super.initState();
    _prepareAnimations();
  }

  void _prepareAnimations() {
    _expandController = AnimationController(
      value: 0,
      vsync: this,
      duration: _duration,
    );
    _animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyInkWell(
      onTap: _toggle,
      color: context.fieldColors.background,
      borderRadius: BorderRadius.circular(16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(child: widget.title),
                _opened
                    ? UikitAssets.icons24.chevronUp.svg()
                    : UikitAssets.icons24.chevronDown.svg(),
              ],
            ),
          ),
          SizeTransition(
            axisAlignment: 1,
            sizeFactor: _animation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, right: 16),
                  child: widget.content ?? const SizedBox.shrink(),
                ),
                if (widget.buttonText != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Button(
                        type: ButtonType.ghost,
                        size: ButtonSize.small,
                        text: widget.buttonText!,
                        onTap: widget.onButtonTap,
                        textColor: context.textColors.success,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    _opened = !_opened;
    updateState();

    if (_opened) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }
}
