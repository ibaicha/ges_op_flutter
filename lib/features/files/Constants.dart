import 'dart:async';

import 'package:dropdown_pro/dropdown_item.dart';
import 'package:path_provider/path_provider.dart';

import 'package:objectbox/objectbox.dart';

import '../../models/models.dart';

class ApiConstants {
  // static String baseUrl = 'https://www.agricash.suivi-paddy.org';
  // static String baseUrl = 'http://192.168.43.177:8000';
  static String baseUrl = 'http://172.20.10.7:8000';
  // static String baseUrl = 'http://127.0.0.1/:8000';

  static String loginEndpoint = '/api/login_check';
  static String allUsersEndpoint = '/api/users/allusers';
  static String allExploitationsEndpoint =
      '/api/exploitations/getexploitations';
  static String allpointservices = '/api/point_services/allpointservices';
  static String allfamillechargeexploitation =
      '/api/famillechargeexploitations/getfamillechargeexploitations';
  static String alltypechargeexploitation =
      '/api/typechargeexploitations/gettypechargeexploitations';
  static String alltypeops = '/api/typeops/gettypeops';
  static int idOp = 0;
  static String specificop = '/api/ops/${idOp}/getidop';
  static String allsaisons = '/api/saisons/allsaisons';
  static String allproduits = '/api/produits/getproduits';
  static String allvarietes = '/api/varietes/getvarietes';
  static String allannees = '/api/anneees/allannees';
  static String allchargeexploitations =
      '/api/chargeexploitations/getchargeexploitations';
  static String allexploitations = '/api/exploitations/getexploitations';
  static String allexploitationschargeexploitation =
      '/api/exploitationchargeexploitations/getexploitationchargeexploitations';
  static int idUser = 0;
  static String specificuser = '/api/users/${idUser}/specific';
  // static int idOp = 0;
  static String allproducteursOp = '/api/producteurs/getopproducteurs/${idOp}';
  static int idProducteur = 0;
  static String oneproducteur =
      '/api/producteurs/getopproducteur/${idProducteur}';

  static int idExploitation = 0;
  static String allExploitationschargeexploitation =
      '/api/exploitationchargeexploitations/getexploitationchargeexploitation/';

  static List<int> ListInt = [1, 3];
  // static String arrayproducteurexploitations= '/api/exploitationproducteurs/getArrayProducteurExploitationsProducteur/${producteurIdList}';
  static String arrayproducteurexploitations =
      '/api/exploitationproducteurs/getArrayProducteurExploitationsProducteur/${ListInt}';

  static String allProducteurExploitations =
      '/api/exploitationproducteurs/getIDProducteurExploitationsProducteur/';

  static bool admin = false;
  static bool maintenance = false;

  static List<int> producteurIdList = [];
  static List<int> exploitationIdList = [];

  static String token = '';
  static String nameDB = '';
  static bool isRecentlyCreatedDB = false;
  static var utilisateur = Utilisateur(
      id: 0, token: '', email: '', password: '', firstname: '', lastname: '');

  static int idProduit = 0;
  static UserObject utilisateurObject = UserObject(
    id: 0,
    token: '',
    email: '',
    password: '',
    firstname: '',
    lastname: '',
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

  static var exploitationObject = ExploitationObject(
    id: 0,
    producteur_id: 0,
    prenom: '',
    nom: '',
    cni: '',
    email: '',
    is_actif: false,
    op_id: 0,
    op_name: '',
    type_op_id: 0,
    type_op_name: '',
    exploitation_id: 0,
    compte: '',
    unite: '',
    superficie_prevision: 0,
    production_prevision: 0,
    pu_prevision: 0,
    filiere_prevision_id: 0,
    filiere_prevision_name: '',
    produit_prevision_id: 0,
    produit_prevision_name: '',
    variete_prevision_id: 0,
    variete_prevision_name: '',
    superficie: 0,
    production: 0,
    pu: 0,
    filiere_id: 0,
    filiere_name: '',
    produit_id: 0,
    produit_name: '',
    variete_id: 0,
    variete_name: '',
    saison_id: 0,
    saison_name: '',
    annne_id: 0,
    annee_name: '',
  );

  static String compte = "";
  static List<DropdownItem> itemAnneesList = [];
  static String singleSelectedAnneeId = "";
  static List<String> listStringAnneeId = [];
  static List<DropdownItem> _itemSaisonsList = [];
  static String _singleSelectedSaisonId = "";
  static List<DropdownItem> itemVarietesList = [];

  static String singleSelectedVarieteId = "";
  static List<String> listStringVarieteId = [];
  static List<DropdownItem> _itemProducteursList = [];
  static String _singleSelectedProducteurId = "";
  static List<String> _mutiSelectedProducteursIds = [];

  static bool ActiveConnection = false;
  static String T = "";

  static StreamSubscription? connection;
  static bool isoffline = false;
  static String typeConnexion = '';
}

makeDb(String name) {
  name = name.replaceAll('@', '').replaceAll('.', '');
  // name = name.replaceAll(RegExp('.'), '')async ;
  return "db$name";
}

makePath() async {
  var dir = await getApplicationDocumentsDirectory();
  var path = dir.path + '/' + ApiConstants.nameDB + '/';
  return path.toString();
}
