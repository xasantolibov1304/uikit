// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

enum StepStateType {
  completed,
  warning,
  error,
  active,
  inactive,
}

enum StepIndicatorSize {
  small(24),
  medium(32),
  large(48);

  final double size;

  const StepIndicatorSize(this.size);
}

class StepData {
  StepData({
    required this.label,
    required this.state,
  });

  final String label;
  final StepStateType state;
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    required this.steps,
    this.currentIndex,
    this.onChanged,
    this.size = StepIndicatorSize.small,
    this.labelStyle,
    super.key,
  });

  final int? currentIndex;
  final ValueChanged<int>? onChanged;
  final List<StepData> steps;
  final StepIndicatorSize size;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildStepsWithConnectors(context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps
              .map((step) => Text(
                    step.label,
                    style: labelStyle ??
                        context.baseTextStyle.base4.copyWith(
                          color: context.textColors.tertiary,
                        ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  List<Widget> _buildStepsWithConnectors(BuildContext context) {
    final widgets = <Widget>[];

    for (int i = 0; i < steps.length; i++) {
      widgets.add(CommonGestureDetector(
        onTap: onChanged != null ? () => onChanged!(i) : null,
        child: _buildStep(context, i),
      ));

      if (i < steps.length - 1) {
        final leftStep = steps[i];
        final rightStep = steps[i + 1];
        final isCompleted = leftStep.state == StepStateType.completed ||
            rightStep.state == StepStateType.completed;

        widgets.add(
          Expanded(
            child: Container(
              height: 1,
              margin: EdgeInsets.only(top: size.size / 2.2),
              color: isCompleted
                  ? _getColor(context, StepStateType.completed)
                  : _getColor(context, StepStateType.inactive),
            ),
          ),
        );
      }
    }

    return widgets;
  }

  Widget _buildStep(BuildContext context, int index) {
    final step = steps[index];
    final isCurrentStep = currentIndex != null && currentIndex == index;
    final effectiveState = isCurrentStep ? StepStateType.active : step.state;
    final color = _getColor(context, effectiveState);

    return Container(
      width: size.size,
      height: size.size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (effectiveState != StepStateType.active &&
                effectiveState != StepStateType.inactive)
            ? color
            : null,
        border: (effectiveState == StepStateType.active ||
                effectiveState == StepStateType.inactive)
            ? Border.all(color: color, width: 2)
            : null,
      ),
      child: _buildStepContent(context, effectiveState),
    );
  }

  Widget _buildStepContent(BuildContext context, StepStateType state) {
    if (state == StepStateType.active) {
      return Center(
        child: Container(
          width: size.size * 0.3,
          height: size.size * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.iconColors.info,
          ),
        ),
      );
    }

    if (state == StepStateType.inactive) {
      return const SizedBox.shrink();
    }

    return _getIcon(state);
  }

  Color _getColor(BuildContext context, StepStateType state) {
    return switch (state) {
      StepStateType.completed => context.iconColors.success,
      StepStateType.warning => context.iconColors.warning,
      StepStateType.error => context.iconColors.error,
      StepStateType.active => context.iconColors.tertiary,
      StepStateType.inactive => context.borderColors.muted,
    };
  }

  Widget _getIcon(StepStateType state) {
    return switch (state) {
      StepStateType.completed => UikitAssets.icons20.check.svg(),
      StepStateType.warning => UikitAssets.icons20.warning.svg(),
      StepStateType.error => UikitAssets.icons20.close.svg(),
      _ => const SizedBox.shrink(),
    };
  }
}
