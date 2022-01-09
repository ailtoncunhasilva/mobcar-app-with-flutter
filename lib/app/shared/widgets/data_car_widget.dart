import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';

class DataCarWidget extends StatelessWidget {
  final String text1;
  final String text1Data;
  final String text2;
  final String text2Data;

  DataCarWidget({
    required this.text1,
    required this.text1Data,
    required this.text2,
    required this.text2Data,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: kSpacing),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.38,
            child: Row(
              children: [
                Text(text1, style: style),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: kSpacing / 2),
                    child: Text(text1Data),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: kSpacing / 2),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Text(text2, style: style),
                  Padding(
                    padding: const EdgeInsets.only(left: kSpacing / 2),
                    child: Text(text2Data),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
