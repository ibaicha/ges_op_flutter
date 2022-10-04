part of 'all_varietes_bloc.dart';

enum AllVarietesStatus { initial, success, error, loading, selected }

extension VarieteStatusX on AllVarietesStatus {
  bool get isInitial => this == AllVarietesStatus.initial;
  bool get isSuccess => this == AllVarietesStatus.success;
  bool get isError => this == AllVarietesStatus.error;
  bool get isLoading => this == AllVarietesStatus.loading;
  bool get isSelected => this == AllVarietesStatus.selected;
}

class AllVarietesState extends Equatable {
  const AllVarietesState({
    this.status = AllVarietesStatus.initial,
    List<VarieteObject>? varietes,
  }) : varietes = varietes ?? const [];

  final AllVarietesStatus status;
  final List<VarieteObject> varietes;

  @override
  List<Object?> get props => [
        status,
        varietes,
      ];

  AllVarietesState copyWith({
    List<VarieteObject>? varietes,
    AllVarietesStatus? status,
  }) {
    return AllVarietesState(
      varietes: varietes ?? this.varietes,
      status: status ?? this.status,
    );
  }
}
