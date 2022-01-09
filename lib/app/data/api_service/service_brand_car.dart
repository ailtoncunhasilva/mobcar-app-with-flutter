import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobcar_app/app/models/brands_cars.dart';

class BrandCarService extends ChangeNotifier{

  BrandCarService(){
    getBrands();
  }

  List<BrandsCars> brandList = [];

  Future<void> getBrands() async{
    var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas');

    final response = await http.get(url);
    Iterable list = json.decode(response.body);

    brandList = list.map((e) => BrandsCars.fromJson(e)).toList();

    notifyListeners();
  }
}