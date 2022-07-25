import 'package:chinese_flashcards/configs/themes.dart';
import 'package:chinese_flashcards/pages/home_page.dart';
import 'package:chinese_flashcards/providers/language_button_notifier.dart';
import 'package:chinese_flashcards/providers/settings_notifier.dart';
import 'package:chinese_flashcards/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/flashcards_notifier.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashcardsNotifiers()),
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
        ChangeNotifierProvider(create: (_) => LanguageButtonNotifier()),
      ],
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updatePreferencesOnRestart(context: context);
    return MaterialApp(
      title: 'Chinese Flashcards',
      theme: appTheme,
      home: const HomePage()
    );
  }
}
