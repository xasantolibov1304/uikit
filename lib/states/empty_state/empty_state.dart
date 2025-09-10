// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/button.dart';
import 'package:iman_uikit/states/empty_state/models/empty_state_model.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _imageSize = 192.0;

class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.viewModelBuilder,
    super.key,
  });

  final EmptyStateModelBuilder viewModelBuilder;

  @override
  Widget build(BuildContext context) {
    final viewModel = viewModelBuilder.call(context);
    final isButtonVisible =
        viewModel.buttonText != null && viewModel.onButtonPressed != null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          children: [
            if (viewModel.imagePath != null) ...[
              Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  viewModel.imagePath!,
                  width: _imageSize,
                  height: _imageSize,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
            ],
            Text(
              viewModel.title,
              textAlign: TextAlign.center,
              style: context.displayTextStyle.display4,
            ),
            if (viewModel.description != null) ...[
              const SizedBox(height: 12),
              Text(
                viewModel.description!,
                textAlign: TextAlign.center,
                style: context.baseTextStyle.base1.copyWith(
                  color: context.textColors.secondary,
                ),
              ),
            ],
            if (viewModel.extraContent != null) ...[
              viewModel.extraContent!,
            ],
            if (isButtonVisible) ...[
              const SizedBox(height: 24),
              Button(
                text: viewModel.buttonText!,
                onTap: viewModel.onButtonPressed!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
