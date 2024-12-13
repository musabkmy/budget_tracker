import 'package:budget_tracker/core/init_data/item_theme_data.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_breakdown.dart';
import 'package:budget_tracker/features/budget/data/models/budget_breakdown_type.dart';
import 'package:budget_tracker/features/budget/data/models/budget_category.dart';
import 'package:budget_tracker/features/budget/data/models/budget_category_type.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/data/models/budget_period.dart';
import 'package:budget_tracker/core/models/base_category_models/expense_type.dart';
import 'package:budget_tracker/core/models/category_models/category.dart';
import 'package:budget_tracker/core/models/item_theme.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

String enLan = 'en';
/////////////

// Map<WalletType, List<Wallet>> preDefinedWallets = {
//   WalletType.spending(localizedNames: {
//     enLan: 'Spending'
//   }, localizedDescriptions: {
//     enLan: StyledText(
//       fullText: '',
//       styledTextKeys: {},
//     ),
//   }): <SpendingWallet>[
//     SpendingWallet(
//       localizedNames: {'en': 'Spending'},
//       localizedDescription: {
//         'en': 'The wallet for your daily spending I.e. your salary account.'
//       },
//       type: WalletTypeKey.spending,
//       walletTheme: ItemTheme(icon: Icons.monetization_on, color: Colors.blue),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//     ),
//     SpendingWallet(
//       localizedNames: {'en': 'Credit'},
//       localizedDescription: {
//         'en': 'For your credit card or other accounts with credit limit.'
//       },
//       type: WalletTypeKey.spending,
//       walletTheme: ItemTheme(icon: Icons.credit_card, color: Colors.blue),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//     ),
//     SpendingWallet(
//       localizedNames: {'en': 'Cash'},
//       localizedDescription: {
//         'en': 'For money and transactions you make with cash.'
//       },
//       type: WalletTypeKey.spending,
//       walletTheme: ItemTheme(icon: Icons.money, color: Colors.green),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//     ),
//     SpendingWallet(
//       localizedNames: {'en': 'Custom Spending'},
//       localizedDescription: {'en': 'Specify yourself.'},
//       type: WalletTypeKey.spending,
//       walletTheme: ItemTheme(icon: Icons.category, color: Colors.grey),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//     ),
//   ],
//   WalletType.saving(localizedNames: {
//     enLan: 'Saving'
//   }, localizedDescriptions: {
//     enLan: StyledText(
//         fullText:
//             'People who set their saving goal save faster and up to #1 than people who don\'t.',
//         styledTextKeys: {
//           StyledTextKey(
//               styledText: '\$500 more a year', isBold: true, isItalic: false)
//         })
//   }): <SavingWallet>[
//     SavingWallet(
//       localizedNames: {'en': 'Savings'},
//       localizedDescription: {'en': 'Your default savings wallet.'},
//       type: WalletTypeKey.saving,
//       walletTheme: ItemTheme(icon: Icons.savings, color: Colors.green),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//       addToNetWorth: true,
//     ),
//     SavingWallet(
//       localizedNames: {'en': 'Rainy Day Fund'},
//       localizedDescription: {'en': 'Reserved money for special needs.'},
//       type: WalletTypeKey.saving,
//       walletTheme: ItemTheme(icon: Icons.umbrella, color: Colors.blue),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//       addToNetWorth: true,
//     ),
//     SavingWallet(
//       localizedNames: {'en': 'Trip'},
//       localizedDescription: {'en': 'Savings for a trip or your vacation.'},
//       type: WalletTypeKey.saving,
//       walletTheme: ItemTheme(icon: Icons.flight, color: Colors.orange),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//       addToNetWorth: true,
//     ),
//     SavingWallet(
//       localizedNames: {'en': 'House'},
//       localizedDescription: {'en': 'Save up to buy a house or apartment.'},
//       type: WalletTypeKey.saving,
//       walletTheme: ItemTheme(icon: Icons.house, color: Colors.purple),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//       addToNetWorth: true,
//     ),
//     SavingWallet(
//       localizedNames: {'en': 'Custom Savings'},
//       localizedDescription: {'en': 'Specify yourself.'},
//       type: WalletTypeKey.saving,
//       walletTheme: ItemTheme(icon: Icons.category, color: Colors.grey),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//       addToNetWorth: true,
//     ),
//   ],
//   WalletType.dept(localizedNames: {
//     enLan: 'Saving'
//   }, localizedDescriptions: {
//     enLan: StyledText(
//         fullText:
//             'Debt wallets reduces your net worth. expenses added from debt wallet diminishes the remaining balance of the wallet.',
//         styledTextKeys: {})
//   }): <DebtWallet>[
//     DebtWallet(
//       localizedNames: {'en': 'Loan'},
//       localizedDescription: {
//         'en': 'Your bank loan, mortgage or short term debt.'
//       },
//       type: WalletTypeKey.debt,
//       walletTheme: ItemTheme(icon: Icons.account_balance, color: Colors.red),
//       leftToPay: 0.0,
//       startingDebt: 0.0,
//       addToNetWorth: true,
//     ),
//     DebtWallet(
//       localizedNames: {'en': 'Personal Debt'},
//       localizedDescription: {'en': 'Money that you owe someone else.'},
//       type: WalletTypeKey.debt,
//       walletTheme: ItemTheme(icon: Icons.person, color: Colors.red),
//       leftToPay: 0.0,
//       startingDebt: 0.0,
//       addToNetWorth: true,
//     ),
//     DebtWallet(
//       localizedNames: {'en': 'Car Loan'},
//       localizedDescription: {'en': 'Track your payments for your car loan.'},
//       type: WalletTypeKey.debt,
//       walletTheme: ItemTheme(icon: Icons.directions_car, color: Colors.red),
//       leftToPay: 0.0,
//       startingDebt: 0.0,
//       addToNetWorth: true,
//     ),
//     DebtWallet(
//       localizedNames: {'en': 'Custom Debt'},
//       localizedDescription: {'en': 'Specify yourself.'},
//       type: WalletTypeKey.debt,
//       walletTheme: ItemTheme(icon: Icons.category, color: Colors.grey),
//       leftToPay: 0.0,
//       startingDebt: 0.0,
//       addToNetWorth: true,
//     ),
//   ]
// };

