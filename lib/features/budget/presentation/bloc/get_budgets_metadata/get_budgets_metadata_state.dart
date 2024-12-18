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
    this.viewedBudgetKey,
  });
  final List<BudgetMetadata> allBudgetsMetadata;
  final GetBudgetsMetadataStateStatus status;
  final String messageKey;
  final String? viewedBudgetKey;

  @override
  List<Object?> get props => [
        allBudgetsMetadata,
        status,
        messageKey,
        viewedBudgetKey,
      ];

  GetBudgetsMetadataState copyWith({
    List<BudgetMetadata>? allBudgetsMetadata,
    GetBudgetsMetadataStateStatus? status,
    String? messageKey,
    String? viewedBudgetKey,
  }) {
    return GetBudgetsMetadataState(
      status: status ?? this.status,
      allBudgetsMetadata: allBudgetsMetadata ?? this.allBudgetsMetadata,
      messageKey: messageKey ?? '',
      viewedBudgetKey: viewedBudgetKey ?? this.viewedBudgetKey,
    );
  }

  @override
  bool get stringify => true;
}

extension GetBudgetsMetadataStateExt on GetBudgetsMetadataState {
  bool get hasViewedBudgetKey => viewedBudgetKey != null;
  bool get isLoading => status == GetBudgetsMetadataStateStatus.loading;
  bool get isFailed => status == GetBudgetsMetadataStateStatus.failed;
  bool get isCompletedWithNoBudgets =>
      status == GetBudgetsMetadataStateStatus.completed &&
      allBudgetsMetadata.isEmpty;
  bool get isCompletedWithBudgets =>
      status == GetBudgetsMetadataStateStatus.completed &&
      allBudgetsMetadata.isNotEmpty;
}
