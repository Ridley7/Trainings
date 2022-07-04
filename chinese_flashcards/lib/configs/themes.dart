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
    ),
    headline1: TextStyle(
        color: Colors.white,
        fontSize: 58,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      fontWeight: FontWeight.bold
    ),
  ),

  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    color: kRed,
    centerTitle: true,
    elevation: 0,
  ),

  scaffoldBackgroundColor: kYellow,

    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCircularBorderRadius),
      ),
      backgroundColor: kRed,
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.notoSans().fontFamily,
        fontSize: 20,
        color: Colors.white
      )
    ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCircularBorderRadius),
        side: const BorderSide(
          color: Colors.white
        ),
      ),

      primary: kYellow,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.notoSans().fontFamily,
        color: Colors.white,
        fontSize:15
      )
    )
  )

);