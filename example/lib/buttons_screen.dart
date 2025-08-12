// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:iman_uikit/uikit.dart' as uikit;

import 'examples/example.dart';

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
            uikit.CurrencyInputField(
              label: 'Currency',
              onSelectCurrencyTap: (value) {},
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
                        builder: (context) => const ButtonsExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Button Cell Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ButtonCellExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Notice Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NoticeExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Info Alert Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const InfoAlertExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Accordion Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AccordionExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Filters Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FiltersExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Banners Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BannersExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Fields Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FieldsExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Inputs Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const InputsExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Text Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TextExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Badge Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BadgeExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Checkbox Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CheckboxExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Switcher Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SwitcherExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Radio Buttons Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RadioExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Snackbar Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SnackbarExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Sliders Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SlidersExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Tab Bar Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TabBarExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Indicators Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const IndicatorsExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Dropdowns Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DropdownsExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Breadcrumb Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BreadcrumbExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Balance Overview Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const BalanceOverviewExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Top Bar Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TopBarExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Overlay Loader Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OverlayLoaderExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'File Upload Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FileUploadExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleButton(
                    'Pincode Example',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PincodeExamplePage(),
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
