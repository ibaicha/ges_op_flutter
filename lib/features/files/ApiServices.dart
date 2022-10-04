import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../features.dart';
import '../../models/models.dart';

import 'package:http/http.dart' as http;
import '../files/Constants.dart';
import 'ObjectBoxHelper.dart';

class ApiService {
  Future<List<LoginModel>?> getLogin() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<LoginModel> model = loginModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<http.Response> login(String username, String password) async {
    var body = jsonEncode({'username': username, 'password': password});
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);

    http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    return response;
  }

  Future<List<SaisonObject>> getAllSaisons() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allsaisons);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<SaisonObject> model =
          jsonResponse.map((data) => SaisonObject.fromJson(data)).toList();
      // print(model);
      return model;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  getAllSaisonss() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allsaisons);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<SaisonObject> model =
          jsonResponse.map((data) => SaisonObject.fromJson(data)).toList();
      // print(model);
      List<SaisonObject> listSaison_ = [];
      return model;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<ChargeExploitationObject>> getAllChargeExploitations() async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.allchargeexploitations);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<ChargeExploitationObject> model = jsonResponse
          .map((data) => ChargeExploitationObject.fromJson(data))
          .toList();
      // print(model);
      return model;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  Future<List<FamilleChargeExploitationObject>>
      getAllFamillesChargeExploitation() async {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.allfamillechargeexploitation);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<FamilleChargeExploitationObject> model = jsonResponse
          .map((data) => FamilleChargeExploitationObject.fromJson(data))
          .toList();
      // print(model);
      return model;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<ExploitationObject>> getAllExploitations(String compte) async {
    final exploitationBox = ObjectBox.exploitationsBox;
    // List<ExploitationObject> mesExploitations = exploitationBox!.getAll();

    Query<ExploitationObject> query = exploitationBox!
        .query(ExploitationObject_.compte
            .contains(compte.toLowerCase())
            .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
            .or(ExploitationObject_.compte.contains(compte)))
        .build();
    List<ExploitationObject> mesExploitations = query.find();
    query.close();

    // List<ExploitationObject> model = mesExploitations.map((data) => ExploitationObjectFromJson.fromJson(data)).toList();
    /*
    mesExploitations = mesExploitations.where((object) =>
          object.compte!.toLowerCase().contains(compte.toLowerCase()))
          .toList();

     */

    return mesExploitations;
  }

  Future<List<ExploitationObject>> getAllExploitationsFilterss(
      String compte, String AnneeId, String VarieteId) async {
    final exploitationBox = ObjectBox.exploitationsBox;
    var qBuilder = null;
    if (AnneeId == '' && VarieteId == '') {
      qBuilder = exploitationBox!.query(ExploitationObject_.compte
          .contains(compte.toLowerCase())
          .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
          .or(ExploitationObject_.compte.contains(compte)));
    }
    ;
    if (AnneeId == '' && VarieteId != '') {
      qBuilder = exploitationBox!.query(ExploitationObject_.compte
          .contains(compte.toLowerCase())
          .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
          .or(ExploitationObject_.compte.contains(compte))
          .and(ExploitationObject_.annne_id.equals(int.parse(AnneeId))));
    }
    ;
    if (AnneeId != '' && VarieteId == '') {
      qBuilder = exploitationBox!.query(ExploitationObject_.compte
          .contains(compte.toLowerCase())
          .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
          .or(ExploitationObject_.compte.contains(compte))
          .and(ExploitationObject_.variete_id.equals(int.parse(VarieteId))));
    }
    ;
    if (AnneeId != '' && VarieteId != '') {
      qBuilder = exploitationBox!.query(ExploitationObject_.compte
          .contains(compte.toLowerCase())
          .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
          .or(ExploitationObject_.compte.contains(compte))
          .and(ExploitationObject_.variete_id.equals(int.parse(VarieteId)))
          .and(ExploitationObject_.annne_id.equals(int.parse(AnneeId))));
    }
    ;

    Query<ExploitationObject> query = qBuilder.build();
    List<ExploitationObject> mesExploitations = query.find();
    print('--- mesExploitations ---- ${mesExploitations}');
    query.close();

    return mesExploitations;
  }

  Future<List<ExploitationObject>> getAllExploitationsFilters(
      String compte, String AnneeId, String VarieteId) async {
    final exploitationBox = ObjectBox.exploitationsBox;
    List<ExploitationObject> mesExploitations = [];

    if (AnneeId.isEmpty && VarieteId.isEmpty) {
      Query<ExploitationObject> query = exploitationBox!
          .query(ExploitationObject_.compte
              .contains(compte.toLowerCase())
              .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
              .or(ExploitationObject_.compte.contains(compte)))
          .build();
      mesExploitations = query.find();
      print('--- mesExploitations AnneeId == '
          ' && VarieteId == '
          '  ---- ${mesExploitations}');
      query.close();
      // return mesExploitations;
    }
    if (AnneeId.isNotEmpty && VarieteId.isNotEmpty) {
      Query<ExploitationObject> query = exploitationBox!
          .query(ExploitationObject_.compte
              .contains(compte.toLowerCase())
              .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
              .or(ExploitationObject_.compte.contains(compte))
              .and(ExploitationObject_.variete_id.equals(int.parse(VarieteId)))
              .and(ExploitationObject_.annne_id.equals(int.parse(AnneeId))))
          .build();
      mesExploitations = query.find();
      print('--- mesExploitations AnneeId != '
          ' && VarieteId != '
          ' ---- ${mesExploitations}');
      query.close();
      // return mesExploitations;
    }
    if (AnneeId.isNotEmpty && VarieteId.isEmpty) {
      Query<ExploitationObject> query = exploitationBox!
          .query(ExploitationObject_.compte
              .contains(compte.toLowerCase())
              .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
              .or(ExploitationObject_.compte.contains(compte))
              .and(ExploitationObject_.annne_id.equals(int.parse(AnneeId))))
          .build();
      mesExploitations = query.find();
      print('--- mesExploitations ---- AnneeId != '
          ' && VarieteId == '
          ' ${mesExploitations}');
      query.close();
      // return mesExploitations;
    }
    if (AnneeId.isEmpty && VarieteId.isNotEmpty) {
      Query<ExploitationObject> query = exploitationBox!
          .query(ExploitationObject_.compte
              .contains(compte.toLowerCase())
              .or(ExploitationObject_.compte.contains(compte.toUpperCase()))
              .or(ExploitationObject_.compte.contains(compte))
              .and(ExploitationObject_.variete_id.equals(int.parse(VarieteId))))
          .build();
      mesExploitations = query.find();
      print('--- mesExploitations ---- AnneeId == '
          ' && VarieteId == '
          ' ${mesExploitations}');
      query.close();
      // return mesExploitations;
    }
    return mesExploitations;
  }

  Future<List<ExploitationObject>> getAllExploitationss(String compte) async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.allExploitationsEndpoint);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<ExploitationObject> model = jsonResponse
          .map((data) => ExploitationObject.fromJson(data))
          .toList();
      model = model
          .where((user) =>
              user.compte.toLowerCase().contains(compte.toLowerCase()))
          .toList();
      // print(model);
      return model;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<ChargeExploitationObject>> getAllChargeExploitationsx() async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.allchargeexploitations);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<ChargeExploitationObject> model = jsonResponse
          .map((data) => ChargeExploitationObject.fromJson(data))
          .toList();
      // print(model);
      return model;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<VarieteObject>> getAllVarietes() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allvarietes);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => VarieteObject.fromJson(data)).toList();
      // print(model);
      // return model;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  void getRecordsObjectBox() async {
    final userBox = ObjectBox.userObject;
    var mesUsers = userBox?.getAll();
    print('------------------- LISTES DES USERS --------------------');
    mesUsers?.forEach((element) {
      print(
          'ObjectBox ---id: ${element.id} --email: ${element.email} -- firstname: ${element.firstname} --lastname: ${element.lastname}  --password: ${element.password}');
    });

    final producteurBox = ObjectBox.producteurBox;
    var mesProducteurs = producteurBox?.getAll();
    print('------------------- LISTES DES PRODUCTEURS --------------------');
    mesProducteurs?.forEach((element_producteur) {
      print(
          'PRODUCTEURS N°: ${element_producteur.id} --email: ${element_producteur.email} -- prenom: ${element_producteur.prenom}-${element_producteur.nom}');

      final exploitationBox = ObjectBox.exploitationsBox;
      var mesExploitations = exploitationBox?.getAll();
      mesExploitations?.forEach((element_exploitation) {
        if (element_producteur.id == element_exploitation.producteur_id) {
          print(
              '----> EXPLOITATION N°: ${element_exploitation.id} - ${element_exploitation.exploitation_id} - ${element_exploitation.compte} - ${element_exploitation.unite} - ${element_exploitation.pu} - ${element_exploitation.produit_id} - ${element_exploitation.produit_name} - ${element_exploitation.superficie} - ${element_exploitation.production} ');

          final exploitationChargeExploitationBox =
              ObjectBox.exploitationChargeExploitationBox;
          var mesExploitationChargeExploitationBox =
              exploitationChargeExploitationBox?.getAll();
          mesExploitationChargeExploitationBox?.forEach((element_ece) {
            if (element_exploitation.exploitation_id ==
                element_ece.exploitation_id) {
              print(
                  '------> ECE N°: ${element_ece.id}  - ${element_ece.exploitation_id}- ${element_ece.date} - ${element_ece.valeur} - ${element_ece.pu} - ${element_ece.quantite} - ${element_ece.charge_exploitation_id} - ${element_ece.charge_exploitation_name}');
            }
          });
        }
      });
    });

