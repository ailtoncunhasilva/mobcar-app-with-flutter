import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobcar_app/app/my_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  //WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

