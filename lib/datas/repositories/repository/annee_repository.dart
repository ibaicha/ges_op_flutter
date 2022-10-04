
import '../../../models/models.dart';
import '../../services/services.dart';

class AnneeRepository {
  const AnneeRepository({
    required this.service,
  });
  final AnneeService service;

  Future<List<AnneeObject>> getAnneesBox() async =>
      service.getAllAnnees();
}