/*
    print('------------------- LISTES DES EXPLOITATIONS --------------------');
    final exploitationBox  = ObjectBox.exploitationsBox;
    var mesExploitations = exploitationBox?.getAll();
    mesExploitations?.forEach((element) {
      print( 'ObjectBox - ${element.id} - ${element.exploitation_id} - ${element.compte} - ${element.unite} - ${element.pu} - ${element.produit_id} - ${element.produit_name} - ${element.superficie} - ${element.production} ' );
    });
*/

    final saisonBox = ObjectBox.saisonsBox;
    var mesSaisons = saisonBox?.getAll();
    print('------------------- LISTES DES SAISONS --------------------');
    mesSaisons?.forEach((element) {
      print(
          'ObjectBox ----------- ${element.id} --------  ${element.name} ---------- ${element.description}');
    });

    print('------------------- LISTES DES ANNEES --------------------');
    final anneeBox = ObjectBox.anneesBox;
    var mesAnnees = anneeBox?.getAll();
    mesAnnees?.forEach((element) {
      print(
          'ObjectBox ----------- ${element.id} --------  ${element.name} ---------- ${element.valeur}');
    });

    print('------------------- LISTES DES VARIETE --------------------');
    final varieteBox = ObjectBox.varietesBox;
    var mesVarietes = varieteBox?.getAll();
    mesVarietes?.forEach((element) {
      print('ObjectBox ----------- ${element.id} --------  ${element.name}');
    });

    print(
        '------------------- LISTES DES TYPE EXPLOITATIONS --------------------');
    final typeChargeExploitationBox = ObjectBox.typeChargeExploitationsBox;
    var mesTypeChargeExploitations = typeChargeExploitationBox?.getAll();
    mesTypeChargeExploitations?.forEach((element) {
      print('ObjectBox ----------- ${element.id} --------  ${element.name} ');
    });

    print('------------------- LISTES DES TYPE OP --------------------');
    final typeOpBox = ObjectBox.typeOpsBox;
    var mesTypeOps = typeOpBox?.getAll();
    mesTypeOps?.forEach((element) {
      print('ObjectBox ----------- ${element.id} --------  ${element.name} ');
    });

    print('------------------- LISTES OP --------------------');
    final opBox = ObjectBox.opsBox;
    var mesOps = opBox?.getAll();
    mesOps?.forEach((element) {
      print('ObjectBox ----------- ${element.id} --------  ${element.name} ');
    });

    print(
        '------------------- LISTES DES FAMILLES EXPLOITATIONS --------------------');
    final familleExploitationBox = ObjectBox.familleChargeExploitationsBox;
    var mesFamilleExploitations = familleExploitationBox?.getAll();
    mesFamilleExploitations?.forEach((element) {
      print('ObjectBox ----------- ${element.id} --------  ${element.name}');
    });

    print(
        '------------------- LISTES DES CHARGES EXPLOITATIONS --------------------');
    final chargeExploitationBox = ObjectBox.chargeExploitationsBox;
    var mesChargeExploitations = chargeExploitationBox?.getAll();
    mesChargeExploitations?.forEach((element) {
      print(
          'ObjectBox - ${element.id} - ${element.name} - ${element.unite} - ${element.pu}  - ${element.quantite_unite_superficie} - ${element.produit_id} - ${element.produit_name} - ${element.famille_charge_exploitation_id} - ${element.famille_charge_exploitation_name}- ${element.type_charge_exploitation_id} - ${element.type_charge_exploitation_name} - ${element.isAchat}');
    });

    /*

    print('------------------- LISTES DES EXPLOITATION CHARGES EXPLOITATIONS --------------------');
    final exploitationChargeExploitationBox  = ObjectBox.exploitationChargeExploitationBox;
    var mesExploitationChargeExploitationBox = exploitationChargeExploitationBox?.getAll();
    mesExploitationChargeExploitationBox?.forEach((element) {
      print( 'ECE - ${element.exploitation_id} ---  ${element.id} - ${element.date} - ${element.valeur} - ${element.pu} - ${element.quantite} - ${element.charge_exploitation_id} - ${element.charge_exploitation_name}' );
    });

     */
  }
}
