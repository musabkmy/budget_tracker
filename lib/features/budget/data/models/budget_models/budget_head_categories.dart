// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

class BudgetHeadCategory {
  final String id;
  final Map<String, String> localizedNames;
  double totalBalance;
  double totalPlannedBalance;
  Set<String> categoriesId;

  BudgetHeadCategory({
    required this.localizedNames,
    this.totalBalance = 0,
    this.totalPlannedBalance = 0,
    required this.categoriesId,
    // ignore: prefer_const_constructors
  }) : id = Uuid().v4();

  ///will generate a new [id] for each item
  static Map<String, BudgetHeadCategory> getIdMap(
      List<BudgetHeadCategory> temps) {
    Map<String, BudgetHeadCategory> items = {};
    for (var element in temps) {
      var item = BudgetHeadCategory(
          localizedNames: element.localizedNames,
          categoriesId: element.categoriesId);
      items[item.id] = item;
    }
    return items;
  }

  @override
  String toString() {
    return 'BudgetHeadCategory(id: $id, localizedNames: $localizedNames, totalBalance: $totalBalance, totalPlannedBalance: $totalPlannedBalance, categoriesId: $categoriesId)';
  }
}


// void addCategory(String id) {
//     categoriesId.add(id);
//   }

//   void addTotalBalance(BudgetCategory category) {
//     if (category.headCategoryId == id) {
//       totalBalance += category.balance;
//     }
//   }

//   void addPPlannedBalance(BudgetCategory category) {
//     if (category.headCategoryId == id) {
//       totalPlannedBalance += category.plannedBalance;
//     }
//   }
