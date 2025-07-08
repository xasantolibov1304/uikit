// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:iman_uikit/uikit.dart' as uikit;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return uikit.MyFocusRemover(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: uikit.lightTheme,
        darkTheme: uikit.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            _buildExampleButton(
              'Buttons Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.ButtonsExamplePage(),
                ),
              ),
            ),
            _buildExampleButton(
              'Button Cell Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.ButtonCellExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
              count: 10,
            ),
            _buildExampleButton(
              'Notice Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.NoticeExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
            ),
            _buildExampleButton(
              'Accordion Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.AccordionExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
            ),
            _buildExampleButton(
              'Filters Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.FiltersExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
            ),
            _buildExampleButton(
              'Banners Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.BannersExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
            ),
            _buildExampleButton(
              'Fields Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.FieldsExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
            ),
            _buildExampleButton(
              'Inputs Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.InputsExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
            ),
            _buildExampleButton(
              'Text Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.TextExamplePage(),
                ),
              ),
              type: uikit.ButtonType.secondary,
            ),
            uikit.SwitcherCard(
              title: 'Switcher Card',
              subtitle: 'Switcher Card',
              value: _value,
              onChanged: (value) => setState(() => _value = value),
            ),
            const SizedBox(height: 16),
            uikit.CheckboxCard(
              isLoading: true,
              title: 'Checkbox Card',
              subtitle: 'Switcher Card',
              value: _value,
              onChanged: (value) => setState(() => _value = value ?? false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleButton(
    String text,
    VoidCallback onTap, {
    uikit.ButtonType type = uikit.ButtonType.primary,
    int? count,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: uikit.Button(
        text: text,
        onTap: onTap,
        type: type,
        count: count,
        iconEnd: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}
