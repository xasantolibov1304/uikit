// Flutter imports:
import 'package:flutter/material.dart';

typedef EmptyStateModelBuilder = EmptyStateModel Function(BuildContext context);

class EmptyStateModel {
  const EmptyStateModel({
    required this.title,
    this.imagePath,
    this.description,
    this.extraContent,
    this.buttonText,
    this.onButtonPressed,
  });

  final String? imagePath;

  final String title;

  final String? description;

  final Widget? extraContent;

  final String? buttonText;

  final VoidCallback? onButtonPressed;
}
