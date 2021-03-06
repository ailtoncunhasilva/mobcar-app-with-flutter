import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobcar_app/app/models/car_item.dart';
import 'package:mobcar_app/app/pages/showdialog_add_car_page.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService extends ChangeNotifier {
  DataBaseService() {
    //Function for initializing the item list
    _getAllCartItens();
  }

  List<CarItem> listCarItem = [];

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDatabase('carTable.db');
      return _db!;
    }
  }

  Future<Database> initDatabase(String filePath) async {
    //function for to init database
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        '''CREATE TABLE $carItemTable(
          $idColumn INTEGER PRIMARY KEY AUTOINCREMENT, 
          $imgColumn TEXT, 
          $nameCarColumn TEXT, 
          $nameModelColumn TEXT,
          $yearColumn TEXT,
          $valueColumn TEXT
          )''',
      );
    });
  }

  Future<CarItem> saveCarItem(CarItem carItem) async {
    //function save "carItem"
    Database dbCarItem = await db;
    carItem.id = await dbCarItem.insert(carItemTable, carItem.toMap());
    return carItem;
  }

  Future<CarItem?> getCarItem(int id) async {
    //function to catch a certain "carItem" via id
    Database dbCarItem = await db;
    List<Map> maps = await dbCarItem.query(carItemTable,
        columns: [
          idColumn,
          imgColumn,
          nameCarColumn,
          nameModelColumn,
          yearColumn,
          valueColumn
        ],
        where: '$idColumn = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return CarItem.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    //function to delete an item
    Database dbCarItem = await db;
    return await dbCarItem
        .delete(carItemTable, where: '$idColumn = ?', whereArgs: [id]);
  }

  Future<int> update(CarItem carItem) async {
    //function to update an item
    Database dbCarItem = await db;
    return await dbCarItem.update(carItemTable, carItem.toMap(),
        where: '$idColumn = ?', whereArgs: [carItem.id]);
  }

  Future<List> getAllCartItens() async {
    //function to get the carItem list
    Database dbCarItem = await db;
    List listMap = await dbCarItem.rawQuery('SELECT * FROM $carItemTable');
    List<CarItem> listCarItem = [];
    for (Map m in listMap) {
      listCarItem.add(CarItem.fromMap(m));
    }
    notifyListeners();
    return listCarItem;
  }

  Future close() async {
    Database dbCarItem = await db;

    dbCarItem.close();
  }

  void showDialogAddEditCar(BuildContext context, {CarItem? carItem}) async {
  //Showdialog for add or edit an item
    final retCarItem = await showDialog(
        context: context,
        builder: (_) => ShowDialogAddCarPage(carItem: carItem));

    if (retCarItem != null) {
      if (carItem != null) {
        await update(retCarItem);
      } else {
        await saveCarItem(retCarItem);
      }
      _getAllCartItens();
    } 
  }

  void _getAllCartItens(){
    //Function for updating the item list
    getAllCartItens().then((value) => listCarItem = value as List<CarItem>);
  }

  void deleteCarItem(int id){
    //Function for delete an item
    delete(id);
    _getAllCartItens();
  }
}
