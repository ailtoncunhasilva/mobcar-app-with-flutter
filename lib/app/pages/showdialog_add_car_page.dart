import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/shared/widgets/content_showdialog_widget.dart';
import 'package:mobcar_app/app/shared/widgets/elevated_button_widget.dart';

class ShowDialogAddCarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentShowDialogWidget(
      padding: const EdgeInsets.only(top: kSpacing, left: kSpacing, right: kSpacing, bottom: kSpacing / 2),
      footer: Column(
        children: [
          _buildDropDownBrand(),
          _buildDropDownModel(),
          _buildDropDownYear(),
          _buildTextFielValue(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {},
                child: Text('Cancelar'),
              ),
              ElevatedButtonWidget(
                padding: const EdgeInsets.only(left: kSpacing / 2),
                text: 'Salvar',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropDownBrand() {
    return SizedBox(
      height: 35,
      child: DropdownButtonFormField(
        items: null,
        decoration: InputDecoration(
          labelText: 'Marca',
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
        ),
      ),
    );
  }

  Widget _buildDropDownModel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacing),
      child: SizedBox(
        height: 35,
        child: DropdownButtonFormField(
          items: null,
          decoration: InputDecoration(
            labelText: 'Modelo',
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
          ),
        ),
      ),
    );
  }

  Widget _buildDropDownYear() {
    return SizedBox(
      height: 35,
      child: DropdownButtonFormField(
        items: null,
        decoration: InputDecoration(
          labelText: 'Ano',
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
        ),
      ),
    );
  }

  Widget _buildTextFielValue() {
    return Padding(
      padding: const EdgeInsets.only(top: kSpacing, bottom: kSpacing / 2),
      child: SizedBox(
        height: 35,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Valor (R\$)',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