// Map<WalletType, List<Wallet>> defaultWallets = {
//   WalletType.spending(localizedNames: {
//     enLan: 'Spending'
//   }, localizedDescriptions: {
//     enLan: StyledText(
//       fullText: '',
//       styledTextKeys: {},
//     ),
//   }): <SpendingWallet>[
//     SpendingWallet(
//       localizedNames: {'en': 'Spending'},
//       localizedDescription: {
//         'en': 'The wallet for your daily spendings I.e. your salary account.'
//       },
//       type: WalletTypeKey.spending,
//       walletTheme: ItemTheme(icon: Icons.monetization_on, color: Colors.blue),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//     ),
//     SpendingWallet(
//       localizedNames: {'en': 'Credit'},
//       localizedDescription: {
//         'en': 'For your credit card or other accounts with credit limit.'
//       },
//       type: WalletTypeKey.spending,
//       walletTheme: ItemTheme(icon: Icons.credit_card, color: Colors.blue),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//     ),
//     SpendingWallet(
//       localizedNames: {'en': 'Cash'},
//       localizedDescription: {
//         'en': 'For money and transactions you make with cash.'
//       },
//       type: WalletTypeKey.spending,
//       walletTheme: ItemTheme(icon: Icons.money, color: Colors.green),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//     ),
//   ],
//   WalletType.saving(localizedNames: {
//     enLan: 'Saving'
//   }, localizedDescriptions: {
//     enLan: StyledText(
//         fullText:
//             'People who set their saving goal save faster and up to #1 than people who don\'t.',
//         styledTextKeys: {
//           StyledTextKey(
//               styledText: '\$500 more a year', isBold: true, isItalic: false)
//         })
//   }): <SavingWallet>[
//     SavingWallet(
//       localizedNames: {'en': 'Savings'},
//       localizedDescription: {'en': 'Your default savings wallet.'},
//       type: WalletTypeKey.saving,
//       walletTheme: ItemTheme(icon: Icons.savings, color: Colors.green),
//       currentBalance: 0.0,
//       goalBalance: 0.0,
//       addToNetWorth: true,
//     ),
//   ],
//   WalletType.dept(localizedNames: {
//     enLan: 'Saving'
//   }, localizedDescriptions: {
//     enLan: StyledText(
//         fullText:
//             'Debt wallets reduces your net worth. expenses added from debt wallet diminishes the remaining balance of the wallet.',
//         styledTextKeys: {})
//   }): <DebtWallet>[]
// };

