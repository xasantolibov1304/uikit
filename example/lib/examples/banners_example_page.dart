// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class BannersExamplePage extends StatefulWidget {
  const BannersExamplePage({super.key});

  @override
  State<BannersExamplePage> createState() => _BannersExamplePageState();
}

class _BannersExamplePageState extends State<BannersExamplePage> {
  // Banner properties
  String _title = 'Promotional Banner';
  String _description =
      'This is a promotional banner description with some additional text to demonstrate the component.';
  String _imageUrl =
      'https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg?semt=ais_hybrid&w=740';
  PromoBannerType _bannerType = PromoBannerType.aside;
  double _height = 145;
  bool _showClose = true;
  bool _autoplay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banners Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Preview Section
            _buildSectionTitle('Banner Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: PromoBanner(
                title: _title,
                description: _description,
                imageUrl: _imageUrl,
                type: _bannerType,
                height: _height,
                onClose:
                    _showClose ? () => _showSnackBar('Banner closed!') : null,
              ),
            ),
            const SizedBox(height: 24),

            // Banner Carousel Preview
            _buildSectionTitle('Banner Carousel Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: PromoBannerCarousel(
                autoplay: _autoplay,
                children: [
                  PromoBanner(
                    title: 'First Banner',
                    description: 'This is the first banner in the carousel.',
                    imageUrl: _imageUrl,
                    onClose: () => _showSnackBar('First banner closed!'),
                  ),
                  PromoBanner(
                    title: 'Second Banner',
                    description: 'This is the second banner in the carousel.',
                    imageUrl: _imageUrl,
                    onClose: () => _showSnackBar('Second banner closed!'),
                  ),
                  PromoBanner(
                    title: 'Third Banner',
                    description: 'This is the third banner in the carousel.',
                    imageUrl: _imageUrl,
                    onClose: () => _showSnackBar('Third banner closed!'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Banner Controls Section
            _buildSectionTitle('Banner Controls'),
            _buildBannerControls(),
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

  Widget _buildBannerControls() {
    return Column(
      children: [
        // Banner Type
        _buildDropdownControl<PromoBannerType>(
          label: 'Banner Type',
          value: _bannerType,
          items: PromoBannerType.values,
          onChanged: (value) => setState(() => _bannerType = value!),
          itemBuilder: (type) => type.name.toUpperCase(),
        ),

        // Title
        _buildTextControl(
          label: 'Title',
          value: _title,
          onChanged: (value) => setState(() => _title = value),
        ),

        // Description
        _buildTextControl(
          label: 'Description',
          value: _description,
          onChanged: (value) => setState(() => _description = value),
        ),

        // Image URL
        _buildTextControl(
          label: 'Image URL',
          value: _imageUrl,
          onChanged: (value) => setState(() => _imageUrl = value),
        ),

        // Height
        _buildNumberControl(
          label: 'Height',
          value: _height.toString(),
          onChanged: (value) =>
              setState(() => _height = double.tryParse(value) ?? 145),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Show Close',
          value: _showClose,
          onChanged: (value) => setState(() => _showClose = value),
        ),

        _buildSwitchControl(
          label: 'Autoplay',
          value: _autoplay,
          onChanged: (value) => setState(() => _autoplay = value),
        ),
      ],
    );
  }

  Widget _buildDropdownControl<T>({
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required String Function(T) itemBuilder,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: DropdownButtonFormField<T>(
              initialValue: value,
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(itemBuilder(item)),
                );
              }).toList(),
              onChanged: onChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextControl({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: value,
              onChanged: onChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberControl({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: value,
              onChanged: onChanged,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchControl({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
