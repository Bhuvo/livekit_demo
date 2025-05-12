
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class MTheme {

  static final primaryColor = Color(0xFF1D5BBF);
  static final gradientColor = [Color(0xFF1D5BBF), Color(0xFF00AEBD)];

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Colors.white),
      side: const BorderSide(color: Colors.black,),
      checkColor: WidgetStateProperty.all(Color(0xFF00AEBD)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: primaryColor),
      ),
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );

}