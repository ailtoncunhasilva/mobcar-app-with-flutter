import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/models/car_item.dart';
import 'package:mobcar_app/app/shared/widgets/content_showdialog_widget.dart';
import 'package:mobcar_app/app/shared/widgets/elevated_button_widget.dart';

class ShowDialogAddCarPage extends StatefulWidget {
  final CarItem? carItem;

  ShowDialogAddCarPage({this.carItem});

  @override
  _ShowDialogAddCarPageState createState() => _ShowDialogAddCarPageState();
}

class _ShowDialogAddCarPageState extends State<ShowDialogAddCarPage> {
  final _valueController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _brandFocus = FocusNode();

  bool _carEdited = false;
  CarItem? _editedCarItem;

  String? brandSelected;
  String? modelSelected;
  String? yearSelected;

  @override
  void initState() {
    super.initState();

    if (widget.carItem == null) {
      _editedCarItem = CarItem();
    } else {
      _editedCarItem = CarItem.fromMap(widget.carItem!.toMap());

      brandSelected = _editedCarItem!.nameCar!;
      modelSelected = _editedCarItem!.nameModel!;
      yearSelected = _editedCarItem!.year!;
      _valueController.text = _editedCarItem!.value!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContentShowDialogWidget(
      padding: const EdgeInsets.only(
          top: kSpacing, left: kSpacing, right: kSpacing, bottom: kSpacing / 2),
      footer: Column(
        children: [
          _buildDropDownBrand(),
          _buildDropDownModel(),
          _buildDropDownYear(),
          _buildTextFielValue(),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildDropDownBrand() {
    List<String> brandList = ['Ford', 'Chevrolet', 'Volkswagen'];

    return Container(
      height: 38,
      child: DropdownButtonFormField(
        items: brandList.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        value: brandSelected,
        decoration: InputDecoration(
          labelText: 'Marca',
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
        ),
        onChanged: (value) => _editedCarItem!.nameCar = value.toString(),
        focusNode: _brandFocus,
        validator: (text) => (text == null) ? 'Campo obrigatório' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget _buildDropDownModel() {
    List<String> modelList = ['EcoSport', 'Cobalt', 'Amarok'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacing),
      child: Container(
        height: 38,
        child: DropdownButtonFormField(
          items: modelList.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          value: modelSelected,
          decoration: InputDecoration(
            labelText: 'Modelo',
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
          ),
          onChanged: (value) => _editedCarItem!.nameModel = value.toString(),
          validator: (text) => (text == null) ? 'Campo obrigatório' : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

  Widget _buildDropDownYear() {
    List<String> yearList = ['2021', '2019', '2016', '2018'];

    return Container(
      height: 38,
      child: DropdownButtonFormField(
        items: yearList.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        value: yearSelected,
        decoration: InputDecoration(
          labelText: 'Ano',
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
        ),
        onChanged: (value) => _editedCarItem!.year = value.toString(),
        validator: (text) => (text == null) ? 'Campo obrigatório' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget _buildTextFielValue() {
    return Padding(
      padding: const EdgeInsets.only(top: kSpacing, bottom: kSpacing / 2),
      child: Container(
        height: 38,
        child: TextFormField(
          controller: _valueController,
          decoration: InputDecoration(
            labelText: 'Valor (R\$)',
            border: OutlineInputBorder(),
          ),
          onChanged: (text) {
            _carEdited = true;
            _editedCarItem!.value = text;
          },
        ),
      ),
    );
  }

  Widget _buildButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancelar'),
        ),
        ElevatedButtonWidget(
          padding: const EdgeInsets.only(left: kSpacing / 2),
          text: 'Salvar',
          onPressed: () {
            if (_editedCarItem!.nameCar != null &&
                _editedCarItem!.nameCar!.isNotEmpty) {
              Navigator.pop(context, _editedCarItem);
            }
          },
        ),
      ],
    );
  }
}
