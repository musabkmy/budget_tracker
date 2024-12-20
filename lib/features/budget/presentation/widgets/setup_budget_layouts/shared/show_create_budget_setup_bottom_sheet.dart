import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budgets_metadata/get_budgets_metadata_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/page/create_budget_setup.dart';
import 'package:flutter/cupertino.dart';

void showCreateBudgetSetupBottomSheet(
    BuildContext context,
    CreateBudgetBloc createBudgetBloc,
    GetBudgetsMetadataBloc getBudgetsMetadataBloc) async {
  final result = await showCupertinoModalPopup<String>(
    context: context,
    useRootNavigator: false,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return CreateBudgetSetup();
    },
  );
  if (result != null) {
    createBudgetBloc.add(ResetStateEvent()); // Reset BLoC state
    getBudgetsMetadataBloc
        .add(ChangeViewedBudgetKey(result)); //change viewed bloc
  }
}
