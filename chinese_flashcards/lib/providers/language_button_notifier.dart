import 'package:chinese_flashcards/enums/language_type.dart';
import 'package:flutter/material.dart';

class LanguageButtonNotifier extends ChangeNotifier{

  bool showImage = true;
  bool showEnglish = true;
  bool showCharacter = false;
  bool showPinyin = false;

  updateShowLanguage({required LanguageType languageType}){

    switch(languageType){
      case LanguageType.image:
        showImage = !showImage;
        break;

      case LanguageType.english:
        showEnglish = !showEnglish;
        break;

      case LanguageType.character:
        showCharacter = !showCharacter;
        break;

      case LanguageType.pinyin:
        showPinyin = !showPinyin;
        break;
    }

    notifyListeners();
  }

}