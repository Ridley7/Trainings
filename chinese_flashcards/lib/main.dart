import 'package:chinese_flashcards/configs/themes.dart';
import 'package:chinese_flashcards/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chinese Flashcards',
      theme: appTheme,
      home: const HomePage()
    );
  }
}
