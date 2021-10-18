import 'package:flutter/material.dart';
import 'package:mobcar_app/app/data/database_service.dart';
import 'package:mobcar_app/app/pages/base_page.dart';
import 'package:mobcar_app/app/shared/custom_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataBaseService(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme.mainTheme,
        home: BasePage(),
      ),
    );
  }
}