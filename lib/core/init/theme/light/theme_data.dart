import 'package:flutter/material.dart';

const String fontFamily = "Poppins";

final ThemeData themeData = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],

    // Define the default font family.
    fontFamily: fontFamily,

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0),
      bodyText1: TextStyle(fontSize: 12.0),
    ),

   
  );