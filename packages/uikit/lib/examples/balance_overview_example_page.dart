// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class BalanceOverviewExamplePage extends StatefulWidget {
  const BalanceOverviewExamplePage({super.key});

  @override
  State<BalanceOverviewExamplePage> createState() =>
      _BalanceOverviewExamplePageState();
}

class _BalanceOverviewExamplePageState
    extends State<BalanceOverviewExamplePage> {
  // Balance properties
  double _balance = 1000000.0;
  String _title = 'Total Balance';
  String _currency = 'USD';
  bool _isHidden = false;
  bool _showTrailing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance Overview Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Preview Section
            _buildSectionTitle('Balance Overview Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CardBalanceMain(
                    title: _title,
                    balance: _balance,
                    currency: _currency,
                    isHidden: _isHidden,
                    onTitleTap: () => _showSnackBar('Title tapped!'),
                    onBalanceTap: () => _showSnackBar('Balance tapped!'),
                    onHideTap: (hidden) {
                      setState(() {
                        _isHidden = hidden;
                      });
                      _showSnackBar('Balance ${hidden ? 'hidden' : 'shown'}!');
                    },
                    trailing: _showTrailing
                        ? IconButton(
                            icon: const Icon(Icons.info_outline),
                            onPressed: () => _showSnackBar('Info tapped!'),
                          )
                        : null,
                  ),
                  const SizedBox(height: 16),
                  CardBalanceSub(
                    title: 'Available Balance',
                    balance: _balance * 0.8,
                    currency: _currency,
                    isHidden: _isHidden,
                    onBalanceTap: () => _showSnackBar('Sub balance tapped!'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Balance Controls Section
            _buildSectionTitle('Balance Controls'),
            _buildBalanceControls(),
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
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildBalanceControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Balance Amount
        _buildControlItem(
          'Balance Amount',
          Slider(
            value: _balance,
            min: 0,
            max: 10000000,
            divisions: 100,
            onChanged: (value) {
              setState(() {
                _balance = value;
              });
            },
          ),
          Text('${_balance.toStringAsFixed(0)}'),
        ),
        const SizedBox(height: 16),

        // Title
        _buildControlItem(
          'Title',
          TextField(
            controller: TextEditingController(text: _title),
            onChanged: (value) {
              setState(() {
                _title = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter title',
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Currency
        _buildControlItem(
          'Currency',
          DropdownButtonFormField<String>(
            value: _currency,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: ['USD', 'EUR', 'GBP', 'JPY', 'CAD', 'AUD']
                .map((currency) => DropdownMenuItem(
                      value: currency,
                      child: Text(currency),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _currency = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Hidden Toggle
        _buildControlItem(
          'Hidden Balance',
          Switch(
            value: _isHidden,
            onChanged: (value) {
              setState(() {
                _isHidden = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Show Trailing Toggle
        _buildControlItem(
          'Show Trailing Icon',
          Switch(
            value: _showTrailing,
            onChanged: (value) {
              setState(() {
                _showTrailing = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildControlItem(String label, Widget control, [Widget? value]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        control,
        if (value != null) ...[
          const SizedBox(height: 4),
          value,
        ],
        const SizedBox(height: 16),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
