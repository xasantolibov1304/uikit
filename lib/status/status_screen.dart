// Flutter imports:
import 'package:flutter/material.dart';
import 'package:iman_uikit/common/safe_area.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

enum StatusScreenType {
  warning,
  error,
  success,
  recycle,
  logo,
}

class StatusScreen extends StatelessWidget {
  const StatusScreen({
    required this.title,
    required this.buttonCell,
    this.description,
    this.banner,
    this.actionButtons,
    this.statusIcon,
    super.key,
  }) : _type = StatusScreenType.logo;

  const StatusScreen.warning({
    required this.title,
    required this.buttonCell,
    this.description,
    this.banner,
    this.actionButtons,
    super.key,
  })  : _type = StatusScreenType.warning,
        statusIcon = null;

  const StatusScreen.error({
    required this.title,
    required this.buttonCell,
    this.description,
    this.banner,
    this.actionButtons,
    super.key,
  })  : _type = StatusScreenType.error,
        statusIcon = null;

  const StatusScreen.success({
    required this.title,
    required this.buttonCell,
    this.description,
    this.banner,
    this.actionButtons,
    super.key,
  })  : _type = StatusScreenType.success,
        statusIcon = null;

  const StatusScreen.recycle({
    required this.title,
    required this.buttonCell,
    this.description,
    this.banner,
    this.actionButtons,
    super.key,
  })  : _type = StatusScreenType.recycle,
        statusIcon = null;

  final StatusScreenType _type;
  final Widget? statusIcon;

  final String title;
  final String? description;

  final Widget? banner;

  final ButtonCell buttonCell;

  final List<StatusActionButton>? actionButtons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoAppBar.themed(),
      body: Column(
        children: [
          const Spacer(),
          _buildMainSection(context),
          const Expanded(child: SizedBox(height: 20)),
          if (banner != null) ...[
            banner!,
          ],
          const Expanded(child: SizedBox(height: 20)),
          if (actionButtons != null && actionButtons!.isNotEmpty) ...[
            _buildActionButtons(context),
            const SizedBox(height: 24),
          ],
          buttonCell,
          MySafeArea.b16(),
        ],
      ),
    );
  }

  Widget _buildMainSection(BuildContext context) {
    return Column(
      children: [
        _statusIcon(),
        const SizedBox(height: 8),
        Text(
          title,
          style: context.titleTextStyle.large2,
        ),
        if (description != null) ...[
          const SizedBox(height: 4),
          Text(
            description!,
            style: context.subtitleTextStyle.large1.copyWith(
              color: context.textColors.secondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _statusIcon() {
    return switch (_type) {
      StatusScreenType.warning => UikitAssets.icons24.warningTriangle.svg(
          width: 96,
          height: 96,
        ),
      StatusScreenType.error => UikitAssets.icons24.closeSquare.svg(
          width: 96,
          height: 96,
        ),
      StatusScreenType.success => UikitAssets.icons24.checkCircle.svg(
          width: 96,
          height: 96,
        ),
      StatusScreenType.recycle => UikitAssets.icons96.recycle.svg(),
      _ => statusIcon ?? const SizedBox.shrink(),
    };
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: actionButtons!
          .map((e) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Expanded(child: e),
              ))
          .toList(),
    );
  }
}
