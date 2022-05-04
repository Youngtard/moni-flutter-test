import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xffE66652);
  static const Color _textColor = Color(0xff13163E);

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      color: _textColor,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: _textColor,
    ),
    headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      color: _textColor,
    ),
    headline4: TextStyle(
      fontSize: 16,
      color: _textColor,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: _textColor
    ),
    // headline6: TextStyle(
    //     fontSize: 12,
    //     fontWeight: FontWeight.w600,
    //     color: _textColor
    // ),
    bodyText1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: _textColor,
      // height: 1.25,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _textColor,
      // height: 1.25,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: _lightTextTheme.headline2!.copyWith(color: Colors.black)
      ),
      primaryColor: _primaryColor,
      textTheme: _lightTextTheme,
      fontFamily: "DMSans",
      textSelectionTheme:
      const TextSelectionThemeData(cursorColor: _primaryColor),
      inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xff999999),
          ),
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xff999999),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xffE4E4E4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: _primaryColor,
            ),
          ),
          focusColor: _primaryColor

      ),
    );
  }
}