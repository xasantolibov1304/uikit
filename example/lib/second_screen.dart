// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:uikit/uikit.dart' as uikit;

@RoutePage()
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: uikit.StatusScreen.success(
        title: 'Success!',
        description: 'Your action was completed successfully.',
        banner: uikit.PromoBannerCarousel(
          autoplay: true,
          children: [
            uikit.PromoBanner(
              title: 'Banner',
              description: 'This is a banner',
            ),
            uikit.PromoBanner(
              title: 'Banner',
              description: 'This is a banner',
            ),
            uikit.PromoBanner(
              title: 'Banner',
              description: 'This is a banner',
            ),
          ],
        ),
        actionButtons: [
          uikit.StatusActionButton(
            label: 'Information',
            icon: uikit.UikitAssets.icons24.info.svg(),
            onTap: () {},
          ),
          uikit.StatusActionButton(
            label: 'Information',
            icon: uikit.UikitAssets.icons24.info.svg(),
            onTap: () {},
          ),
          uikit.StatusActionButton(
            label: 'Information',
            icon: uikit.UikitAssets.icons24.info.svg(),
            onTap: () {},
          ),
        ],
        buttonCell: uikit.ButtonCell(
          primaryText: 'Continue',
          onPrimaryTap: () {},
          tertiaryText: 'Tertiary',
          onTertiaryTap: () {},
        ),
      ),
    );
  }
}
