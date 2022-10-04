import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../datas/repositories/repositories.dart';
import '../../../../../models/models.dart';


part 'all_varietes_event.dart';
part 'all_varietes_state.dart';

class AllVarietesBloc extends Bloc<AllVarietesEvent, AllVarietesState> {
  AllVarietesBloc({
    required this.varieteRepository,
  }) : super(const AllVarietesState()) {
    on<GetAllVarietesEvent>(_mapGetVarietesEventToState);
  }
  final VarieteRepository varieteRepository;

  void _mapGetVarietesEventToState(
      GetAllVarietesEvent event, Emitter<AllVarietesState> emit) async {
    try {
      emit(state.copyWith(status: AllVarietesStatus.loading));

      final retourVarietes = await varieteRepository.getVarietesBox();
      emit(state.copyWith(
        status: AllVarietesStatus.success,
        varietes: retourVarietes,
      ));
      print('-------SUCCESS--------');
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: AllVarietesStatus.error));
      print('-------ERROR--------');
    }
  }
}
