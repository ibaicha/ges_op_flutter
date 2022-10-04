import '../../../models/models.dart';
import '../../services/services.dart';

class ProducteurRepository {
  const ProducteurRepository({
    required this.service,
  });
  final ProducteurService service;

  Future<List<ProducteurObject>> getProducteursBox() async =>
      service.getAllProducteurs();

  Future<List<ProducteurObject>> getExploitationsIdOpBox(int idOp) async =>
      service.getAllProducteursIdOp(idOp);
}
