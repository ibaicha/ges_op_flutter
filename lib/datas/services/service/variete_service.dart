import '../../../features/features.dart';
import '../../../models/models.dart';

class VarieteService {
  Future<List<VarieteObject>> getAllVarietes() async {
    final varieteBox = ObjectBox.varietesBox;
    List<VarieteObject> mesVarietes = [];

    Query<VarieteObject> query = varieteBox!.query().build();
    mesVarietes = query.find();
    query.close();
    return mesVarietes;
  }
}
