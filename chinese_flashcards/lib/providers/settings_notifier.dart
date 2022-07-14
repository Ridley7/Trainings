import 'package:chinese_flashcards/enums/settings.dart';
import 'package:flutter/material.dart';

class SettingsNotifier extends ChangeNotifier{

  Map<Settings, bool> displayOptions = {
    Settings.englishFirst: true,
    Settings.showPinyin: true,
    Settings.audioOnly: false,
  };

  updateDisplayOptions({required Settings displayOption, required bool isToggled}){
    displayOptions.update(displayOption, (value) => isToggled);
    notifyListeners();
  }

  resetSettings(){
    displayOptions.update(Settings.englishFirst, (value) => true);
    displayOptions.update(Settings.showPinyin, (value) => true);
    displayOptions.update(Settings.audioOnly, (value) => false);
    notifyListeners();
  }

}