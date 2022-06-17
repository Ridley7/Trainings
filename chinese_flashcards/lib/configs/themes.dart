import 'package:chinese_flashcards/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  primaryColor: kRed,
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: GoogleFonts.notoSans().fontFamily
    )
  ),

  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    color: kRed
  ),

  scaffoldBackgroundColor: kYellow

);