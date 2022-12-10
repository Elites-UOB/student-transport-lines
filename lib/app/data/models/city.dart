class CityModel {
  int id = 0;
  String name = '';

  CityModel({id, name});

  CityModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
