import 'package:chinese_flashcards/components/app/custom_app_bar.dart';
import 'package:chinese_flashcards/components/settings/switch_button.dart';
import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/enums/settings.dart';
import 'package:chinese_flashcards/providers/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../components/settings/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHeight),
          child: CustomAppBar(),
        ),

        body: Stack(
          children: [
            Column(
              children: const [
                SwitchButton(displayOption: Settings.englishFirst,),
                SwitchButton(displayOption: Settings.showPinyin),
                SwitchButton(displayOption: Settings.audioOnly)
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SettingsTile(icon: Icon(Icons.refresh), title: 'Reset', callback: (){
                  notifier.resetSettings();
                },),
                SettingsTile(icon: Icon(Icons.exit_to_app), title: 'Exit App', callback: (){
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },)
              ],
            )
          ],
        ),

      ),
    );
  }
}




