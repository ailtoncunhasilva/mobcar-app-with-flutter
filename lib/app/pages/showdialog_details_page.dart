import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/shared/widgets/content_showdialog_widget.dart';
import 'package:mobcar_app/app/shared/widgets/data_car_widget.dart';
import 'package:mobcar_app/app/shared/widgets/elevated_button_widget.dart';

class ShowDialogDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentShowDialogWidget(
      footer: Column(
        children: [
          DataCarWidget(
            text1: 'Marca',
            text1Data: 'Ford',
            text2: 'Ano',
            text2Data: '2020',
          ),
          DataCarWidget(
            text1: 'Modelo',
            text1Data: 'EcoSport',
            text2: 'Valor',
            text2Data: '60.000,00',
          ),
          ElevatedButtonWidget(
            padding: const EdgeInsets.only(bottom: kSpacing),
            onPressed: (){},
            text: 'Reservar',
            minimunSize: Size.fromHeight(40),
          ),
        ],
      ),
    );
  }
}
