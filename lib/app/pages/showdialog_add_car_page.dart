import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/data/api_service/service_brand_car.dart';
import 'package:mobcar_app/app/data/api_service/service_model_car.dart';
import 'package:mobcar_app/app/data/api_service/year_car_service.dart';
import 'package:mobcar_app/app/models/car_item.dart';
import 'package:mobcar_app/app/shared/widgets/content_showdialog_widget.dart';
import 'package:mobcar_app/app/shared/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ShowDialogAddCarPage extends StatefulWidget {
  final CarItem? carItem;

  ShowDialogAddCarPage({this.carItem});

  String? brandSelected;
  CarItem? _editedCarItem;

  @override
  _ShowDialogAddCarPageState createState() => _ShowDialogAddCarPageState();
}

class _ShowDialogAddCarPageState extends State<ShowDialogAddCarPage> {
  final _valueController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _brandFocus = FocusNode();

  bool _carEdited = false;
  

  //String? brandSelected;
  String? modelSelected;
  String? yearSelected;

  @override
  void initState() {
    super.initState();

    if (widget.carItem == null) {
      widget._editedCarItem = CarItem();
    } else {
      widget._editedCarItem = CarItem.fromMap(widget.carItem!.toMap());

      widget.brandSelected = widget._editedCarItem!.nameCar!;
      modelSelected = widget._editedCarItem!.nameModel!;
      yearSelected = widget._editedCarItem!.year!;
      _valueController.text = widget._editedCarItem!.value!;
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

  Widget _buildDropDownBrand(){
    final brandCarService = context.read<BrandCarService>();

    final items = brandCarService.brandList
        .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name ?? '')))
        .toList();

    return Container(
      height: 38,
      child: DropdownButtonFormField(
        items: items,
        value: widget.brandSelected,
        decoration: InputDecoration(
          labelText: 'Marca',
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
        ),
        onChanged: (value) => widget._editedCarItem!.nameCar = value.toString(),
        focusNode: _brandFocus,
        validator: (text) => (text == null) ? 'Campo obrigatório' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget _buildDropDownModel() {
    final modelCarService = context.read<ModelCarService>();

    final items = modelCarService.modelsCar
        .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name ?? '')))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacing),
      child: Container(
        height: 38,
        child: DropdownButtonFormField(
          isExpanded: true,
          items: items,
          value: modelSelected,
          decoration: InputDecoration(
            labelText: 'Modelo',
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
          ),
          onChanged: (value) => widget._editedCarItem!.nameModel = value.toString(),
          validator: (text) => (text == null) ? 'Campo obrigatório' : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

  Widget _buildDropDownYear() {
    final yearCarService = context.read<YearCarService>();

    final items = yearCarService.yearList
        .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name ?? '')))
        .toList();

    return Container(
      height: 38,
      child: DropdownButtonFormField(
        items: items,
        value: yearSelected,
        decoration: InputDecoration(
          labelText: 'Ano',
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
        ),
        onChanged: (value) => widget._editedCarItem!.year = value.toString(),
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
            widget._editedCarItem!.value = text;
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
            if (widget._editedCarItem!.nameCar != null &&
                widget._editedCarItem!.nameCar!.isNotEmpty) {
              Navigator.pop(context, widget._editedCarItem);
            }
          },
        ),
      ],
    );
  }
}
