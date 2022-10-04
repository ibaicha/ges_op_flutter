import '../../../features/features.dart';
import '../../../models/models.dart';

class ProducteurService {
  Future<List<ProducteurObject>> getAllProducteurs() async {
    final ProducteurBox = ObjectBox.producteurBox;
    List<ProducteurObject> mesProducteurs = [];

    Query<ProducteurObject> query = ProducteurBox!.query().build();
    mesProducteurs = query.find();
    query.close();
    return mesProducteurs;
  }

  Future<List<ProducteurObject>> getAllProducteursIdOp(int idOp) async {
    final ProducteurBox = ObjectBox.producteurBox;
    List<ProducteurObject> mesProducteurs = [];

    Query<ProducteurObject> query =
        ProducteurBox!.query(ProducteurObject_.op_id.equals(idOp)).build();
    mesProducteurs = query.find();
    query.close();
    return mesProducteurs;
  }
}
