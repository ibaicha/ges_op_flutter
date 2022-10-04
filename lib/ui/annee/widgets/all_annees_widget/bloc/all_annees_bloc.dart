import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../datas/repositories/repositories.dart';
import '../../../../../models/models.dart';

part 'all_annees_event.dart';
part 'all_annees_state.dart';

class AllAnneesBloc extends Bloc<AllAnneesEvent, AllAnneesState> {
  final AnneeRepository anneeRepository;

  AllAnneesBloc(
    this.anneeRepository,
  ) : super(AllAnneesInitialState()) {
    on<LoadAllAnneesEvent>(_AllAnneesEvent);
  }

  void _AllAnneesEvent(
    LoadAllAnneesEvent event,
    Emitter<AllAnneesState> emitter,
  ) async {
    if (event is LoadAllAnneesEvent) {
      emitter(AllAnneesLoadingState());
      // await Future.delayed(const Duration(milliseconds: 500));
      List<AnneeObject>? apiResult = await anneeRepository.getAnneesBox();
      if (apiResult == null) {
        emitter(AllAnneesErrorState());
      } else {
        emitter(AllAnneesLoadedState(apiResult: apiResult));
      }
    }
  }
}
