import 'package:budget_local/src/models/category.dart';
import 'package:budget_local/src/models/head_category.dart';
import 'package:budget_local/src/models/wallet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Plus Operator', () {
    test('should add two numbers together', () {
      expect(1 + 1, 2);
    });
  });
}

void fromToFunctionality(FromToFunctionalityParameters input) {}

class FromToFunctionalityParameters {
  FromToFunctionalityParameters(
      {required HeadBudgetCategory headCategory,
      required BudgetCategory category,
      required double leftToSpend,
      required Wallet mainWallet,
      required Wallet? subWallet,
      required bool fromWallet});
}

class FromToFunctionalityReturn {
  FromToFunctionalityReturn({
    required double remainingBudget,
    required double headCategoryTotalBalance,
    required double categoryTotalBalance,
    required double categoryPlannedBalance,
  });
}
