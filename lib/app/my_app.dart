import 'package:flutter/material.dart';
import 'package:mobcar_app/app/pages/base_page.dart';
import 'package:mobcar_app/app/shared/custom_theme.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.mainTheme,
      home: BasePage(),
    );
  }
}