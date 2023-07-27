import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffeab308);
  static const Color baseBlanca = Colors.white;
  static const String fontTitle = 'arial_bold';
  static const String fontCuerpo = 'arial';

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(selectionHandleColor: Colors.transparent),
  );
}
