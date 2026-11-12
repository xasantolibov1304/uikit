// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class BrandColorsExamplePage extends StatelessWidget {
  const BrandColorsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final brandColors = context.brandColors;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand Colors Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBrandSection(
              context,
              'Invest Brand Colors',
              [
                _buildColorCard(
                    'Primary', brandColors.invest.primary, '#0A1A3C'),
                _buildColorCard(
                    'Secondary', brandColors.invest.secondary, '#0F3769'),
                _buildColorCard(
                    'Tertiary', brandColors.invest.tertiary, '#FFA05F'),
              ],
            ),
            const SizedBox(height: 24),
            _buildBrandSection(
              context,
              'Installment Brand Colors',
              [
                _buildColorCard(
                    'Primary', brandColors.installment.primary, '#FF6969'),
                _buildColorCard(
                    'Secondary', brandColors.installment.secondary, '#FFA05F'),
                _buildColorCard(
                    'Tertiary', brandColors.installment.tertiary, '#FFBE73'),
              ],
            ),
            const SizedBox(height: 24),
            _buildBrandSection(
              context,
              'Payment Brand Colors',
              [
                _buildColorCard(
                    'Primary', brandColors.payment.primary, '#FAE6E6'),
                _buildColorCard(
                    'Secondary', brandColors.payment.secondary, '#F5F0EB'),
                _buildColorCard(
                    'Tertiary', brandColors.payment.tertiary, '#FFFACD'),
              ],
            ),
            const SizedBox(height: 24),
            _buildBrandSection(
              context,
              'Banking Brand Colors',
              [
                _buildColorCard(
                    'Primary', brandColors.banking.primary, '#FFA05F'),
                _buildColorCard(
                    'Secondary', brandColors.banking.secondary, '#FFBE73'),
                _buildColorCard(
                    'Tertiary', brandColors.banking.tertiary, '#FFFACD'),
              ],
            ),
            const SizedBox(height: 24),
            _buildBrandSection(
              context,
              'FinHealth Brand Colors',
              [
                _buildColorCard(
                    'Primary', brandColors.finHealth.primary, '#A5E1F5'),
                _buildColorCard(
                    'Secondary', brandColors.finHealth.secondary, '#F5F0EB'),
                _buildColorCard(
                    'Tertiary', brandColors.finHealth.tertiary, '#FFFACD'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandSection(
      BuildContext context, String title, List<Widget> colorCards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.titleTextStyle.title1.bold,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: colorCards,
        ),
      ],
    );
  }

  Widget _buildColorCard(String name, Color color, String hexValue) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            hexValue,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
