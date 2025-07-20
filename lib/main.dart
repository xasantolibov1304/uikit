// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:iman_uikit/uikit.dart' as uikit;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          theme: uikit.lightTheme,
          darkTheme: uikit.darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: uikit.FocusRemover(
            child: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double value = 50;
  String time = '';
  int currentPage = 0;
  RangeValues rangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: uikit.AppBarInternal(
        title: widget.title,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: context.surfaceColors.error,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            uikit.EmptyState(
              viewModelBuilder: (context) => uikit.EmptyStateModel(
                title: 'No data',
                description: 'No data found',
                buttonText: 'AddCard',
                onButtonPressed: () {},
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  _buildExampleButton(
                    'Snackbar Example',
                    () => uikit.showTopSnack(
                      context,
                      uikit.Snack.info('Hello', 'This is a success message'),
                    ),
                  ),
                  _buildExampleButton(
                    'Time Picker Example',
                    () => uikit.CustomBottomSheet.showStaticBottomSheet(
                      context,
                      child: uikit.TimePickerSheet(
                        buttonText: 'Select',
                        onTimeSelected: (time) {
                          setState(() {
                            this.time = time.toString();
                          });
                        },
                      ),
                    ),
                  ),
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
                        builder: (context) =>
                            const uikit.ButtonCellExamplePage(),
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
                        builder: (context) =>
                            const uikit.AccordionExamplePage(),
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
                  _buildExampleButton(
                    'Badge Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.BadgeExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Checkbox Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.CheckboxExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Switcher Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.SwitcherExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Radio Buttons Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.RadioExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Snackbar Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.SnackbarExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Sliders Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.SlidersExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Tab Bar Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.TabBarExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Indicators Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const uikit.IndicatorsExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Dropdowns Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const uikit.DropdownsExamplePage(),
                      ),
                    ),
                  ),
                ],
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
