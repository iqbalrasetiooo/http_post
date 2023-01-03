class UserModel {
  String? name;
  int? age;
  String? id;

  UserModel({this.name, this.age, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['id'] = this.id;
    return data;
  }
}
