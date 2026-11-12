// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class TextExamplePage extends StatefulWidget {
  const TextExamplePage({super.key});

  @override
  State<TextExamplePage> createState() => _TextExamplePageState();
}

class _TextExamplePageState extends State<TextExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Display Typography'),
            _buildDisplaySection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Title Typography'),
            _buildTitleSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Base Typography'),
            _buildBaseSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: context.titleTextStyle.title1.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDisplaySection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTypographyRow('Display 1', context.displayTextStyle.display1, 'Display'),
          _buildTypographyRow('Display 2', context.displayTextStyle.display2, 'Display'),
          _buildTypographyRow('Display 3', context.displayTextStyle.display3, 'Display'),
          _buildTypographyRow('Display 4', context.displayTextStyle.display4, 'Display'),
          _buildTypographyRow('Display 5', context.displayTextStyle.display5, 'Display'),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTypographyRow('Title 1', context.titleTextStyle.title1, 'Title'),
          _buildTypographyRow('Title 2', context.titleTextStyle.title2, 'Title'),
          _buildTypographyRow('Title 3', context.titleTextStyle.title3, 'Title'),
          _buildTypographyRow('Title 4', context.titleTextStyle.title4, 'Title'),
        ],
      ),
    );
  }

  Widget _buildBaseSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTypographyRow('Base 1 - Regular', context.baseTextStyle.base1.regular, 'Title'),
          _buildTypographyRow('Base 1 - Medium', context.baseTextStyle.base1, 'Title'),
          _buildTypographyRow('Base 2 - Regular', context.baseTextStyle.base2.regular, 'Title'),
          _buildTypographyRow('Base 2 - Medium', context.baseTextStyle.base2, 'Title'),
          _buildTypographyRow('Base 3 - Regular', context.baseTextStyle.base3.regular, 'Title'),
          _buildTypographyRow('Base 3 - Medium', context.baseTextStyle.base3, 'Title'),
          _buildTypographyRow('Base 4 - Regular', context.baseTextStyle.base4.regular, 'Title'),
          _buildTypographyRow('Base 4 - Medium', context.baseTextStyle.base4, 'Title'),
          _buildTypographyRow('Base 5 - Regular', context.baseTextStyle.base5.regular, 'Title'),
          _buildTypographyRow('Base 5 - Medium', context.baseTextStyle.base5, 'Title'),
          _buildTypographyRow('Base 6 - Regular', context.baseTextStyle.base6.regular, 'Title'),
          _buildTypographyRow('Base 6 - Medium', context.baseTextStyle.base6, 'Title'),
        ],
      ),
    );
  }

  Widget _buildTypographyRow(String label, TextStyle style, String previewText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: context.baseTextStyle.base3.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              previewText,
              style: style,
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              '${style.fontSize?.toInt()}px',
              style: context.baseTextStyle.base4.regular.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              style.fontWeight?.value == 400 ? "400" : style.fontWeight?.value == 500 ? "500" : style.fontWeight?.value == 600 ? "600" : "700",
              style: context.baseTextStyle.base4.regular.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
