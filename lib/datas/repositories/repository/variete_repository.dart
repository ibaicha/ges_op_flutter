import '../../../models/models.dart';
import '../../services/services.dart';

class VarieteRepository {
  const VarieteRepository({
    required this.service,
  });
  final VarieteService service;

  Future<List<VarieteObject>> getVarietesBox() async =>
      service.getAllVarietes();
}
