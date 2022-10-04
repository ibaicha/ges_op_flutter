import 'dart:convert';


class User {
  int? id;
  String token;
  String email;

  String password;
  String firstname;
  String lastname;


  User(
      // { this.id = 0, this.ide = 0,  this.token = '', this.email = '', this.password = '', this.firstname = '',this.lastname = ''});
      // { this.id, required this.ide,  required this.token , required this.email , required this.password, required this.firstname, required this.lastname});
    { this.id,  required this.token , required this.email , required this.password, required this.firstname, required this.lastname});
  // { this.id,  required this.token, required this.email });


  factory User.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    return User(
      id: json['data']['id'],
      token: json['token'],
      email: json['data']['email'],

      password: json['data']['password'],
      firstname: json['data']['firstname'],
      lastname: json['data']['lastname'],



    );
  }


  User.fromMap(Map<String, dynamic> obj)
      : id = obj['id'],
        token = obj['token'],
        email = obj['email'],

        password = obj['password'],
        firstname = obj['firstname'],
        lastname = obj['lastname'];



  Map<String, Object?> toMap() {
    return {
      'id': id,
      'token': token,
      'email': email,


      'password': password,
      'firstname': firstname,
      'lastname': lastname,



    };
  }


  void printAttributes() {
    print("id: $id\n");
    print("token: $token\n");
    print("email: $email\n");


    print("password: $password\n");
    print("firstname: $firstname\n");
    print("lastname: $lastname\n");



  }

}

