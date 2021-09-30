import 'package:flutter/material.dart';

const String fontFamily = "Poppins";

final ThemeData themeData  = ThemeData(
      //splashColor: const Color(0xFF804FCC),
      brightness: Brightness.light,
      primaryColor: const Color(0xFF804FCC),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
      colorScheme: const ColorScheme(
          primary: Color(0xFF804FCC),
          primaryVariant: Color(0xFFC0C0C0),
          secondary: Color(0xFFFFFFFF),
          secondaryVariant: Color(0xFFC0C0C0),
          surface: Color(0xFFC0C0C0),
          background: Color(0xFFC0C0C0),
          error: Color(0xFFC0C0C0),
          onPrimary: Color(0xFFC0C0C0),
          onSecondary: Color(0xFFC0C0C0),
          onSurface: Color(0xFFC0C0C0),
          onBackground: Color(0xFFC0C0C0),
          onError: Color(0xFFC0C0C0),
          brightness: Brightness.light));