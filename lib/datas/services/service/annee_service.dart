import '../../../features/features.dart';
import '../../../models/models.dart';

class AnneeService {
  Future<List<AnneeObject>> getAllAnnees() async {
    final anneeBox = ObjectBox.anneesBox;
    List<AnneeObject> mesAnnees = [];

    Query<AnneeObject> query = anneeBox!.query().build();
    mesAnnees = query.find();
    query.close();
    return mesAnnees;
  }
}
