import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class AppSliverNavigationBar extends StatelessWidget {
  const AppSliverNavigationBar(
      {super.key,
      required this.topWidgets,
      required this.bottomWidgets,
      this.isPinned = true});
  final List<Widget> topWidgets;
  final List<Widget> bottomWidgets;
  final bool isPinned;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: isPinned,
      delegate: _CustomNavigationBarDelegate(
        expandedHeight: 160.sp,
        topWidgets: topWidgets,
        bottomWidgets: bottomWidgets,
      ),
    );
  }
}

class _CustomNavigationBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final List<Widget> topWidgets;
  final List<Widget> bottomWidgets;

  _CustomNavigationBarDelegate({
    required this.expandedHeight,
    required this.topWidgets,
    required this.bottomWidgets,
  });

  @override
  double get minExtent => expandedHeight * .6;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // final proportion = 1 - (shrinkOffset / maxExtent).clamp(0.0, 1.0);
    // final fontSize = 34 * proportion;

    return Container(
      color: CupertinoTheme.of(context).budgetColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: topWidgets,
              ),
            ),
            //tabs: [Plan] - [Remaining] - [Insights]
            shrinkOffset > 0
                ? SizedBox()
                : Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bottomWidgets,
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
