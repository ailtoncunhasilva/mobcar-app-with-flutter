import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobcar_app/app/models/models_cars.dart';
import 'package:http/http.dart' as http;
import 'package:mobcar_app/app/pages/showdialog_add_car_page.dart';

class ModelCarService extends ChangeNotifier{

  ModelCarService(){
    getModels();
  }

  ShowDialogAddCarPage? showDialogAddCarPage;

  List<ModelsCars> modelList = [];

  int? codeValue;

  List<ModelsCars> get modelsCar{
    final List<ModelsCars> modelsCars = [];

    if(codeValue != null){
      // ignore: unrelated_type_equality_checks
      modelsCars.addAll(modelList.where((e) => e.code == codeValue.toString()));
    }
    return modelsCar;
  }

  Future<void> getModels() async{
    // codeValue = showDialogAddCarPage?.carItem?.value;
    var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas/$codeValue/modelos');
    //https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos

    final response = await http.get(url);
    Iterable list = json.decode(response.body)['modelos'];

    modelList = list.map((e) => ModelsCars.fromJson(e)).toList();

    notifyListeners();
  }
}