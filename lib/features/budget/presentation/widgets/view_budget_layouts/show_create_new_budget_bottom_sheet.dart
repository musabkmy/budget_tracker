import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/start_creating_budget.dart';
import 'package:flutter/cupertino.dart';

void showCreateNewBudgetBottomSheet(BuildContext context) async {
  await showCupertinoModalPopup<String>(
    context: context,
    useRootNavigator: false,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return Container(
          height: context.heigh * .9,
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
            borderRadius: aBottomSheetRadius,
          ),
          child: StartCreatingBudget());
    },
  );
  // if (result != null) {
  //   createBudgetBloc.add(ResetStateEvent()); // Reset BLoC state
  //   getBudgetsMetadataBloc
  //       .add(ChangeViewedBudgetKey(result)); //change viewed bloc
  // }
}
