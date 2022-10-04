import 'dart:convert';


class Logger {
  late int id;
  late String token;
  late String email;
  late String password;
  late String firstname;
  late String lastname ;

  // Logger({ this.lastname = '', this.id = 0, this.token = '', this.email = '', this.password = '', this.firstname = ''});

  Logger(
      { required this.id,
        required this.token ,
        required this.email ,
        required this.password,
        required this.firstname,
        required this.lastname});

  factory Logger.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    return Logger(
      token: json['token'],
      id: json['data']['id'],
      email: json['data']['email'],
      password: json['data']['password'],
      firstname: json['data']['firstname'],
      lastname: json['data']['lastname'],
    );
  }
    void printAttributes() {
      print("token: $token\n");
      print("id: $id\n");
      print("email: $email\n");
      print("password: $password\n");
      print("firstname: $firstname\n");
      print("lastname: $lastname\n");

    }

}