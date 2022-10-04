import '../modeles/modeles.dart';
import '../../models/models.dart';
import '../../features/features.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DbService {
  static String baseUrl = 'http://192.168.43.177:8000';
  static String allsaisons = '/api/saisons/allsaisons';
  static String allproduits = '/api/produits/getproduits';
  static String allvarietes = '/api/varietes/getvarietes';
  static String allannees = '/api/anneees/allannees';
  static String allchargeexploitations =
      '/api/chargeexploitations/getchargeexploitations';
  static String allexploitations = '/api/exploitations/getexploitations';

  Uri getUrl({required String url}) {
    var retour = Uri.parse('$baseUrl$url');
    print(retour);
    return retour;
  }
}
