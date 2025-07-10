// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';

class TextHighlight extends StatelessWidget {
  const TextHighlight({
    required this.text,
    required this.highlights,
    this.textStyle,
    this.highlightStyle,
    this.caseSensitive = true,
    this.textAlign,
    this.onHighlightTap,
    super.key,
  });

  final String text;
  final List<String> highlights;
  final TextStyle? textStyle;
  final TextStyle? highlightStyle;
  final bool caseSensitive;
  final TextAlign? textAlign;
  final VoidCallback? onHighlightTap;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return _richText(_normalSpan(context, text));
    }
    if (highlights.isEmpty) {
      return _richText(_normalSpan(context, text));
    }
    for (int i = 0; i < highlights.length; i++) {
      if (highlights[i].isEmpty) {
        assert(highlights[i].isNotEmpty);
        return _richText(_normalSpan(context, text));
      }
    }

    final List<TextSpan> spans = [];
    int start = 0;

    final String lowerCaseText = text.toLowerCase();
    final List<String> lowerCaseHighlights =
        highlights.map((e) => e.toLowerCase()).toList();

    while (true) {
      final Map<int, String> highlightsMap = {};

      if (caseSensitive) {
        for (int i = 0; i < highlights.length; i++) {
          final index = text.indexOf(highlights[i], start);
          if (index >= 0) {
            highlightsMap.putIfAbsent(index, () => highlights[i]);
          }
        }
      } else {
        for (int i = 0; i < highlights.length; i++) {
          final index = lowerCaseText.indexOf(lowerCaseHighlights[i], start);
          if (index >= 0) {
            highlightsMap.putIfAbsent(index, () => highlights[i]);
          }
        }
      }

      if (highlightsMap.isNotEmpty) {
        final List<int> indices = highlightsMap.keys.toList()..sort();
        final currentIndex = indices.first;
        final currentHighlight = text.substring(
            currentIndex, currentIndex + highlightsMap[currentIndex]!.length);

        if (currentIndex == start) {
          spans.add(_highlightSpan(context, currentHighlight));
          start += currentHighlight.length;
        } else {
          spans.add(_normalSpan(context, text.substring(start, currentIndex)));
          spans.add(_highlightSpan(context, currentHighlight));
          start = currentIndex + currentHighlight.length;
        }
      } else {
        spans.add(_normalSpan(context, text.substring(start, text.length)));
        break;
      }
    }

    return _richText(TextSpan(children: spans));
  }

  TextSpan _normalSpan(BuildContext context, String value) {
    return TextSpan(
      text: value,
      style: textStyle ?? context.labelTextStyle.main1,
    );
  }

  TextSpan _highlightSpan(BuildContext context, String value) {
    return TextSpan(
      text: value,
      style: highlightStyle ?? context.labelTextStyle.medium1,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          onHighlightTap?.call();
        },
    );
  }

  Text _richText(TextSpan text) => Text.rich(
        text,
        textAlign: textAlign,
      );
}
