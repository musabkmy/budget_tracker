import 'package:budget_tracker/config/theme/app_icons.dart';
import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/core/widgets/custom_sliver_navigation.dart';
import 'package:budget_tracker/features/budget/data/models/budget_metadata.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewBudget extends StatefulWidget {
  const ViewBudget({super.key, required this.budgetMetadata});
  final BudgetMetadata budgetMetadata;

  @override
  State<ViewBudget> createState() => _ViewBudgetState();
}

class _ViewBudgetState extends State<ViewBudget> {
  String? _selectedSegment;
  @override
  void initState() {
    super.initState();
    context
        .read<GetBudgetBloc>()
        .add(GetBudgetData(key: widget.budgetMetadata.key));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<GetBudgetBloc, GetBudgetState>(
      builder: (context, state) {
        debugPrint('${toString()}: ${state.status}, ${state.budget}');

        if (state.isCompleted) {
          final budget = state.budget!;
          return CupertinoPageScaffold(
              child: CustomScrollView(
            slivers: [
              CustomSliverNavigationBar(
                title: 'Plan',
              ),
              // CupertinoSliverNavigationBar(
              //   stretch: true,
              //   padding:
              //       EdgeInsetsDirectional.symmetric(horizontal: aSpPadding12),
              //   middle: AppTextButton(
              //     onPressed: () {},
              //     withoutPadding: true,
              //     child: RichText(
              //       textAlign: TextAlign.center,
              //       text: TextSpan(
              //           text: '${appLocalizations.budget}: ',
              //           style: context.appTextStyles.subTitle,
              //           children: [
              //             TextSpan(
              //               text: '${budget.name} ',
              //               style: context.appTextStyles.title,
              //             ),
              //             WidgetSpan(
              //                 alignment: PlaceholderAlignment.middle,
              //                 child: Icon(AppIcons.downArrowIcon,
              //                     size: aPadding16))
              //           ]),
              //     ),
              //   ),
              //   largeTitle: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       CupertinoButton(
              //         onPressed: () {},
              //         child: Container(
              //             alignment: Alignment.bottomCenter,
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: aSpPadding24,
              //                 vertical: aSpPadding8),
              //             decoration: BoxDecoration(
              //                 borderRadius: aButtonBorderRadius,
              //                 color: CupertinoTheme.of(context)
              //                     .partialTransparentColor),
              //             child: Text('plan'.toUpperCase(),
              //                 style: context.appTextStyles.tabText)),
              //       ),
              //     ],
              //   ),
              //   backgroundColor: CupertinoTheme.of(context).budgetColor,
              //   leading: CupertinoButton(
              //       padding: EdgeInsets.zero,
              //       onPressed: () {},
              //       child: Icon(AppIcons.settingsIcon, size: aPadding28)),
              //   trailing: CupertinoButton(
              //       padding: EdgeInsets.zero,
              //       onPressed: () {},
              //       child: Icon(AppIcons.editIcon, size: aPadding28)),
              // ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      color: index.isOdd
                          ? CupertinoColors.systemGrey4
                          : CupertinoColors.systemGrey6,
                      child: Text(
                        'Item $index',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(fontSize: 18),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
