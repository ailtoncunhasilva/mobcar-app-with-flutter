class ModelsCars {
  String? name;
  int? code;

  ModelsCars({this.name, this.code});

  ModelsCars.fromJson(Map<String, dynamic> json) {
    name = json['nome'];
    code = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = this.name;
    data['codigo'] = this.code;
    return data;
  }
}
