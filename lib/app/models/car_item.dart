final String carItemTable = 'carItemTable';
final String idColumn = 'idColumn';
final String imgColumn = 'imgColumn';
final String nameCarColumn = 'nameCarColumn';
final String nameModelColumn = 'nameModelColumn';

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
      nameModelColumn: nameModel,
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
