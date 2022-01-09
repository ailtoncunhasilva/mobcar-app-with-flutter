import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobcar_app/app/models/value_car.dart';
import 'package:http/http.dart' as http;

class ValueCarService extends ChangeNotifier{

  List<ValueCar> valueList = [];

  Future<void> getItems() async{
    var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos/5940/anos/2014-3');

    final response = await http.get(url);
    Iterable list = json.decode(response.body);

    valueList = list.map((e) => ValueCar.fromJson(e)).toList();

    notifyListeners();
  }
}