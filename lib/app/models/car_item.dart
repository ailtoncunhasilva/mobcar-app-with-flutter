final String carItemTable = 'carItemTable';
final String idColumn = 'idColumn';
final String imgColumn = 'imgColumn';
final String nameCarColumn = 'nameCarColumn';
final String nameModelColumn = 'nameModelColumn';
final String yearColumn = 'yearColumn';
final String valueColumn = 'valueColumn';

class CarItem {
  int? id;
  String? img;
  String? nameCar;
  String? nameModel;
  String? year;
  String? value;

  CarItem();

  CarItem.fromMap(Map map) {
    id = map[idColumn];
    img = map[imgColumn];
    nameCar = map[nameCarColumn];
    nameModel = map[nameModelColumn];
    year = map[yearColumn];
    value = map[valueColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      imgColumn: img,
      nameCarColumn: nameCar,
      nameModelColumn: nameModel,
      yearColumn: year,
      valueColumn: value,
    };
    if (id != null) {
      data[idColumn] = id;
    }
    return data;
  }

  @override
  String toString() {
    return "CarItem(id: $id, img: $img, nameCar: $nameCar, nameModel: $nameModel, year: $year, value: $value)";
  }
}
