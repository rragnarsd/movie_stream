import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF17181F),
    primaryColor: Color(0xFF6C72CB),
    primaryColorLight: Colors.black45,
    bottomAppBarColor: Colors.black,
    buttonColor: Color(0xFF6C72CB),
    cardColor: Color(0xFFEEEDF0),
    splashColor: Color(0xFFCB9C1),
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Color(0xFFCB9C1)),
    shadowColor: Colors.white38,
  );
  /*static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade200,
    primaryColor: Colors.white,
    primaryColorLight: Colors.white30,
    bottomAppBarColor: Colors.white,
    cardColor: Colors.white,
    splashColor: Colors.indigo.shade200,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.indigo),
    shadowColor: Colors.white38,
  );*/
}