import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobcar_app/app/models/year_car.dart';
import 'package:http/http.dart' as http;

class YearCarService extends ChangeNotifier{

  YearCarService(){
    getYear();
  }

  List<YearCar> yearList = [];

  Future<void> getYear() async{
    var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos/5940/anos');

    final response = await http.get(url);
    Iterable list = json.decode(response.body);

    yearList = list.map((e) => YearCar.fromJson(e)).toList();

    notifyListeners();
  }
}