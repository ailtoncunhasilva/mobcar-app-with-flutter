import 'package:mobcar_app/app/models/car_item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static final DataBaseService instance = DataBaseService._internal();

  factory DataBaseService() => instance;

  DataBaseService._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDatabase('carItem.db');
      return _db!;
    }
  }

  Future<Database> initDatabase(String filePath) async {
    //function for to init database
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, filePath);

    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE $carItemTable($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $imgColumn TEXT, $nameCarColumn TEXT, $nameModelColumn TEXT,)',
      );
    });
  }

  Future<CarItem> saveCarItem(CarItem carItem) async {
    //function save "carItem"
    final dbCarItem = await instance.db;
    carItem.id  = await dbCarItem.insert(carItemTable, carItem.toMap());
    return carItem;
  }

  Future<CarItem?> getCarItem(int id) async {
    //function to catch a certain "carItem" via id
    final dbCarItem = await instance.db;
    List<Map> maps = await dbCarItem.query(carItemTable,
        columns: [idColumn, imgColumn, nameCarColumn, nameModelColumn],
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
    final dbCarItem = await instance.db;
    return await dbCarItem
        .delete(carItemTable, where: '$idColumn = ?', whereArgs: [id]);
  }

  Future<int> update(CarItem carItem) async {
    //function to update an item
    final dbCarItem = await instance.db;
    return await dbCarItem.update(carItemTable, carItem.toMap(),
        where: '$idColumn = ?', whereArgs: [carItem.id]);
  }

  Future<List> getAllCartItens() async {
    //function to get the carItem list
    final dbCarItem = await instance.db;
    List listMap = await dbCarItem.rawQuery('SELECT * FROM $carItemTable');
    List<CarItem> listCarItem = [];
    for (Map m in listMap) {
      listCarItem.add(CarItem.fromMap(m));
    }

    return listCarItem;
  }

  Future close() async{
    final dbCarItem = await instance.db;

     dbCarItem.close();
  }
}

