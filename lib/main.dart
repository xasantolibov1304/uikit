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
    return uikit.FocusRemover(
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
            ),
            _buildExampleButton(
              'Notice Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.NoticeExamplePage(),
                ),
              ),
            ),
            _buildExampleButton(
              'Accordion Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.AccordionExamplePage(),
                ),
              ),
            ),
            _buildExampleButton(
              'Filters Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.FiltersExamplePage(),
                ),
              ),
            ),
            _buildExampleButton(
              'Banners Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.BannersExamplePage(),
                ),
              ),
            ),
            _buildExampleButton(
              'Fields Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.FieldsExamplePage(),
                ),
              ),
            ),
            _buildExampleButton(
              'Inputs Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.InputsExamplePage(),
                ),
              ),
            ),
            _buildExampleButton(
              'Text Example',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const uikit.TextExamplePage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleButton(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: uikit.Button(
        text: text,
        onTap: onTap,
      ),
    );
  }
}
