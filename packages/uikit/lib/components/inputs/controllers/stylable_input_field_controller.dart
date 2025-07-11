// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/inputs/controllers/text_part_style_definition.dart';
import 'package:iman_uikit/components/inputs/controllers/text_style_matcher.dart';

// Project imports:

class StylableInputFieldController extends TextEditingController {
  StylableInputFieldController({
    required this.styles,
  }) : combinedPattern = styles.createCombinedPatternBasedOnStyleMap();

  final TextStyleMatcher styles;
  final Pattern combinedPattern;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final List<InlineSpan> textSpanChildren = <InlineSpan>[];

    text.splitMapJoin(
      combinedPattern,
      onMatch: (Match match) {
        final String? textPart = match.group(0);

        if (textPart == null) return '';

        final TextPartStyleDefinition? styleDefinition =
            styles.getStyleOfTextPart(
          textPart,
          text,
        );

        if (styleDefinition == null) return '';

        _addTextSpan(
          textSpanChildren,
          textPart,
          style?.merge(styleDefinition.style),
        );

        return '';
      },
      onNonMatch: (String text) {
        _addTextSpan(textSpanChildren, text, style);

        return '';
      },
    );

    return TextSpan(style: style, children: textSpanChildren);
  }

  void setText(String text) {
    String? existingSuffix;
    for (final styleDefinition in styles.definitionList) {
      final pattern = RegExp(styleDefinition.pattern, caseSensitive: false);
      final matches = pattern.allMatches(this.text);
      for (final match in matches) {
        final matchedText = match.group(0);
        if (matchedText != null && this.text.endsWith(matchedText)) {
          existingSuffix = matchedText;
          break;
        }
      }
      if (existingSuffix != null) break;
    }

    this.text = existingSuffix != null ? '$text$existingSuffix' : text;
  }

  void _addTextSpan(
    List<InlineSpan> textSpanChildren,
    String? textToBeStyled,
    TextStyle? style,
  ) {
    textSpanChildren.add(
      TextSpan(
        text: textToBeStyled,
        style: style,
      ),
    );
  }
}
