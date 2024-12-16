// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_budgets_metadata_bloc.dart';

enum GetBudgetsMetadataStateStatus {
  initial,
  loading,
  failed,
  canceled,
  completed,
}

class GetBudgetsMetadataState extends Equatable {
  const GetBudgetsMetadataState({
    required this.status,
    this.allBudgetsMetadata = const [],
    this.messageKey = '',
  });
  final List<BudgetMetadata> allBudgetsMetadata;
  final GetBudgetsMetadataStateStatus status;
  final String messageKey;

  @override
  List<Object> get props => [
        allBudgetsMetadata,
        status,
        messageKey,
      ];

  GetBudgetsMetadataState copyWith(
      {List<BudgetMetadata>? allBudgetsMetadata,
      GetBudgetsMetadataStateStatus? status,
      String? messageKey}) {
    return GetBudgetsMetadataState(
      status: status ?? this.status,
      allBudgetsMetadata: allBudgetsMetadata ?? [],
      messageKey: messageKey ?? '',
    );
  }
}

extension GetBudgetsMetadataStateExt on GetBudgetsMetadataState {
  bool get isLoading => status == GetBudgetsMetadataStateStatus.loading;
  bool get isFailed => status == GetBudgetsMetadataStateStatus.failed;
  bool get isCompletedWithNoBudgets =>
      status == GetBudgetsMetadataStateStatus.completed &&
      allBudgetsMetadata.isEmpty;
  bool get isCompletedWithBudgets =>
      status == GetBudgetsMetadataStateStatus.completed &&
      allBudgetsMetadata.isNotEmpty;
}
