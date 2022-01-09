class BrandsCars{

  String? name;
  String? code;

  BrandsCars({this.name, this.code});

  BrandsCars.fromJson(Map<String, dynamic> json){
    name = json['nome'];
    code = json['codigo'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = this.name;
    data['codigo'] = this.code;
    return data;
  }
}