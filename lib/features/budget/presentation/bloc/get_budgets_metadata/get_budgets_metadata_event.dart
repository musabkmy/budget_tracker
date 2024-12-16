part of 'get_budgets_metadata_bloc.dart';

sealed class GetBudgetsMetadataEvent extends Equatable {
  const GetBudgetsMetadataEvent();

  @override
  List<Object> get props => [];
}

class GetBudgetsMetaData extends GetBudgetsMetadataEvent {
  const GetBudgetsMetaData();
}
