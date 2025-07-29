// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:iman_uikit/uikit.dart' as uikit;

@RoutePage()
class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  double value = 50;
  String time = '';
  int currentPage = 0;
  RangeValues rangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                uikit.CommonTooltip(
                  title: 'Primary text',
                  // subtitle: 'Secondary text',
                  child: Icon(Icons.info, size: 24),
                )
              ],
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
                    'Info Alert Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const uikit.InfoAlertExamplePage(),
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
                  _buildExampleButton(
                    'Breadcrumb Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const uikit.BreadcrumbExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Balance Overview Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const uikit.BalanceOverviewExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'File Upload Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const uikit.FileUploadExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Top Bar Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const uikit.TopBarExamplePage(),
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
