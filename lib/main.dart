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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
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
              count: 10,
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
              label: 'Email',
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
                style: context.bodyTextStyle.medium2.copyWith(
                  color: Colors.black,
                ),
              ),
              buttonText: 'Button Link',
              onButtonTap: () {},
              content: Text(
                'If we have a long text, we can use this option to accomplish the goal',
                style: context.labelTextStyle.main.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            uikit.PhoneTextField(
              label: 'Phone number',
              captionText: 'Caption Text',
              captionHelperText: 'Caption Helper Text',
              captionIconPath: UikitAssets.icons24.calendar.path,
              leadingIcon: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
              ),
              onChanged: (value) {
                debugPrint(value);
              },
              onContactsTap: () {},
            ),
            const SizedBox(height: 16),
            uikit.PasswordInputField(
              label: 'ID',
              onChanged: (value) {
                debugPrint(value);
              },
              captionText: 'Caption Text',
              captionHelperText: 'Caption Helper Text',
              captionIconPath: UikitAssets.icons24.calendar.path,
            ),
            const SizedBox(height: 16),
            uikit.PasswordInputField(
              validator: (value) {
                return 'error';
              },
              label: 'Password',
              onChanged: (value) {
                debugPrint(value);
              },
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
            uikit.Notice.info(
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
              style: context.bodyTextStyle.main,
              startButtonText: 'Button',
              endButtonText: 'Button2',
            ),
            uikit.InfoField(
              label: 'Label',
              value: 'Value',
              suffixValue: 'Suffix Value',
              captionText: 'Caption Text',
              trailingIcon: UikitAssets.icons24.info.svg(),
              valueThrough: 'Value ',
              suffixValueThrough: 'Suffix',
              size: uikit.InfoFieldSize.small,
              leftIcon: Icon(
                Icons.info,
                color: Colors.black,
              ),
              rightIcon: Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            uikit.DateInputField(
              label: 'Date',
              onChanged: (value) {
                debugPrint(value);
              },
              onSelectDateTap: () {},
            ),
            const SizedBox(height: 16),
            uikit.PromoBanner(
              title: 'For describing something useful',
              description:
                  'Чтобы воспользоваться подпиской необходимо скачать приложение IMAN',
              imageUrl:
                  'https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg?semt=ais_hybrid&w=740',
              // onClose: () {},
            ),
          ],
        ),
      ),
    );
  }
}
