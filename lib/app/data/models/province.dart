class Province {
  int? id;
  String? name;
  Province({this.id, this.name});
  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(id: json['id'], name: json['name']);
  }
}