//////////////

String defaultBudgetName = 'My Workspace';
BudgetPeriod defaultBudgetPeriod = BudgetPeriod.week;

Map<BudgetBreakdownType, BudgetBreakdown> defaultBudgetBreakdown = {
  BudgetBreakdownType.income: BudgetBreakdown(
    localizedNames: {
      'en': 'Income',
    },
  ),
  BudgetBreakdownType.saving: BudgetBreakdown(
    localizedNames: {
      'en': 'Savings',
    },
  ),
  BudgetBreakdownType.fixedExpense: BudgetBreakdown(
    localizedNames: {
      'en': 'Fixed Expenses',
    },
  ),
  BudgetBreakdownType.variableExpense: BudgetBreakdown(
    localizedNames: {
      'en': 'Various Expenses',
    },
  ),
  BudgetBreakdownType.otherExpense: BudgetBreakdown(
    localizedNames: {
      'en': 'Other Expenses',
    },
  ),
};
List<BudgetHeadCategory> defaultBudgetHeadCategory = [
  BudgetHeadCategory(
      id: '0',
      localizedNames: {enLan: 'Income'},
      categoriesId: [],
      headCategoryColor: ItemThemeColors.limeGreen),
  BudgetHeadCategory(
      id: '1',
      localizedNames: {enLan: 'Housing'},
      categoriesId: [],
      headCategoryColor: ItemThemeColors.goldenYellow),
  BudgetHeadCategory(
      id: '2',
      localizedNames: {enLan: 'Food'},
      categoriesId: [],
      headCategoryColor: ItemThemeColors.skyBlue),
  BudgetHeadCategory(
      id: '3',
      localizedNames: {enLan: 'Life Style'},
      categoriesId: [],
      headCategoryColor: ItemThemeColors.softRed),
  BudgetHeadCategory(
      id: '4',
      localizedNames: {enLan: 'Saving'},
      categoriesId: [],
      headCategoryColor: ItemThemeColors.lightYellow),
];

List<BudgetCategory> defaultBudgetCategory = [
  //income
  BudgetCategory(
      id: uuid.v4(),
      headCategoryId: defaultBudgetHeadCategory[0].id,
      localizedNames: {enLan: 'Income'},
      theme: ItemTheme(icon: Icons.attach_money_rounded, color: Colors.green),
      budgetCategoryType: BudgetCategoryType.income),
  // Housing Categories
  BudgetCategory(
      id: uuid.v4(),
      headCategoryId: defaultBudgetHeadCategory[1].id,
      localizedNames: {enLan: 'Rent'},
      theme: ItemTheme(icon: Icons.home, color: Colors.blue),
      budgetCategoryType: BudgetCategoryType.expense),
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[1].id,
    localizedNames: {enLan: 'Internet'},
    theme: ItemTheme(icon: Icons.wifi, color: Colors.blue),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[1].id,
    localizedNames: {enLan: 'Telephone'},
    theme: ItemTheme(icon: Icons.phone, color: Colors.blue),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  // Food Categories
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[2].id,
    localizedNames: {enLan: 'Restaurants'},
    theme: ItemTheme(icon: Icons.restaurant, color: Colors.red),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[2].id,
    localizedNames: {enLan: 'Groceries'},
    theme: ItemTheme(icon: Icons.local_grocery_store, color: Colors.red),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  // Lifestyle Categories
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Clothes'},
    theme: ItemTheme(icon: Icons.shopping_bag, color: Colors.orange),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Healthcare'},
    theme: ItemTheme(icon: Icons.health_and_safety, color: Colors.orange),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Gym'},
    theme: ItemTheme(icon: Icons.fitness_center, color: Colors.orange),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Miscellaneous'},
    theme: ItemTheme(icon: Icons.miscellaneous_services, color: Colors.purple),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  //saving
  BudgetCategory(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[4].id,
    localizedNames: {enLan: 'Saving'},
    theme: ItemTheme(icon: Icons.savings, color: Colors.yellow),
    budgetCategoryType: BudgetCategoryType.income,
    expenseType: ExpenseType.variable,
  ),
];

