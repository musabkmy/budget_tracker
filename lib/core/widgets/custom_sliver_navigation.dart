import 'package:budget_tracker/config/theme/app_icons.dart';
import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSliverNavigationBar extends StatelessWidget {
  final String title;

  const CustomSliverNavigationBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _CustomNavigationBarDelegate(
        title: title,
        expandedHeight: 180, // Custom height
      ),
    );
  }
}

class _CustomNavigationBarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double expandedHeight;

  _CustomNavigationBarDelegate(
      {required this.title, required this.expandedHeight});

  @override
  double get minExtent => expandedHeight * .6;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final proportion = 1 - (shrinkOffset / maxExtent).clamp(0.0, 1.0);
    final fontSize = 34 * proportion;

    return Container(
      color: CupertinoTheme.of(context).budgetColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: context.width * .2,
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Icon(AppIcons.settingsIcon, size: aPadding28)),
                  ),
                  SizedBox(
                    width: context.width * .6,
                    child: AppTextButton(
                      onPressed: () {},
                      withoutPadding: true,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: '${appLocalizations.budget}: ',
                            style: context.appTextStyles.subTitle,
                            children: [
                              TextSpan(
                                text: '$title ',
                                style: context.appTextStyles.title,
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(AppIcons.downArrowIcon,
                                      size: aPadding16))
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width * .2,
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Icon(AppIcons.editIcon, size: aPadding28)),
                  ),
                ],
              ),
            ),
            //tabs: [Plan] - [Remaining] - [Insights]
            shrinkOffset > 0
                ? SizedBox()
                : Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CupertinoButton(
                          onPressed: () {},
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.symmetric(
                                  horizontal: aSpPadding24,
                                  vertical: aSpPadding8),
                              decoration: BoxDecoration(
                                  borderRadius: aButtonBorderRadius,
                                  color: CupertinoTheme.of(context)
                                      .partialTransparentColor),
                              child: Text('plan'.toUpperCase(),
                                  style: context.appTextStyles.tabText)),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
