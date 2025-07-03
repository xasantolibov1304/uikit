// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:iman_uikit/gen/assets.gen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            uikit.Button(
              text: 'Open Buttons Example',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const uikit.ButtonsExamplePage(),
                  ),
                );
              },
              iconEnd: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            uikit.Button(
              text: 'Open ButtonCell Example',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const uikit.ButtonCellExamplePage(),
                  ),
                );
              },
              type: uikit.ButtonType.secondary,
              iconEnd: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            uikit.InputField(
              // enabled: false,
              // canClear: true,
              // initialValue: 'test',
              isLoading: true,
              isRequired: true,
              label: 'Email sdfajklf ds;jas',
              // status: uikit.InputFieldStatus.info,
              size: uikit.InputFieldSize.large,
              captionHelperText: 'helper text',
              captionText: 'df',
              hintText: 'Enter your',
              // suffixLabel: 'Suffix Label',
              suffixValue: 'Suffix Value',
              captionIconPath: UikitAssets.icons24.calendar.path,
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 50,
              ),
              leadingIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            uikit.Accordion(
              title: Text(
                'Title',
                style: context.body.medium2.copyWith(
                  color: Colors.black,
                ),
              ),
              buttonText: 'Button Link',
              onButtonTap: () {},
              content: Text(
                'If we have a long text, we can use this option to accomplish the goal',
                style: context.label.main.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                uikit.Filter.filter(
                  title: 'Title',
                  onTap: () {},
                  isEnabled: true,
                  count: 1,
                ),
                const SizedBox(width: 16),
                uikit.Filter.filter(
                  title: 'Title',
                  onTap: () {},
                  isEnabled: true,
                  count: 1000,
                ),
                const SizedBox(width: 16),
                uikit.Filter.tab(
                  title: '99',
                  onTap: () {},
                  isEnabled: true,
                  count: 10,
                ),
                const SizedBox(width: 16),
                uikit.Filter.sort(
                  onTap: () {},
                  isEnabled: true,
                  count: 1,
                ),
                const SizedBox(width: 16),
                uikit.Filter.sort(
                  onTap: () {},
                  isEnabled: true,
                  count: 10,
                ),
              ],
            ),
            const SizedBox(height: 16),
            uikit.Notice.error(
              // title: 'Title',
              description:
                  'Description fdsjkl fklf slk jklsd jafkljas ;lfj;as jsladfj a;ls j j s l j;',
              // buttonText: 'Button',
              // onButtonTap: () {},
              onDismiss: () {},
            ),
            uikit.TextWidget(
              text:
                  'Description sample with detailed info for “Notice” component Description sample with detailed info for “Notice” component Description sample with  Description sample with detailed info for “Notice” component Description sample with detailed info for “Notice” component Description sample with ',
              style: context.body.main,
              startButtonText: 'Button',
              endButtonText: 'Button2',
            ),
          ],
        ),
      ),
    );
  }
}