//get head categories
Map<String, BudgetHeadCategory> headCategories =
    BudgetHeadCategory.getIdMap(defaultBudgetHeadCategory);

//get categories
Map<String, BudgetCategory> categories =
    BudgetCategory.getIdMap(defaultBudgetCategory)
      //change referenced ids in head categories and categories
      ..forEach((key, value) {
        int index = defaultBudgetHeadCategory
            .indexWhere((element) => element.id == value.headCategoryId);
        value.headCategoryId = headCategories.keys.elementAt(index);
        headCategories.values.elementAt(index).categoriesId.add(key);
      });

const uuid = Uuid();

Budget myBudget = Budget(
  id: uuid.v4(),
  name: defaultBudgetName,
  budgetPeriod: BudgetPeriod.biMonth,
  // budgetPeriod: defaultBudgetPeriod,
  headCategories: headCategories,
  categories: categories,
  startDate: DateTime.now(),
  allBudgetBreakdown: defaultBudgetBreakdown,
);

Budget myBudget2 = Budget(
  id: uuid.v4(),
  name: defaultBudgetName,
  budgetPeriod: BudgetPeriod.biMonth,
  // budgetPeriod: defaultBudgetPeriod,
  headCategories: headCategories,
  categories: categories,
  startDate: DateTime.now(),
  allBudgetBreakdown: defaultBudgetBreakdown,
);

Map<String, Budget> appBudget = {myBudget.id: myBudget};

// (Map<String, BudgetHeadCategory> headCategories,
//   Map<String, BudgetCategory> categories) changeIds() {
//   //get head categories
//   Map<String, BudgetHeadCategory> headCategories =
//       BudgetHeadCategory.getIdMap(defaultBudgetHeadCategory);

//   //get categories
//   Map<String, BudgetCategory> categories =
//       BudgetCategory.getIdMap(defaultBudgetCategory);

//   categories.forEach((key, value) {
//     int index = defaultBudgetHeadCategory
//         .indexWhere((element) => element.id == value.headCategoryId);
//     value.headCategoryId = headCategories.keys.elementAt(index);
//     headCategories.values.elementAt(index).categoriesId.add(key);
//   });
//   return (headCategories,categories);
// }

List<Category> appCategories = [
  //income
  Category(
      id: uuid.v4(),
      headCategoryId: defaultBudgetHeadCategory[0].id,
      localizedNames: {enLan: 'Income'},
      theme: ItemTheme(icon: Icons.attach_money_rounded, color: Colors.green)),
  // Housing Categories
  Category(
      id: uuid.v4(),
      headCategoryId: defaultBudgetHeadCategory[1].id,
      localizedNames: {enLan: 'Rent'},
      theme: ItemTheme(icon: Icons.home, color: Colors.blue)),
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[1].id,
    localizedNames: {enLan: 'Internet'},
    theme: ItemTheme(icon: Icons.wifi, color: Colors.blue),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[1].id,
    localizedNames: {enLan: 'Telephone'},
    theme: ItemTheme(icon: Icons.phone, color: Colors.blue),
    expenseType: ExpenseType.variable,
  ),
  // Food Categories
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[2].id,
    localizedNames: {enLan: 'Restaurants'},
    theme: ItemTheme(icon: Icons.restaurant, color: Colors.red),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[2].id,
    localizedNames: {enLan: 'Groceries'},
    theme: ItemTheme(icon: Icons.local_grocery_store, color: Colors.red),
    expenseType: ExpenseType.variable,
  ),
  // Lifestyle Categories
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Clothes'},
    theme: ItemTheme(icon: Icons.shopping_bag, color: Colors.orange),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Healthcare'},
    theme: ItemTheme(icon: Icons.health_and_safety, color: Colors.orange),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Gym'},
    theme: ItemTheme(icon: Icons.fitness_center, color: Colors.orange),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Miscellaneous'},
    theme: ItemTheme(icon: Icons.miscellaneous_services, color: Colors.purple),
    expenseType: ExpenseType.variable,
  ),
  //saving
  Category(
    id: uuid.v4(),
    headCategoryId: defaultBudgetHeadCategory[4].id,
    localizedNames: {enLan: 'Saving'},
    theme: ItemTheme(icon: Icons.savings, color: Colors.yellow),
    expenseType: ExpenseType.variable,
  ),
];
