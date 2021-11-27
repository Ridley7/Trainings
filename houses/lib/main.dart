import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:houses/screens/LandingScreen.dart';
import 'package:houses/utils/constants.dart';

void main() {
  runApp(MyApp());
}

//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1',
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        accentColor: COLOR_DARK_BLUE,
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
        fontFamily: "Montserrat"
      ),
      home: LandingScreen(),
    );
  }
}
