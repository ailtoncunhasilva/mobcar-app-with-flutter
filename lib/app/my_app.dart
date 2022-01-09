import 'package:flutter/material.dart';
import 'package:mobcar_app/app/data/api_service/service_brand_car.dart';
import 'package:mobcar_app/app/data/database_service.dart';
import 'package:mobcar_app/app/pages/base_page.dart';
import 'package:mobcar_app/app/shared/custom_theme.dart';
import 'package:provider/provider.dart';

import 'data/api_service/service_model_car.dart';
import 'data/api_service/year_car_service.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataBaseService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => BrandCarService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ModelCarService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => YearCarService(),
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