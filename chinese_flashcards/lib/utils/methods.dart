import 'package:chinese_flashcards/enums/settings.dart';
import 'package:chinese_flashcards/pages/flashcards_page.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

loadSession({required BuildContext context, required String topic}){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FlashCardsPage()));
  Provider.of<FlashcardsNotifiers>(context, listen: false).setTopic(topic: topic);
}

extension SettingsToText on Settings{

  String toText(){
    switch(this){
      case Settings.englishFirst:
        return "Show English First";
      case Settings.showPinyin:
        return "Show Pinyin";
      case Settings.audioOnly:
        return "Test Listening";
    }
  }

}