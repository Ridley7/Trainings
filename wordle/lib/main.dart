import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/pages/home_app.dart';
import 'package:wordle/providers/theme_provider.dart';
import 'package:wordle/themes/themes.dart';
import 'package:wordle/themes/themes_preferences.dart';

import 'providers/controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
      ChangeNotifierProvider(create: (_) => ThemeProvider())
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: ThemePreferences.getTheme(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            Provider.of<ThemeProvider>(context, listen: false).setTheme(turnOn: snapshot.data as bool);
          });
        }

        return Consumer<ThemeProvider>(
        builder: (_, notifier, __) => MaterialApp(
          title: "Wordle Clone",
          theme: notifier.isDark ? darkTheme : lightTheme,
            home: HomeApp()
        ),
      );
      },
    );
  }
}
