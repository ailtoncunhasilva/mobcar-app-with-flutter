import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';
import 'package:mobcar_app/app/pages/showdialog_add_car.dart';
import 'package:mobcar_app/app/pages/showdialog_details_page.dart';

class BasePage extends StatelessWidget {
  final TextStyle style = TextStyle(
    color: kAccentColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Column(
        //   children: [
        //     Icon(Icons.circle),
        //     Text('MOBCAR', style: style),
        //   ],
        // ),
        title: Text('MOBCAR', style: style),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: kSpacing, left: kSpacing, right: kSpacing),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title 1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: kSpacing / 2),
                          child: Text('Title 2'),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => showDialog(context: context, builder: (_) => ShowDialogAddCar()),
                      child: Text('Add now'),
                    ),
                  ],
                ),
                Divider(color: kPrimaryColor),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: kPrimaryColor),
              itemCount: 10,
              itemBuilder: (_, index) {
                return _buildCarItem(context);
              },
            ),
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

  Widget _buildCarItem(context) {
    //this widget build list of cars to rent.
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
        title: Text('Title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subtitle'),
            InkWell(
              onTap: () => showDialog(
                  context: context, builder: (_) => ShowDialogDetailsPage()),
              child: Text('View More', style: style),
            ),
          ],
        ),
        trailing: Icon(Icons.more_vert),
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
}