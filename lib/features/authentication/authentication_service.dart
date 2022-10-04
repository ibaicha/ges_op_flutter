import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../features.dart';
import '../../models/models.dart';

import 'dart:async';

import '../../objectbox.g.dart';

abstract class AuthenticationService extends GetxService {
  Future<User?> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  final ApiService apiService = ApiService();

  @override
  Future<User?> getCurrentUser() async {
    // simulated delay
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(
      String username, String password) async {
    ApiConstants.nameDB = makeDb(username).toString();

    var dir = await getApplicationDocumentsDirectory();
    final objBoxDirectory = Directory(
        // appDirectory.path + '/objectbox/' + ApiConstants.nameDB);
        dir.path + '/' + ApiConstants.nameDB + '/');

    // objBoxDirectory.delete(recursive: true);
    // apiService.getRecordsObjectBox();
    /*
    User user = User(
      id: 0,
      token: '',
      email: username,
      password: password,
      firstname: '',
      lastname: '',
    );
    return user;
     */

    final isExists = await objBoxDirectory.exists();

    if (isExists) {
      print("DBObject ===??? " + isExists.toString());
      // objBoxDirectory.delete(recursive: true);
      /*
        Box<ExploitationChargeExploitationObject>? exploitationChargeExploitationBox  = ObjectBox.exploitationChargeExploitationBox;
        exploitationChargeExploitationBox!.removeAll();

        Box<ChargeExploitationObject>? chargeExploitationBox  = ObjectBox.chargeExploitationsBox;
        chargeExploitationBox!.removeAll();

*/

      await ObjectBox.create();
      // apiService.getRecordsObjectBox();
      // objectbox.store.close();

      final userBox = ObjectBox.userObject;
      final query = userBox
          ?.query(UserObject_.email
              .equals(username)
              .and(UserObject_.password.equals(password)))
          .build();

      if (query!.count() > 0) {
        final monUser = query.find().first;

        User user = User(
          id: monUser.id,
          token: '',
          email: monUser.email,
          password: password,
          firstname: monUser.firstname,
          lastname: monUser.lastname,
        );

        ApiConstants.utilisateurObject = UserObject(
          id: monUser.id,
          token: '',
          password: password,
          email: username,
          firstname: monUser.firstname,
          lastname: monUser.lastname,
          profil_id: monUser.profil_id,
          profil_name: monUser.profil_name,
          producteur_id: monUser.producteur_id,
          producteur_prenom: monUser.producteur_prenom,
          producteur_nom: monUser.producteur_nom,
          producteur_cni: monUser.producteur_cni,
          op_id: monUser.op_id,
          op_name: monUser.op_name,
          sous_zone_id: monUser.sous_zone_id,
          sous_zone_name: monUser.sous_zone_name,
          zone_id: monUser.zone_id,
          zone_name: monUser.zone_name,
        );
        return user;
      } else {
        throw AuthenticationException(message: 'Wrong username or password');
      }
    } else {
      print("DBObject ===??? " + isExists.toString());

      /*********************** VOIR SI CONNECTIVITY *********************/
      await Future.delayed(const Duration(seconds: 2));
      var body = jsonEncode({'username': username, 'password': password});
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200) {
        var logger = User.fromReqBody(response.body);
        print(logger);
        ApiConstants.utilisateur.id = logger.id!;
        ApiConstants.utilisateur.token = logger.token;
        ApiConstants.utilisateur.email = logger.email;
        ApiConstants.utilisateur.password = password;
        ApiConstants.utilisateur.firstname = logger.firstname;
        ApiConstants.utilisateur.lastname = logger.lastname;
        ApiConstants.isRecentlyCreatedDB = true;

        ApiConstants.idUser = ApiConstants.utilisateur.id;

        var urle = Uri.parse(ApiConstants.baseUrl + ApiConstants.specificuser);
        final rese = await http.get(urle, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.token}',
        });

// if (response.statusCode == 200) {
        // print('------- url --------------------: ${urle}');
        List jsonResponsee = json.decode(rese.body);
        print('------- jsonResponsee --------------------: ${jsonResponsee}');
        // List<UserObject> data = jsonResponsee.map((e) => UserObject.fromJson(e)).toList();

        ApiConstants.utilisateurObject = UserObject(
          id: jsonResponsee[0]['id'],
          token: '',
          password: password,
          email: username,
          firstname: jsonResponsee[0]['firstName'].toString(),
          lastname: jsonResponsee[0]['lastName'].toString(),
          profil_id: jsonResponsee[0]['profil_id'] == null
              ? 0
              : jsonResponsee[0]['profil_id'],
          profil_name: jsonResponsee[0]['profil_name'] == null
              ? ''
              : jsonResponsee[0]['profil_name'],
          producteur_id: jsonResponsee[0]['producteur_id'] == null
              ? 0
              : jsonResponsee[0]['producteur_id'],
          producteur_prenom: jsonResponsee[0]['producteur_prenom'] == null
              ? ''
              : jsonResponsee[0]['producteur_prenom'],
          producteur_nom: jsonResponsee[0]['producteur_nom'] == null
              ? ''
              : jsonResponsee[0]['producteur_nom'],
          producteur_cni: jsonResponsee[0]['producteur_cni'] == null
              ? ''
              : jsonResponsee[0]['producteur_cni'],
          op_id:
              jsonResponsee[0]['op_id'] == null ? 0 : jsonResponsee[0]['op_id'],
          op_name: jsonResponsee[0]['op_name'] == null
              ? ''
              : jsonResponsee[0]['op_name'],
          sous_zone_id: jsonResponsee[0]['sous_zone_id'] == null
              ? 0
              : jsonResponsee[0]['sous_zone_id'],
          sous_zone_name: jsonResponsee[0]['sous_zone_name'] == null
              ? ''
              : jsonResponsee[0]['sous_zone_name'],
          zone_id: jsonResponsee[0]['zone_id'] == null
              ? 0
              : jsonResponsee[0]['zone_id'],
          zone_name: jsonResponsee[0]['zone_name'] == null
              ? ''
              : jsonResponsee[0]['zone_name'],
        );

        print(
            ' ------- jsonResponsee[0][firstname] -------: ${jsonResponsee[0]['firstName']}');
        print(
            ' ------- jsonResponsee[0][profil_id] -------: ${jsonResponsee[0]['profil_id']}');

        /*
        ApiConstants.utilisateurObject.id = jsonResponsee[0]['id'];
        ApiConstants.utilisateurObject.token= '';
        ApiConstants.utilisateurObject. password= password;
        ApiConstants.utilisateurObject.email= username;
        ApiConstants.utilisateurObject.firstname= jsonResponsee[0]['firstName'];
        ApiConstants.utilisateurObject.lastname= jsonResponsee[0]['lastName'].toString();
        ApiConstants.utilisateurObject.profil_id= jsonResponsee[0]['profil_id'] == null  ? 0 : jsonResponsee[0]['profil_id'];
        ApiConstants.utilisateurObject.profil_name= jsonResponsee[0]['profil_name']== null   ? '' : jsonResponsee[0]['profil_name'];
        ApiConstants.utilisateurObject. producteur_id= jsonResponsee[0]['producteur_id']== null   ? 0 : jsonResponsee[0]['producteur_id'];
        ApiConstants.utilisateurObject.producteur_prenom= jsonResponsee[0]['producteur_prenom']== null   ? '' : jsonResponsee[0]['producteur_prenom'];
        ApiConstants.utilisateurObject.producteur_nom= jsonResponsee[0]['producteur_nom']== null   ? '' : jsonResponsee[0]['producteur_nom'];
        ApiConstants.utilisateurObject.producteur_cni= jsonResponsee[0]['producteur_cni']== null   ? '' : jsonResponsee[0]['producteur_cni'];
        ApiConstants.utilisateurObject.op_id= jsonResponsee[0]['op_id']== null   ? 0 : jsonResponsee[0]['op_id'];
        ApiConstants.utilisateurObject.op_name= jsonResponsee[0]['op_name']== null   ? '' : jsonResponsee[0]['op_name'];
        ApiConstants.utilisateurObject.sous_zone_id= jsonResponsee[0]['sous_zone_id']== null  ? 0 : jsonResponsee[0]['sous_zone_id'];
        ApiConstants.utilisateurObject.sous_zone_name= jsonResponsee[0]['sous_zone_name']== null  ? '' : jsonResponsee[0]['sous_zone_name'];
        ApiConstants.utilisateurObject.zone_id= jsonResponsee[0]['zone_id']== null   ? 0 : jsonResponsee[0]['zone_id'];
        ApiConstants.utilisateurObject.zone_name= jsonResponsee[0]['zone_name']== null  ? '' : jsonResponsee[0]['zone_name'];

         */

        print(
            '------- ApiConstants.utilisateurObject -----: ${ApiConstants.utilisateurObject.lastname} '
            ' ${ApiConstants.utilisateurObject.profil_name}');

        // }

        User user = User(
          id: logger.id,
          token: logger.token,
          email: logger.email,
          password: password,
          firstname: logger.firstname,
          lastname: logger.lastname,
        );

        await ObjectBox.create();
        apiService.getRecordsObjectBox();
        // print('producteurIdList: ' + ApiConstants.producteurIdList.length.toString());

        //  objectbox.store.close();
        return user;
      } else {
        throw AuthenticationException(message: 'Wrong username or password');
      }
    }
  }

  @override
  Future<void> signOut() async {}
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
