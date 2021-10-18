import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/models/car_item.dart';
import 'package:mobcar_app/app/shared/widgets/content_showdialog_widget.dart';
import 'package:mobcar_app/app/shared/widgets/data_car_widget.dart';
import 'package:mobcar_app/app/shared/widgets/elevated_button_widget.dart';

class ShowDialogDetailsPage extends StatelessWidget {
  final CarItem carItem;

  ShowDialogDetailsPage(this.carItem);
  
  @override
  Widget build(BuildContext context) {
    return ContentShowDialogWidget(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing, vertical: kSpacing),
      footer: Column(
        children: [
          DataCarWidget(
            text1: 'Marca',
            text1Data: carItem.nameCar ?? '',
            text2: 'Ano',
            text2Data: carItem.year ?? '',
          ),
          DataCarWidget(
            text1: 'Modelo',
            text1Data: carItem.nameModel ?? '',
            text2: 'Valor',
            text2Data: carItem.value ?? '',
          ),
          ElevatedButtonWidget(
            onPressed: (){},
            text: 'Reservar',
            minimunSize: Size.fromHeight(40),
          ),
        ],
      ),
    );
  }
}
