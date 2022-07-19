import 'package:chinese_flashcards/enums/settings.dart';
import 'package:chinese_flashcards/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier extends ChangeNotifier{

  Map<Settings, bool> displayOptions = {
    Settings.englishFirst: true,
    Settings.showPinyin: true,
    Settings.audioOnly: false,
  };

  updateDisplayOptions({required Settings displayOption, required bool isToggled}){
    displayOptions.update(displayOption, (value) => isToggled);
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(displayOption.name, isToggled);
    });
    notifyListeners();
  }

  resetSettings(){
    displayOptions.update(Settings.englishFirst, (value) => true);
    displayOptions.update(Settings.showPinyin, (value) => true);
    displayOptions.update(Settings.audioOnly, (value) => false);
    clearPreferences();
    notifyListeners();
  }

}