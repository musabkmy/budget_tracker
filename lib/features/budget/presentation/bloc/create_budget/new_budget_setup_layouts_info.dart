// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum LayoutType { start, headCategory, stats, finish }

class BudgetSetupLayoutsInfo extends Equatable {
  final LayoutType layoutType;
  final int headBudgetCount = 5;

  ///index: save the process in relation to [headBudgetCount]
  ///to fetch saved head category data using [key] call [nextHeadBudgetKey]
  final int? headBudgetIndex;

  ///storing [categories] - [plannedBalance] of the current [BudgetHeadCategory]
  ///String: [BudgetCategory.id]
  ///double: [plannedBalance]
  final Map<String, double>? initialBudgetCategoryPlannedBalance;
  const BudgetSetupLayoutsInfo({
    this.layoutType = LayoutType.start,
    this.headBudgetIndex,
    this.initialBudgetCategoryPlannedBalance,
  });

  BudgetSetupLayoutsInfo copyWith({
    required LayoutType layoutType,

    ///pass false for previous HeadBudgetIndex
    final bool? nextHeadBudgetIndex,
    final Map<String, double>? initialBudgetCategoryPlannedBalance,
  }) {
    debugPrint(
        'copyWith: layoutType: $layoutType, nextHeadBudgetIndex: $nextHeadBudgetIndex\nCurrent: layoutType: ${this.layoutType} headBudgetIndex: $headBudgetIndex');
    if (
        //out of limit headBudgetIndex
        (nextHeadBudgetIndex != null &&
                ((nextHeadBudgetIndex && reachedLastHeadCategory) ||
                    (!nextHeadBudgetIndex && inFirstHeadCategory))) ||
            //unauthorized type headCategory without a headCategoryIndex
            (layoutType == LayoutType.headCategory &&
                nextHeadBudgetIndex == null &&
                headBudgetIndex == null)) {
      return this;
    }
    return BudgetSetupLayoutsInfo(
      layoutType: layoutType,
      headBudgetIndex: ((layoutType == LayoutType.headCategory ||
                  layoutType == LayoutType.stats) &&
              nextHeadBudgetIndex == null)
          ? headBudgetIndex
          : _getHeadBudgetIndex(nextHeadBudgetIndex),
      initialBudgetCategoryPlannedBalance:
          initialBudgetCategoryPlannedBalance ??
              this.initialBudgetCategoryPlannedBalance,
    );
  }

  @override
  List<Object?> get props => [
        layoutType,
        headBudgetIndex,
      ];

  int? _getHeadBudgetIndex(bool? nextHeadBudgetIndex) {
    if (nextHeadBudgetIndex == null) {
      return null;
    } else if (nextHeadBudgetIndex) {
      return headBudgetIndex != null ? (headBudgetIndex!) + 1 : 0;
    } else {
      return headBudgetIndex != null ? (headBudgetIndex!) - 1 : 0;
    }
  }

  @override
  bool get stringify => true;
}

extension LayoutTypeExt on BudgetSetupLayoutsInfo {
  bool get atStart => layoutType == LayoutType.start;
  bool get atHeadCategory => layoutType == LayoutType.headCategory;
  bool get atStats => layoutType == LayoutType.stats;
  bool get atFinish => layoutType == LayoutType.finish;

  bool get reachedLastHeadCategory => headBudgetIndex == headBudgetCount - 1;
  bool get inFirstHeadCategory => headBudgetIndex == 0;

  String get nextHeadBudgetName {
    switch (headBudgetIndex) {
      case 0:
        return 'income';
      case 1:
        return 'housing';
      case 2:
        return 'food';
      case 3:
        return 'lifestyle';
      case 4:
        return 'savings';
      default:
        return '';
    }
  }

  int get nexHeadCategoryIndex =>
      headBudgetIndex == null ? 0 : headBudgetIndex! + 1;
}
