part of 'producteur_bloc.dart';

abstract class ProducteurState extends Equatable {
  const ProducteurState();

  @override
  List<Object> get props => [];
}

class ProducteurInitialState extends ProducteurState {}

class ProducteurLoadingState extends ProducteurState {}

class ProducteurLoadedState extends ProducteurState {
  final List<ProducteurObject> apiResult;

  const ProducteurLoadedState({
    required this.apiResult,
  });
}

class ProducteurErrorState extends ProducteurState {}

abstract class Producteur_idOpState extends Equatable {
  const Producteur_idOpState();

  @override
  List<Object> get props => [];
}

class Producteur_idOpInitialState extends Producteur_idOpState {}

class Producteur_idOpLoadingState extends Producteur_idOpState {}

class Producteur_idOpLoadedState extends Producteur_idOpState {
  final List<ProducteurObject> apiResult;
  final int idOp;

  const Producteur_idOpLoadedState({
    required this.apiResult,
    required this.idOp,
  });
}

class Producteur_idOpErrorState extends Producteur_idOpState {}
