import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/data/database_service.dart';
import 'package:mobcar_app/app/models/car_item.dart';
import 'package:mobcar_app/app/pages/showdialog_details_page.dart';
import 'package:mobcar_app/app/shared/widgets/elevated_button_widget.dart';
import 'package:mobcar_app/app/shared/widgets/popup_menu_item_widget.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with ChangeNotifier {
  final TextStyle style = TextStyle(
    color: kAccentColor,
  );

  DataBaseService dataCarItem = DataBaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOBCAR', style: style),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildTitleWithAddButton(),
          Expanded(
            child: Consumer<DataBaseService>(builder: (_, databaseService, __) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(color: kPrimaryColor),
                itemCount: databaseService.listCarItem.length,
                itemBuilder: (context, index) {
                  return _buildCarItem(
                      context, databaseService.listCarItem[index]);
                },
              );
            }),
          ),
          Container(
            color: kPrimaryColor,
            height: MediaQuery.of(context).size.height * 0.08,
            width: double.infinity,
            child: _builCopyright(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleWithAddButton() {
    var carItemDatabase = context.read<DataBaseService>();

    return Container(
      padding:
          const EdgeInsets.only(top: kSpacing, left: kSpacing, right: kSpacing),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aluguel de Veículos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: kSpacing / 2),
                    child: Text('Veículos disponíveis'),
                  ),
                ],
              ),
              ElevatedButtonWidget(
                onPressed: () => carItemDatabase.showDialogAddEditCar(context),
                text: 'Adicionar veículo',
              ),
            ],
          ),
          Divider(color: kPrimaryColor),
        ],
      ),
    );
  }

  Widget _buildCarItem(BuildContext context, CarItem carItem) {
    //this widget build list of cars to rent.
    var carItemDatabase = context.read<DataBaseService>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacing / 2),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage('images/imagecar.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(carItem.nameCar ?? '',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(carItem.nameModel ?? ''),
            InkWell(
              onTap: () => _showDialogDetail(carItem),
              child: Text('Ver mais', style: style),
            ),
          ],
        ),
        trailing: PopupMenuItemWidget(
          onPressedView: () => _showDialogDetail(carItem),
          onPressedEdit: () =>
              carItemDatabase.showDialogAddEditCar(context, carItem: carItem),
          onPressedDelete: () {
            carItemDatabase.deleteCarItem(carItem.id!);
            Navigator.pop(context);
            snackBar(text: 'Veículo deletado com sucesso!', color: Colors.redAccent);
          },
        ),
      ),
    );
  }

  Widget _builCopyright() {
    //this widget show copyright down under base page
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: kSpacing),
          child: Icon(Icons.copyright, color: kAccentColor),
        ),
        Text(
          '2020. All rights reserved to Mobcar.',
          textAlign: TextAlign.center,
          style: style,
        ),
      ],
    );
  }

  void _showDialogDetail(CarItem carItem) {
    showDialog(
        context: context, builder: (_) => ShowDialogDetailsPage(carItem));
  }

  void snackBar({text, color}) {
    final snackBar = SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      backgroundColor: color,
      elevation: 8,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
