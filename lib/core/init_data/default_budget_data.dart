import 'package:budget_tracker/core/init_data/item_theme_data.dart';
import 'package:budget_tracker/core/models/base_category_models/expense_type.dart';
import 'package:budget_tracker/core/models/item_theme.dart';
import 'package:budget_tracker/features/budget/data/models/budget_breakdown.dart';
import 'package:budget_tracker/features/budget/data/models/budget_breakdown_type.dart';
import 'package:budget_tracker/features/budget/data/models/budget_category.dart';
import 'package:budget_tracker/features/budget/data/models/budget_category_type.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/data/models/budget_period.dart';

const String enLan = 'en';

String defaultBudgetName = 'My Workspace';

BudgetPeriod defaultBudgetPeriod = BudgetPeriod.week;

Map<BudgetBreakdownType, BudgetBreakdown> defaultBudgetBreakdown = {
  BudgetBreakdownType.income: BudgetBreakdown(
    localizedNames: {
      enLan: 'Income',
    },
  ),
  BudgetBreakdownType.saving: BudgetBreakdown(
    localizedNames: {
      enLan: 'Savings',
    },
  ),
  BudgetBreakdownType.fixedExpense: BudgetBreakdown(
    localizedNames: {
      enLan: 'Fixed Expenses',
    },
  ),
  BudgetBreakdownType.variableExpense: BudgetBreakdown(
    localizedNames: {
      enLan: 'Various Expenses',
    },
  ),
  BudgetBreakdownType.otherExpense: BudgetBreakdown(
    localizedNames: {
      enLan: 'Other Expenses',
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
      id: '0',
      headCategoryId: defaultBudgetHeadCategory[0].id,
      localizedNames: {enLan: 'Income'},
      theme: ItemTheme(
        icon: ItemThemeIcons.income,
        color: ItemThemeColors.limeGreen,
      ),
      expenseType: ExpenseType.fixed,
      budgetCategoryType: BudgetCategoryType.income),
  // Housing Categories
  BudgetCategory(
      id: '1',
      headCategoryId: defaultBudgetHeadCategory[1].id,
      localizedNames: {enLan: 'Rent'},
      theme: ItemTheme(
        icon: ItemThemeIcons.rent,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
      budgetCategoryType: BudgetCategoryType.expense),
  BudgetCategory(
    id: '2',
    headCategoryId: defaultBudgetHeadCategory[1].id,
    localizedNames: {enLan: 'Internet'},
    theme: ItemTheme(
      icon: ItemThemeIcons.internet,
      color: ItemThemeColors.goldenYellow,
    ),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: '3',
    headCategoryId: defaultBudgetHeadCategory[1].id,
    localizedNames: {enLan: 'Telephone'},
    theme: ItemTheme(
      icon: ItemThemeIcons.telephone,
      color: ItemThemeColors.goldenYellow,
    ),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.fixed,
  ),
  // Food Categories
  BudgetCategory(
    id: '4',
    headCategoryId: defaultBudgetHeadCategory[2].id,
    localizedNames: {enLan: 'Restaurants'},
    theme: ItemTheme(
      icon: ItemThemeIcons.restaurant,
      color: ItemThemeColors.skyBlue,
    ),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: '5',
    headCategoryId: defaultBudgetHeadCategory[2].id,
    localizedNames: {enLan: 'Groceries'},
    theme: ItemTheme(
      icon: ItemThemeIcons.groceries,
      color: ItemThemeColors.skyBlue,
    ),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  // Lifestyle Categories
  BudgetCategory(
    id: '6',
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Clothes'},
    theme: ItemTheme(
        icon: ItemThemeIcons.clothes, color: ItemThemeColors.lightGrey),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: '7',
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Healthcare'},
    theme: ItemTheme(
        icon: ItemThemeIcons.healthcare, color: ItemThemeColors.lightGrey),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: '8',
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Gym'},
    theme:
        ItemTheme(icon: ItemThemeIcons.gym, color: ItemThemeColors.lightPink),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  BudgetCategory(
    id: '9',
    headCategoryId: defaultBudgetHeadCategory[3].id,
    localizedNames: {enLan: 'Miscellaneous'},
    theme: ItemTheme(
        icon: ItemThemeIcons.miscellaneous, color: ItemThemeColors.lightGrey),
    budgetCategoryType: BudgetCategoryType.expense,
    expenseType: ExpenseType.variable,
  ),
  //saving
  BudgetCategory(
    id: '10',
    headCategoryId: defaultBudgetHeadCategory[4].id,
    localizedNames: {enLan: 'Saving'},
    theme:
        ItemTheme(icon: ItemThemeIcons.savings, color: ItemThemeColors.skyBlue),
    budgetCategoryType: BudgetCategoryType.income,
    expenseType: ExpenseType.variable,
  ),
];
