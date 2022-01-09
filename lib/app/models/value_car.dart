class ValueCar{
  double? value;

  ValueCar({this.value});

  ValueCar.fromJson(Map<String, dynamic> json){
    value = json['valor'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['valor'] = value;
    return data;
  }
}