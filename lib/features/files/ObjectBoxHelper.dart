import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:objectbox/objectbox.dart';

import '../files/Constants.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/models.dart';
import '../features.dart';

final ApiService apiService = ApiService();

class ObjectBox {
  /// The Store of this app.

  late final Store store;
  static Box<SaisonObject>? saisonsBox;
  static Box<AnneeObject>? anneesBox;
  static Box<VarieteObject>? varietesBox;
  static Box<TypeChargeExploitationObject>? typeChargeExploitationsBox;
  static Box<TypeOpObject>? typeOpsBox;
  static Box<OpObject>? opsBox;
  static Box<FamilleChargeExploitationObject>? familleChargeExploitationsBox;
  static Box<ChargeExploitationObject>? chargeExploitationsBox;
  static Box<ExploitationChargeExploitationObject>?
      exploitationChargeExploitationBox;
  static Box<ExploitationObject>? exploitationsBox;
  static Box<UserObject>? userObject;
  static Box<ProducteurObject>? producteurBox;

  ObjectBox._create(this.store) {
    userObject = Box<UserObject>(store);
    producteurBox = Box<ProducteurObject>(store);
    saisonsBox = Box<SaisonObject>(store);
    anneesBox = Box<AnneeObject>(store);
    varietesBox = Box<VarieteObject>(store);
    typeOpsBox = Box<TypeOpObject>(store);
    opsBox = Box<OpObject>(store);
    typeChargeExploitationsBox = Box<TypeChargeExploitationObject>(store);
    familleChargeExploitationsBox = Box<FamilleChargeExploitationObject>(store);
    chargeExploitationsBox = Box<ChargeExploitationObject>(store);
    exploitationsBox = Box<ExploitationObject>(store);
    exploitationChargeExploitationBox =
        Box<ExploitationChargeExploitationObject>(store);

    /*********************** VOIR SI CONNECTIVITY *********************/
    getUserData(); //
    if (!userObject!.isEmpty()) {
      // getProducteurData();
      getSaisonData(); //
      getAnneeData(); //
      getVarieteData(); //
      getTypeChargeExploitationData(); //
      getTypeOpData(); //
      getOpData(); //
      getFamilleExploitationData(); //
      getChargeExploitationData(); //
      // getExploitationData(); //
      // getExploitationChargeExploitationData();
    } //
    /*********************** VOIR SI CONNECTIVITY *********************/
    for (int i = 0; i < ApiConstants.producteurIdList.length; i++) {
      print('item --- : ' + ApiConstants.producteurIdList[i].toString());
    }
  }

  static getUserData() async {
    try {
      final userBox = ObjectBox.userObject;
      if (userBox!.isEmpty()) {
        print(' ------ApiConstants.utilisateurObject.lastname--------' +
            ApiConstants.utilisateurObject.lastname);
        userBox.put(ApiConstants.utilisateurObject);

        UserObject objectAdmin = UserObject(
          id: 0,
          token: '',
          email: 'admin',
          password: 'password',
          firstname: 'adminFirstName',
          lastname: 'adminLastName',
          profil_id: 0,
          profil_name: '',
          producteur_id: 0,
          producteur_prenom: '',
          producteur_nom: '',
          producteur_cni: '',
          op_id: 0,
          op_name: '',
          sous_zone_id: 0,
          sous_zone_name: '',
          zone_id: 0,
          zone_name: '',
        );
        userBox.put(objectAdmin);
      }

      return true;
    } catch (e) {
      print('Info erreur userBox e: ${e}');
      return false;
    }
  }

