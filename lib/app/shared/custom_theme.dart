import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';

abstract class CustomTheme {
  static ThemeData get mainTheme => ThemeData(
        primarySwatch: kPrimaryColor,
        accentColor: kAccentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      );
}
