import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) =>
    List<LoginModel>.from(json.decode(str).map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginModel {
  LoginModel({
    required this.token,
    required this.data,
  });

  String token;
  Data data;


  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
  });

  int id;
  String email;
  String password;
  String firstname;
  String lastname;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "firstname": firstname,
    "lastname": lastname,
  };
}
