import 'package:derma_handbook/features/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'settings.dart';
import 'data_management.dart';
import 'components/border_radius_widget.dart';
import 'components/color_widget.dart';
import 'components/elevation_widget.dart';
import 'components/padding_widget.dart';
import 'components/theme_mode_widget.dart';
import 'components/utilities_widget.dart';

class SettingsPage extends ReactiveStatelessWidget {
  static const path = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Settings'.text(),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const UtilitiesWidget(),
          // ElevatedButton(
          //   onPressed: () async {
          //     for (final x in await initial()) {
          //       diseasesBloc.addDisease(x);
          //     }
          //   },
          //   child: 'Add Built-in Diseases to List'.text(),
          // ).pad(),
          const DataManagementWidget(),
          const ThemeModeWidget(),
          const ColorWidget(),
          const BorderRadiusWidget(),
          'height'.text(2).pad().center(),
          Slider(
            value: settingsManager.settings.height,
            onChanged: settingsManager.height,
            min: 0,
            max: 120,
          ).pad(),
          const ElevationWidget(),
          const PaddingWidget(),
        ],
      ),
    );
  }
}
