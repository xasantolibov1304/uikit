// Flutter imports:
import 'package:flutter/material.dart';

class CommonShadows {
  static const List<BoxShadow> smallShadow = [
    BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 1),
      color: Color(0x1A000000),
    ),
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 1,
      offset: Offset(0, 1),
      color: Color(0x0D000000),
    ),
  ];

  static const List<BoxShadow> compactShadow = [
    BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 1),
      color: Color(0x1A000000),
    ),
    BoxShadow(
      blurRadius: 12,
      offset: Offset(0, 6),
      color: Color(0x0D000000),
    ),
  ];

  static const List<BoxShadow> baseShadow = [
    BoxShadow(
      blurRadius: 16,
      offset: Offset(0, 4),
      color: Color(0x1A000000),
    ),
  ];

  static const List<BoxShadow> focusShadow = [
    BoxShadow(
      blurRadius: 12,
      offset: Offset(0, 6),
      color: Color(0x1F000000),
    ),
    BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 1),
      color: Color(0x1F000000),
    ),
  ];

  static const List<BoxShadow> mediumShadow = [
    BoxShadow(
      blurRadius: 16,
      offset: Offset(0, 4),
      color: Color(0x1A000000),
    ),
    BoxShadow(
      blurRadius: 22,
      spreadRadius: 8,
      offset: Offset(0, 8),
      color: Color(0x1A000000),
    ),
  ];

  static const List<BoxShadow> largeShadow = [
    BoxShadow(
      blurRadius: 24,
      offset: Offset(0, 12),
      color: Color(0x1A000000),
    ),
    BoxShadow(
      blurRadius: 32,
      spreadRadius: 16,
      offset: Offset(0, 16),
      color: Color(0x1A000000),
    ),
  ];
}
