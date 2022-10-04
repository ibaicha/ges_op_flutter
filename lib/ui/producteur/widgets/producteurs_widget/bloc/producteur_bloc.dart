import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../datas/repositories/repositories.dart';
import '../../../../../models/models.dart';

part 'producteur_event.dart';
part 'producteur_state.dart';

class ProducteurBloc extends Bloc<ProducteurEvent, ProducteurState> {
  final ProducteurRepository producteurRepository;

  ProducteurBloc(
    this.producteurRepository,
  ) : super(ProducteurInitialState()) {
    on<LoadProducteurEvent>(_ProducteurEvent);
  }

  void _ProducteurEvent(
    LoadProducteurEvent event,
    Emitter<ProducteurState> emitter,
  ) async {
    if (event is LoadProducteurEvent) {
      emitter(ProducteurLoadingState());
      // await Future.delayed(const Duration(milliseconds: 500));
      List<ProducteurObject>? apiResult =
          await producteurRepository.getProducteursBox();
      if (apiResult == null) {
        emitter(ProducteurErrorState());
      } else {
        emitter(ProducteurLoadedState(apiResult: apiResult));
      }
    }
  }
}

class Producteur_idOpBloc
    extends Bloc<Producteur_idOpEvent, Producteur_idOpState> {
  final ProducteurRepository producteurRepository;

  Producteur_idOpBloc(
    this.producteurRepository,
  ) : super(Producteur_idOpInitialState()) {
    on<LoadProducteur_idOpEvent>(_Producteur_idOpEvent);
  }

  void _Producteur_idOpEvent(
    LoadProducteur_idOpEvent event,
    Emitter<Producteur_idOpState> emitter,
  ) async {
    if (event is LoadProducteur_idOpEvent) {
      emitter(Producteur_idOpLoadingState());
      // await Future.delayed(const Duration(milliseconds: 500));
      List<ProducteurObject>? apiResult =
          await producteurRepository.getExploitationsIdOpBox(event.idOp);
      if (apiResult == null) {
        emitter(Producteur_idOpErrorState());
      } else {
        emitter(Producteur_idOpLoadedState(
          apiResult: apiResult,
          idOp: event.idOp,
        ));
      }
    }
  }
}
