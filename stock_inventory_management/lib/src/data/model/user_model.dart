import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  List<Datum> data;

  User({
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int? id; 
  String name;
  String email;
  String phone;
  String address;
  DateTime? createdAt; 
  DateTime? updatedAt; 

  Datum({
    this.id, 
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"], 
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
      );

  Map<String, dynamic> toJson() {
    final data = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
    };
    return data;
  }
}