  static getSaisonData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allsaisons);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<SaisonObject> data =
          jsonResponse.map((e) => SaisonObject.fromJson(e)).toList();
      await writeBoxSaison(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getAnneeData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allannees);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<Annee> data = jsonResponse.map((e) => Annee.fromJson(e)).toList();
      await writeBoxAnnee(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getVarieteData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allvarietes);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<VarieteObject> data =
          jsonResponse.map((e) => VarieteObject.fromJson(e)).toList();
      // print('---------------------------------------------- Info data Variete: ${data}');
      await writeBoxVarieteObject(data);
      return true;
    } catch (e) {
      print('--Error varieteLoad -- ${e}');
      return false;
    }
  }

  static getTypeChargeExploitationData() async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.alltypechargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<TypeChargeExploitation> data =
          jsonResponse.map((e) => TypeChargeExploitation.fromJson(e)).toList();
      await writeBoxTypeChargeExploitationObject(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getTypeOpData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.alltypeops);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<TypeOpObject> data =
          jsonResponse.map((e) => TypeOpObject.fromJson(e)).toList();
      await writeBoxTypeOpObject(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getFamilleExploitationData() async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.allfamillechargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });
      List jsonResponse = json.decode(res.body);
      List<FamilleChargeExploitationObject> data = jsonResponse
          .map((e) => FamilleChargeExploitationObject.fromJson(e))
          .toList();
      await writeBoxFamilleChargeExploitationObject(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getChargeExploitationData() async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.allchargeexploitations);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });
      List jsonResponse = json.decode(res.body);
      List<ChargeExploitationObject> data = jsonResponse
          .map((e) => ChargeExploitationObject.fromJson(e))
          .toList();
      // print('Info getChargeExploitationData: ${data} --  ${data.length}');
      await writeBoxChargeExploitationObject(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getExploitationData(int IdProducteur) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.allProducteurExploitations +
          IdProducteur.toString());
      print('Info url: ${url}');
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationObject> data =
          jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();
      // print('Info data: ${IdProducteur} --  ${data.length}');
      await writeBoxExploitationObject(data);
      return true;
    } catch (e) {
      print('Info e: ${e}');
      return false;
    }
  }

  static getOpData() async {
    try {
      ApiConstants.idOp = ApiConstants.utilisateurObject.op_id!;
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.specificop);
      print('Info url: ${url}');
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<OpObject> data =
          jsonResponse.map((e) => OpObject.fromJson(e)).toList();
      print('Info data op:  --  ${data.length}');
      await writeBoxOpObject(data);
      return true;
    } catch (e) {
      print('Info e: ${e}');
      return false;
    }
  }

  static getArrayProducteursExploitationData(List<int> ListInt) async {
    try {
      print('ListInt.length --- :  ${ListInt.length.toString()}');
      for (int i = 0; i < ListInt.length; i++) {
        // print('item --- : ' + ApiConstants.producteurIdList[i].toString());

        var url = Uri.parse(ApiConstants.baseUrl +
            ApiConstants.allProducteurExploitations +
            ListInt[i].toString());
        print('Info url ${ListInt[i].toString()}: ${url}');
        final res = await http.get(url, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.token}',
        });

        List jsonResponse = json.decode(res.body);
        List<ExploitationObject> data =
            jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();

        print('ExploitationObject data.length: ${data.length}');
        for (ExploitationObject item in data) {
          print('ExploitationObject ${item.id}: ${item.compte}');
        }
        await writeBoxExploitationObject(data);
      }

      // await writeBoxExploitationObject(data);
      return true;
    } catch (e) {
      print('Info e: ${e}');
      return false;
    }
  }

  static getArrayProducteurExploitationData() async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.arrayproducteurexploitations);
      print('Info url: ${url}');
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationObject> data =
          jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();

      print('ExploitationObject data.length: ${data.length}');
      for (ExploitationObject item in data) {
        print('ExploitationObject ${item.id}: ${item.compte}');
      }

      // await writeBoxExploitationObject(data);
      return true;
    } catch (e) {
      print('Info e: ${e}');
      return false;
    }
  }

  static getExploitationChargeExploitationData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.allexploitationschargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationChargeExploitationObject> data = jsonResponse
          .map((e) => ExploitationChargeExploitationObject.fromJson(e))
          .toList();
      print('Info data ECE: ${data}');
      await writeBoxExploitationChargeExploitationObject(data);
      for (ExploitationChargeExploitationObject item in data) {
        print(
            '--- ECE ----   ${item.id.toString()} ------ ${item.unite.toString()} -- ${item.quantite.toString()} ');
      }
      return true;
    } catch (e) {
      print('Error data ECE: ${e}');
      return false;
    }
  }

  static getArrayExploitationChargeExploitationData(List<int> ListInt) async {
    try {
      print('ListInt.length --- :  ${ListInt.length.toString()}');
      for (int i = 0; i < ListInt.length; i++) {
        var url = Uri.parse(ApiConstants.baseUrl +
            ApiConstants.allExploitationschargeexploitation +
            ListInt[i].toString());
        print('Info url ${ListInt[i].toString()}: ${url}');
        final res = await http.get(url, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.token}',
        });

        List jsonResponse = json.decode(res.body);
        List<ExploitationChargeExploitationObject> data = jsonResponse
            .map((e) => ExploitationChargeExploitationObject.fromJson(e))
            .toList();

        print(
            'ExploitationChargeExploitationObject data.length: ${data.length}');
        for (ExploitationChargeExploitationObject item in data) {
          print(
              'ExploitationChargeExploitationObject ${item.id}: ${item.charge_exploitation_name}');
        }
        await writeBoxExploitationChargeExploitationObject(data);
      }

      // await writeBoxExploitationObject(data);
      return true;
    } catch (e) {
      print('Info e: ${e}');
      return false;
    }
  }

  static getProducteurData() async {
    try {
      var url;
      if (ApiConstants.utilisateurObject.profil_name == 'Op') {
        ApiConstants.idOp = ApiConstants.utilisateurObject.op_id!;
        url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allproducteursOp);
      }

      if (ApiConstants.utilisateurObject.profil_name == 'Producteur') {
        ApiConstants.idProducteur =
            ApiConstants.utilisateurObject.producteur_id!;
        url = Uri.parse(ApiConstants.baseUrl + ApiConstants.oneproducteur);
      }

      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<ProducteurObject> data =
          jsonResponse.map((e) => ProducteurObject.fromJson(e)).toList();
      // print('Info data: ${data}');
      await writeBoxProducteurObject(data);
      return true;
    } catch (e) {
      print('Info e: ${e}');
      return false;
    }
  }

  static Future<bool> writeBoxSaison(List<SaisonObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (saisonsBox!.isEmpty()) {
        print('------------------- SAISONS LODING----------------------');
        for (SaisonObject item in data) {
          print(
              '${item.id.toString()}  ------  ${item.name.toString()}  ----- ${item.description.toString()}');
          SaisonObject saisonObject = SaisonObject(
              id: 0, name: item.name, description: item.description);
          saisonsBox!.put(saisonObject);
        }
      } else {
        print('------------------- SAISONS LODED----------------------');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxAnnee(List<Annee> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (anneesBox!.isEmpty()) {
        print('------------------- ANNEES LODING----------------------');
        for (Annee item in data) {
          print(
              '${item.id.toString()}  ------  ${item.name.toString()}  ----- ${item.valeur.toString()}');
          AnneeObject anneeObject =
              AnneeObject(id: item.id, valeur: item.valeur, name: item.name);
          anneesBox!.put(anneeObject);
        }
      } else {
        print('------------------- ANNEES LODED----------------------');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxTypeChargeExploitationObject(
      List<TypeChargeExploitation> data) async {
    //await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (typeChargeExploitationsBox!.isEmpty()) {
        print(
            '------------------- TYPE CHARGES EXPLOITATION LODING ----------------------');
        for (TypeChargeExploitation item in data) {
          print('${item.id.toString()}  ------  ${item.name.toString()} ');
          TypeChargeExploitationObject object =
              TypeChargeExploitationObject(id: item.id, name: item.name);
          typeChargeExploitationsBox!.put(object);
        }
      } else {
        print(
            '------------------- TYPE CHARGES EXPLOITATION LODED ----------------------');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxTypeOpObject(List<TypeOpObject> data) async {
    try {
      if (typeOpsBox!.isEmpty()) {
        print(
            '------------------- TYPE CHARGES EXPLOITATION LODING ----------------------');
        for (TypeOpObject item in data) {
          print('${item.id.toString()}  ------  ${item.name.toString()} ');
          TypeOpObject object = TypeOpObject(id: item.id, name: item.name);
          typeOpsBox!.put(object);
        }
      } else {
        print('------------------- TYPE OPS LODED ----------------------');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxFamilleChargeExploitationObject(
      List<FamilleChargeExploitationObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (familleChargeExploitationsBox!.isEmpty()) {
        print(
            '-------------------FAMILLE CHARGES EXPLOITATION LODING----------------------');
        for (FamilleChargeExploitationObject item in data) {
          print('${item.id.toString()}  ------  ${item.name.toString()} ');
          FamilleChargeExploitationObject object =
              FamilleChargeExploitationObject(id: item.id, name: item.name);
          familleChargeExploitationsBox!.put(object);
        }
      } else {
        print(
            '-------------------FAMILLE CHARGES EXPLOITATION LODED----------------------');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxChargeExploitationObject(
      List<ChargeExploitationObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (chargeExploitationsBox!.isEmpty()) {
        print(
            '------------------- CHARGES EXPLOITATION LODING----------------------');
        for (ChargeExploitationObject item in data) {
          print('${item.id.toString()}  ------  ${item.name.toString()} ');
          ChargeExploitationObject object = ChargeExploitationObject(
              id: item.id,
              name: item.name,
              unite: item.unite,
              pu: double.parse(item.pu.toString()),
              quantite_unite_superficie:
                  double.parse(item.quantite_unite_superficie.toString()),
              produit_id: int.parse(item.produit_id.toString()),
              produit_name: item.produit_name,
              famille_charge_exploitation_id:
                  int.parse(item.famille_charge_exploitation_id.toString()),
              famille_charge_exploitation_name:
                  item.famille_charge_exploitation_name,
              type_charge_exploitation_id:
                  int.parse(item.type_charge_exploitation_id.toString()),
              type_charge_exploitation_name: item.type_charge_exploitation_name,
              isAchat: item.isAchat.toString() == 'true' ? true : false);
          chargeExploitationsBox!.put(object);
        }
      } else {
        print(
            '------------------- CHARGES EXPLOITATION LODED----------------------');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxExploitationObject(
      List<ExploitationObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      // if(exploitationsBox!.isEmpty()) {
      ApiConstants.exploitationIdList = [];
      for (ExploitationObject item in data) {
        print(
            ' EXPLOITATION: ${item.exploitation_id.toString()} --- ${item.compte.toString()} ');
        ExploitationObject object = ExploitationObject(
          id: 0,
          producteur_id: item.producteur_id,
          prenom: item.prenom,
          nom: item.nom,
          cni: item.cni,
          email: item.email,
          is_actif: false,
          op_id: item.op_id,
          op_name: item.op_name,
          type_op_id: item.type_op_id,
          type_op_name: item.type_op_name,
          exploitation_id: item.exploitation_id,
          compte: item.compte,
          unite: item.unite,
          superficie_prevision:
              double.parse(item.superficie_prevision.toString()),
          production_prevision:
              double.parse(item.production_prevision.toString()),
          pu_prevision: double.parse(item.pu_prevision.toString()),
          filiere_prevision_id: int.parse(item.filiere_prevision_id.toString()),
          filiere_prevision_name: item.filiere_prevision_name,
          produit_prevision_id: int.parse(item.produit_prevision_id.toString()),
          produit_prevision_name: item.produit_prevision_name,
          variete_prevision_id: int.parse(item.variete_prevision_id.toString()),
          variete_prevision_name: item.variete_prevision_name,
          superficie: double.parse(item.superficie.toString()),
          production: double.parse(item.production.toString()),
          pu: double.parse(item.pu.toString()),
          filiere_id: int.parse(item.filiere_id.toString()),
          filiere_name: item.filiere_name,
          produit_id: int.parse(item.produit_id.toString()),
          produit_name: item.produit_name,
          variete_id: int.parse(item.variete_id.toString()),
          variete_name: item.variete_name,
          saison_id: int.parse(item.saison_id.toString()),
          saison_name: item.saison_name,
          annne_id: int.parse(item.annne_id.toString()),
          annee_name: item.annee_name,
        );

        exploitationsBox!.put(object);
        ApiConstants.exploitationIdList.add(item.id);
      }

      for (int i = 0; i < ApiConstants.exploitationIdList.length; i++) {
        print('item  ece xxxxxxxxxxxx --- : ' +
            ApiConstants.exploitationIdList[i].toString());
      }

      getArrayExploitationChargeExploitationData(
          ApiConstants.exploitationIdList);
      /*
      }else {
        print('------------------- EXPLOITATIONS LODED----------------------');
      }

         */
      return true;
    } catch (e) {
      print(' ---Error------- ${e}');
      return false;
    }
  }

  static Future<bool> writeBoxOpObject(List<OpObject> data) async {
    try {
      /*
      print(' --- DATA NAME : ${data.first.name}');
      print(' --- DATA EMAIL : ${data.first.email}');
      print(' --- DATA telephone : ${data.first.telephone}');
      print(' --- DATA adresse : ${data.first.adresse}');
      print(' --- DATA is_actif : ${data.first.is_actif}');
      print(' --- DATA type_op_id : ${int.parse(data.first.type_op_id.toString())}');
      print(' --- DATA type_op_name : ${data.first.type_op_name}');
      print(' --- DATA localite_id : ${data.first.localite_id.toString()}');
      print(' --- DATA localite_name : ${data.first.localite_name}');
      print(' --- DATA zone_id : ${data.first.zone_id}');
      print(' --- DATA zone_name : ${data.first.zone_name}');
      print(' --- DATA departement_id : ${data.first.departement_id.toString()}');
      print(' --- DATA departement_name : ${data.first.departement_name}');
      print(' --- DATA region_id : ${data.first.region_id}');
      print(' --- DATA region_name: ${data.first.region_name}');
      print(' --- DATA pays_id : ${data.first.pays_id}');
      print(' --- DATA pays_name: ${data.first.pays_name}');

       */

      for (OpObject item in data) {
        // print(' OP -----: ${item.id.toString()} --- ${item.name.toString()} ');

        OpObject object = OpObject(
            id: item.id,
            name: item.name,
            email: item.email,
            telephone: item.telephone,
            adresse: item.adresse,
            is_actif: false,
            /*
            type_op_id: int.parse(item.type_op_id.toString()),
            type_op_name: item.type_op_name,
            localite_id: int.parse(item.localite_id.toString()) ,
            localite_name: item.localite_name,
            sous_zone_id: int.parse(item.sous_zone_id.toString()) ,
            sous_zone_name: item.sous_zone_name,
            zone_id: int.parse(item.zone_id.toString()) ,
            zone_name: item.zone_name,
            departement_id: int.parse(item.departement_id.toString()) ,
            departement_name: item.departement_name,
            region_id: int.parse(item.region_id.toString()) ,
            region_name: item.region_name,
            pays_id: int.parse(item.pays_id.toString()) ,
            pays_name: item.pays_name
             */
            type_op_id: 0,
            type_op_name: '',
            localite_id: 0,
            localite_name: '',
            sous_zone_id: 0,
            sous_zone_name: '',
            zone_id: 0,
            zone_name: '',
            departement_id: 0,
            departement_name: '',
            region_id: 0,
            region_name: '',
            pays_id: 0,
            pays_name: '');

        opsBox!.put(object);
      }
      return true;
    } catch (e) {
      print(' ---Error------- ${e}');
      return false;
    }
  }

  static Future<bool> writeBoxExploitationChargeExploitationObject(
      List<ExploitationChargeExploitationObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (exploitationChargeExploitationBox!.isEmpty()) {
        for (ExploitationChargeExploitationObject item in data) {
          print('${item.id.toString()} ------ ${item.unite.toString()} ');
          ExploitationChargeExploitationObject object =
              ExploitationChargeExploitationObject(
            id: item.id,
            unite: item.unite,
            date: DateTime.parse(item.date.toString()),
            pu: double.parse(item.pu.toString()),
            quantite: double.parse(item.quantite.toString()),
            valeur: double.parse(item.valeur.toString()),
            observation: item.observation,
            charge_exploitation_id:
                int.parse(item.charge_exploitation_id.toString()),
            charge_exploitation_name: item.charge_exploitation_name,
            type_charge_exploitation_id:
                int.parse(item.type_charge_exploitation_id.toString()),
            type_charge_exploitation_name: item.type_charge_exploitation_name,
            famille_exploitation_id:
                int.parse(item.famille_exploitation_id.toString()),
            famille_charge_exploitation_name:
                item.famille_charge_exploitation_name,
            exploitation_id: int.parse(item.exploitation_id.toString()),
          );

          exploitationChargeExploitationBox!.put(object);
        }
      } else {
        print('------------------- EXPLOITATIONS LODED----------------------');
      }
      return true;
    } catch (e) {
      print(' ---Error------- ${e}');
      return false;
    }
  }

  static Future<bool> writeBoxVarieteObject(List<VarieteObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (varietesBox!.isEmpty()) {
        print(
            '-------------------------VARIETE LODING--------------------------------');

        for (VarieteObject item in data) {
          print(
              '${item.id.toString()} - ${item.name.toString()} - ${item.rendement_unite} - ${item.quantite_unite}  - ${item.surface_unite}  - ${item.produit_id} - ${item.produit_name}  - ${item.filiere_id} - ${item.filiere_name}  ');
          VarieteObject object = VarieteObject(
            id: item.id,
            name: item.name,

            /*
            rendement_unite: double.parse(item.rendement_unite.toString()) ,
            filiere_id: int.parse(item.filiere_id.toString()) ,
            filiere_name: item.filiere_name,
            produit_id: int.parse(item.produit_id.toString()) ,
            produit_name: item.produit_name,
            familleemplacement_id: int.parse(item.familleemplacement_id.toString()) ,
            familleemplacement_name: item.familleemplacement_name,

            surface_unite: 'Ha',
            quantite_unite: 'T',
            rendement_unite: 0,
            filiere_id: 0,
            filiere_name: '',
            produit_id: 0,
            produit_name: '',
            familleemplacement_id: 0,
            familleemplacement_name: '',

             */

            surface_unite: item.surface_unite == null ? '' : item.surface_unite,
            quantite_unite:
                item.quantite_unite == null ? '' : item.quantite_unite,
            rendement_unite:
                item.rendement_unite == null ? 0 : item.rendement_unite,
            filiere_id: item.filiere_id == null ? 0 : item.filiere_id,
            filiere_name: item.filiere_name == null ? '' : item.filiere_name,
            produit_id: item.produit_id == null ? 0 : item.produit_id,
            produit_name: item.produit_name == null ? '' : item.produit_name,
            familleemplacement_id: item.familleemplacement_id == null
                ? 0
                : item.familleemplacement_id,
            familleemplacement_name: item.familleemplacement_name == null
                ? ''
                : item.familleemplacement_name,
          );
          varietesBox!.put(object);
        }
      } else {
        print('------------------- VARIETE LODED----------------------');
      }
      return true;
    } catch (e) {
      print('--Error varieteObject -- ${e}');
      return false;
    }
  }

  static Future<bool> writeBoxProducteurObject(
      List<ProducteurObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      if (producteurBox!.isEmpty()) {
        ApiConstants.producteurIdList = [];
        for (ProducteurObject item in data) {
          ProducteurObject object = ProducteurObject(
              id: item.id,
              prenom: item.prenom,
              nom: item.nom,
              cni: item.cni,
              email: item.email,
              op_id: int.parse(item.op_id.toString()),
              op_name: item.op_name,
              type_op_id: int.parse(item.type_op_id.toString()),
              type_op_name: item.type_op_name,
              is_actif: item.is_actif.toString() == 'true' ? true : false);
          producteurBox!.put(object);
          // getExploitationData(item.id);
          // print('item.id: ${item.id}');
          ApiConstants.producteurIdList.add(item.id);
        }
        /*
        for (ProducteurObject item in data) {
          getExploitationData(item.id);
        }

 */

        for (int i = 0; i < ApiConstants.producteurIdList.length; i++) {
          print('item  xxxxxxxxxxxx --- : ' +
              ApiConstants.producteurIdList[i].toString());
        }

        getArrayProducteursExploitationData(ApiConstants.producteurIdList);
      } else {
        print('------------------- PRODUCTEUR LODED----------------------');
      }
      return true;
    } catch (e) {
      print(' ---Error------- ${e}');
      return false;
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(getObjectBoxModel(),
        directory: dir.path + '/' + ApiConstants.nameDB + '/');

    return ObjectBox._create(store);
  }

  static Future<ObjectBox> close() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(getObjectBoxModel(),
        directory: dir.path + '/' + ApiConstants.nameDB + '/');

    return ObjectBox.close();
  }

  void deleteDbFiles() async {
    var dir = await getApplicationDocumentsDirectory();
    Directory(dir.path + '/' + ApiConstants.nameDB + '/').delete();
  }
}
