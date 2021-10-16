import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String carItemTable = 'carItemTable';
final String idColumn = 'idColumn';
final String imgColumn = 'imgColumn';
final String nameCarColumn = 'nameCarColumn';
final String nameModelColumn = 'nameModelColumn';

class DataCarItem {
  static final DataCarItem instance = DataCarItem._internal();

  factory DataCarItem() => instance;

  DataCarItem._internal();

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
        'CREATE TABLE $carItemTable($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $imgColumn TEXT, $nameCarColumn TEXT, $nameModelColumn TEXT)',
      );
    });
  }

  Future<CarItem> saveCarItem(CarItem carItem) async {
    //function save "carItem"
    final dbCarItem = await instance.db;
    carItem.id  = await dbCarItem.insert(carItemTable, carItem.toMap());
    return carItem;
  }

  // Future<CarItem> create(CarItem caItem) async{
  //   final database = await instance.db;
  // }

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
    List listMap = await dbCarItem.rawQuery("SELECT * FROM $carItemTable");
    List<CarItem> listCarItem = [];
    for (Map m in listMap) {
      listCarItem.add(CarItem.fromMap(m));
    }

    return listCarItem;
  }

  //Future close() async => await _db!.close();

  Future close() async{
    final dbCarItem = await instance.db;

     dbCarItem.close();
  }
}

class CarItem {
  int? id;
  String? img;
  String? nameCar;
  String? nameModel;

  CarItem();

  CarItem.fromMap(Map map) {
    id = map[idColumn];
    img = map[imgColumn];
    nameCar = map[nameCarColumn];
    nameModel = map[nameModelColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      imgColumn: img,
      nameCarColumn: nameCar,
      nameModelColumn: nameModelColumn,
    };
    if (id != null) {
      data[idColumn] = id;
    }
    return data;
  }

  @override
  String toString() {
    return "CarItem(id: $id, img: $img, nameCar: $nameCar, nameModel: $nameModel)";
  }
}
