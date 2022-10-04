import 'dart:convert';

List<Utilisateur> UtilisateurFromJson(String str) =>
    List<Utilisateur>.from(json.decode(str).map((x) => Utilisateur.fromJson(x)));

String UtilisateurToJson(List<Utilisateur> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Utilisateur {
  late int id;
  late String token;
  late String email;
  late String password;
  late String firstname;
  late String lastname;


  Utilisateur(
      { required this.id,
        required this.token ,
        required this.email ,
        required this.password,
        required this.firstname,
        required this.lastname});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'token': token,
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  factory Utilisateur.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    return Utilisateur(
      id: 0,
      token: json['token'],
      email: json['data']['email'],
      password: json['data']['password'],
      firstname: json['data']['firstname'],
      lastname: json['data']['lastname'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
    "email": email,
    "password": password,
    "firstname": firstname,
    "lastname": lastname,
  };

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur (
      id: json["id"],
      token: json["token"],
      email: json["email"],
      password: json["password"],
      firstname: json["firstname"],
      lastname: json["lastname"],
    );
  }



  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      id: map['id'],
      token: map['token'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
    );
  }


  void printAttributes() {
    print("id: $id\n");
    print("token: $token\n");
    print("email: $email\n");
    print("password: $password\n");
    print("firstname: $firstname\n");
    print("lastname: $lastname\n");

  }

  @override
  String toString() =>
      'Utilisateur(id: $id,token: $token, email: $email, password: $password, firstname: $firstname, lastname: $lastname)';
}