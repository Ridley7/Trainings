import 'package:chinese_flashcards/enums/settings.dart';
import 'package:chinese_flashcards/providers/settings_notifier.dart';
import 'package:chinese_flashcards/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    required this.displayOption,
    Key? key,
  }) : super(key: key);

  final Settings displayOption;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(

      builder: (_, notifier, __) =>
          SwitchListTile(
              title: Text(displayOption.toText()),
              value: notifier.displayOptions.entries.firstWhere((element) => element.key
                  == displayOption).value,
              onChanged: (value){
                notifier.updateDisplayOptions(displayOption: displayOption, isToggled: value);
              }
          ),

    );
  }
}