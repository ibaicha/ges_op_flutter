part of 'all_annees_bloc.dart';

abstract class AllAnneesState extends Equatable {
  const AllAnneesState();

  @override
  List<Object> get props => [];
}

class AllAnneesInitialState extends AllAnneesState {}

class AllAnneesLoadingState extends AllAnneesState {}

class AllAnneesLoadedState extends AllAnneesState {
  final List<AnneeObject> apiResult;

  const AllAnneesLoadedState({
    required this.apiResult,
  });
}

class AllAnneesErrorState extends AllAnneesState {}
