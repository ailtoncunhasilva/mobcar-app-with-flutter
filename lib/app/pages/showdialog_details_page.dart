import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/shared/widgets/data_car_widget.dart';

class ShowDialogDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                _buildTitleCarWithCloseButton(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                  child: Column(
                    children: [
                      _buildImageCard(),
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
                      _buildElevatedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleCarWithCloseButton(context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.directions_car),
              Padding(
                padding: const EdgeInsets.only(left: kSpacing / 2),
                child: Text('Title',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage('images/imagecar.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildElevatedButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: kSpacing),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
        ),
        onPressed: (){},
        child: Text('Reservar'),
      ),
    );
  }
}
