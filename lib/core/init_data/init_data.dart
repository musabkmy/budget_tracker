import 'package:budget_tracker/core/init_data/item_theme_data.dart';
import 'package:budget_tracker/core/models/base_category_models/expense_type.dart';
import 'package:budget_tracker/core/models/category_models/category.dart';
import 'package:budget_tracker/core/models/category_models/head_category.dart';
import 'package:budget_tracker/core/models/item_theme.dart';

const String enLan = 'en';

final List<HeadCategory> appHeadCategories = [
  // 0 - 5
  HeadCategory(id: '0', localizedNames: {
    enLan: 'Miscellaneous'
  }, categories: [
    Category(
      id: '0',
      headCategoryId: '0',
      localizedNames: {enLan: 'Bank cost'},
      theme: ItemTheme(
        icon: ItemThemeIcons.bank,
        color: ItemThemeColors.lightGrey,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '1',
      headCategoryId: '0',
      localizedNames: {enLan: 'Clothes'},
      theme: ItemTheme(
        icon: ItemThemeIcons.clothes,
        color: ItemThemeColors.lightGrey,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '2',
      headCategoryId: '0',
      localizedNames: {enLan: 'Healthcare'},
      theme: ItemTheme(
        icon: ItemThemeIcons.healthcare,
        color: ItemThemeColors.lightGrey,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '3',
      headCategoryId: '0',
      localizedNames: {enLan: 'Miscellaneous'},
      theme: ItemTheme(
        icon: ItemThemeIcons.miscellaneous,
        color: ItemThemeColors.lightGrey,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '4',
      headCategoryId: '0',
      localizedNames: {enLan: 'Student Loan'},
      theme: ItemTheme(
        icon: ItemThemeIcons.studentLoan,
        color: ItemThemeColors.lightGrey,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '5',
      headCategoryId: '0',
      localizedNames: {enLan: 'Unknown'},
      theme: ItemTheme(
        icon: ItemThemeIcons.unknown,
        color: ItemThemeColors.lightGrey,
      ),
      expenseType: ExpenseType.variable,
    ),
  ]),

  /// 6 - 15
  HeadCategory(id: '1', localizedNames: {
    enLan: 'Entertainment'
  }, categories: [
    Category(
      id: '6',
      headCategoryId: '1',
      localizedNames: {enLan: 'Bowling'},
      theme: ItemTheme(
        icon: ItemThemeIcons.bowling,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '7',
      headCategoryId: '1',
      localizedNames: {enLan: 'Cinema'},
      theme: ItemTheme(
        icon: ItemThemeIcons.cinema,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '8',
      headCategoryId: '1',
      localizedNames: {enLan: 'Concert'},
      theme: ItemTheme(
        icon: ItemThemeIcons.concert,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '9',
      headCategoryId: '1',
      localizedNames: {enLan: 'Electronics'},
      theme: ItemTheme(
        icon: ItemThemeIcons.electronics,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '10',
      headCategoryId: '1',
      localizedNames: {enLan: 'Entertainment'},
      theme: ItemTheme(
        icon: ItemThemeIcons.entertainment,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '11',
      headCategoryId: '1',
      localizedNames: {enLan: 'Gym'},
      theme: ItemTheme(
        icon: ItemThemeIcons.gym,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '12',
      headCategoryId: '1',
      localizedNames: {enLan: 'Hobby'},
      theme: ItemTheme(
        icon: ItemThemeIcons.hobby,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '13',
      headCategoryId: '1',
      localizedNames: {enLan: 'Sports'},
      theme: ItemTheme(
        icon: ItemThemeIcons.sports,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '14',
      headCategoryId: '1',
      localizedNames: {enLan: 'Subscription'},
      theme: ItemTheme(
        icon: ItemThemeIcons.subscription,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '15',
      headCategoryId: '1',
      localizedNames: {enLan: 'Vacation'},
      theme: ItemTheme(
        icon: ItemThemeIcons.vacation,
        color: ItemThemeColors.lightPink,
      ),
      expenseType: ExpenseType.variable,
    ),
  ]),

  /// 16 - 21
  HeadCategory(id: '2', localizedNames: {
    enLan: 'Food & Drinks'
  }, categories: [
    Category(
      id: '16',
      headCategoryId: '2',
      localizedNames: {enLan: 'Candy'},
      theme: ItemTheme(
        icon: ItemThemeIcons.candy,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '17',
      headCategoryId: '2',
      localizedNames: {enLan: 'Coffee'},
      theme: ItemTheme(
        icon: ItemThemeIcons.coffee,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '18',
      headCategoryId: '2',
      localizedNames: {enLan: 'Drinks'},
      theme: ItemTheme(
        icon: ItemThemeIcons.drinks,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '19',
      headCategoryId: '2',
      localizedNames: {enLan: 'Food'},
      theme: ItemTheme(
        icon: ItemThemeIcons.food,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '20',
      headCategoryId: '2',
      localizedNames: {enLan: 'Groceries'},
      theme: ItemTheme(
        icon: ItemThemeIcons.groceries,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '21',
      headCategoryId: '2',
      localizedNames: {enLan: 'Restaurant'},
      theme: ItemTheme(
        icon: ItemThemeIcons.restaurant,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
    ),
  ]),

  /// 22 - 36
  HeadCategory(id: '3', localizedNames: {
    enLan: 'Housing'
  }, categories: [
    Category(
      id: '22',
      headCategoryId: '3',
      localizedNames: {enLan: 'Bank'},
      theme: ItemTheme(
        icon: ItemThemeIcons.bank,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '23',
      headCategoryId: '3',
      localizedNames: {enLan: 'Bills'},
      theme: ItemTheme(
        icon: ItemThemeIcons.bills,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '24',
      headCategoryId: '3',
      localizedNames: {enLan: 'Electricity'},
      theme: ItemTheme(
        icon: ItemThemeIcons.electricity,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '25',
      headCategoryId: '3',
      localizedNames: {enLan: 'Home supplies'},
      theme: ItemTheme(
        icon: ItemThemeIcons.homeSupplies,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '26',
      headCategoryId: '3',
      localizedNames: {enLan: 'Housing'},
      theme: ItemTheme(
        icon: ItemThemeIcons.housing,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '27',
      headCategoryId: '3',
      localizedNames: {enLan: 'Insurance'},
      theme: ItemTheme(
        icon: ItemThemeIcons.insurance,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '28',
      headCategoryId: '3',
      localizedNames: {enLan: 'Internet'},
      theme: ItemTheme(
        icon: ItemThemeIcons.internet,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '29',
      headCategoryId: '3',
      localizedNames: {enLan: 'Loan'},
      theme: ItemTheme(
        icon: ItemThemeIcons.loan,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '30',
      headCategoryId: '3',
      localizedNames: {enLan: 'Maintenance'},
      theme: ItemTheme(
        icon: ItemThemeIcons.maintenance,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '31',
      headCategoryId: '3',
      localizedNames: {enLan: 'Rent'},
      theme: ItemTheme(
        icon: ItemThemeIcons.rent,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '32',
      headCategoryId: '3',
      localizedNames: {enLan: 'Service'},
      theme: ItemTheme(
        icon: ItemThemeIcons.service,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '33',
      headCategoryId: '3',
      localizedNames: {enLan: 'TV'},
      theme: ItemTheme(
        icon: ItemThemeIcons.tv,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '34',
      headCategoryId: '3',
      localizedNames: {enLan: 'Taxes'},
      theme: ItemTheme(
        icon: ItemThemeIcons.taxes,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '35',
      headCategoryId: '3',
      localizedNames: {enLan: 'Telephone'},
      theme: ItemTheme(
        icon: ItemThemeIcons.telephone,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '36',
      headCategoryId: '3',
      localizedNames: {enLan: 'Water'},
      theme: ItemTheme(
        icon: ItemThemeIcons.water,
        color: ItemThemeColors.goldenYellow,
      ),
      expenseType: ExpenseType.fixed,
    ),
  ]),
  // 37 - 42
  HeadCategory(id: '4', localizedNames: {
    enLan: 'Income'
  }, categories: [
    Category(
      id: '37',
      headCategoryId: '4',
      localizedNames: {enLan: 'Child benefit'},
      theme: ItemTheme(
        icon: ItemThemeIcons.childBenefit,
        color: ItemThemeColors.limeGreen,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '38',
      headCategoryId: '4',
      localizedNames: {enLan: 'Income'},
      theme: ItemTheme(
        icon: ItemThemeIcons.income,
        color: ItemThemeColors.limeGreen,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '39',
      headCategoryId: '4',
      localizedNames: {enLan: 'Interest'},
      theme: ItemTheme(
        icon: ItemThemeIcons.interest,
        color: ItemThemeColors.limeGreen,
      ),
      expenseType: ExpenseType.fixed,
    ),
    Category(
      id: '40',
      headCategoryId: '4',
      localizedNames: {enLan: 'Investments'},
      theme: ItemTheme(
        icon: ItemThemeIcons.investments,
        color: ItemThemeColors.limeGreen,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '41',
      headCategoryId: '4',
      localizedNames: {enLan: 'Pension'},
      theme: ItemTheme(
        icon: ItemThemeIcons.pension,
        color: ItemThemeColors.limeGreen,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '42',
      headCategoryId: '4',
      localizedNames: {enLan: 'Salary'},
      theme: ItemTheme(
        icon: ItemThemeIcons.salary,
        color: ItemThemeColors.limeGreen,
      ),
      expenseType: ExpenseType.fixed,
    ),
  ]),
  // 43 - 58
  HeadCategory(id: '5', localizedNames: {
    enLan: 'Lifestyle'
  }, categories: [
    Category(
      id: '43',
      headCategoryId: '5',
      localizedNames: {enLan: 'Charity'},
      theme: ItemTheme(
        icon: ItemThemeIcons.charity,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '44',
      headCategoryId: '5',
      localizedNames: {enLan: 'Child care'},
      theme: ItemTheme(
        icon: ItemThemeIcons.childCare,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '45',
      headCategoryId: '5',
      localizedNames: {enLan: 'Community'},
      theme: ItemTheme(
        icon: ItemThemeIcons.community,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '46',
      headCategoryId: '5',
      localizedNames: {enLan: 'Dentist'},
      theme: ItemTheme(
        icon: ItemThemeIcons.dentist,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '47',
      headCategoryId: '5',
      localizedNames: {enLan: 'Doctor'},
      theme: ItemTheme(
        icon: ItemThemeIcons.doctor,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '48',
      headCategoryId: '5',
      localizedNames: {enLan: 'Education'},
      theme: ItemTheme(
        icon: ItemThemeIcons.education,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '49',
      headCategoryId: '5',
      localizedNames: {enLan: 'Gift'},
      theme: ItemTheme(
        icon: ItemThemeIcons.gift,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '50',
      headCategoryId: '5',
      localizedNames: {enLan: 'Hotel'},
      theme: ItemTheme(
        icon: ItemThemeIcons.hotel,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '51',
      headCategoryId: '5',
      localizedNames: {enLan: 'Lifestyle'},
      theme: ItemTheme(
        icon: ItemThemeIcons.lifestyle,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '52',
      headCategoryId: '5',
      localizedNames: {enLan: 'Office expenses'},
      theme: ItemTheme(
        icon: ItemThemeIcons.officeExpenses,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '53',
      headCategoryId: '5',
      localizedNames: {enLan: 'Pet'},
      theme: ItemTheme(
        icon: ItemThemeIcons.rent,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '54',
      headCategoryId: '5',
      localizedNames: {enLan: 'Pet'},
      theme: ItemTheme(
        icon: ItemThemeIcons.pet,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '55',
      headCategoryId: '5',
      localizedNames: {enLan: 'Pharmacy'},
      theme: ItemTheme(
        icon: ItemThemeIcons.pharmacy,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '56',
      headCategoryId: '5',
      localizedNames: {enLan: 'Shopping'},
      theme: ItemTheme(
        icon: ItemThemeIcons.shopping,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '57',
      headCategoryId: '5',
      localizedNames: {enLan: 'Travel'},
      theme: ItemTheme(
        icon: ItemThemeIcons.travel,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '58',
      headCategoryId: '5',
      localizedNames: {enLan: 'Work'},
      theme: ItemTheme(
        icon: ItemThemeIcons.work,
        color: ItemThemeColors.softRed,
      ),
      expenseType: ExpenseType.variable,
    ),
  ]),
  // 59 - 61
  HeadCategory(id: '6', localizedNames: {
    enLan: 'Saving'
  }, categories: [
    Category(
      id: '59',
      headCategoryId: '6',
      localizedNames: {enLan: 'Emergency savings'},
      theme: ItemTheme(
        icon: ItemThemeIcons.emergencySavings,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
      isSaving: true,
    ),
    Category(
      id: '60',
      headCategoryId: '6',
      localizedNames: {enLan: 'Savings'},
      theme: ItemTheme(
        icon: ItemThemeIcons.savings,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
      isSaving: true,
    ),
    Category(
      id: '59',
      headCategoryId: '6',
      localizedNames: {enLan: 'Vacation savings'},
      theme: ItemTheme(
        icon: ItemThemeIcons.vacationSavings,
        color: ItemThemeColors.skyBlue,
      ),
      expenseType: ExpenseType.variable,
      isSaving: true,
    ),
  ]),
// 62 - 71
  HeadCategory(id: '7', localizedNames: {
    enLan: 'Transportation'
  }, categories: [
    Category(
      id: '62',
      headCategoryId: '7',
      localizedNames: {enLan: 'Car costs'},
      theme: ItemTheme(
        icon: ItemThemeIcons.carCosts,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '63',
      headCategoryId: '7',
      localizedNames: {enLan: 'Car insurance'},
      theme: ItemTheme(
        icon: ItemThemeIcons.carInsurance,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '64',
      headCategoryId: '7',
      localizedNames: {enLan: 'Car loan'},
      theme: ItemTheme(
        icon: ItemThemeIcons.carLoan,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '65',
      headCategoryId: '7',
      localizedNames: {enLan: 'Flight'},
      theme: ItemTheme(
        icon: ItemThemeIcons.flight,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '66',
      headCategoryId: '7',
      localizedNames: {enLan: 'Gas'},
      theme: ItemTheme(
        icon: ItemThemeIcons.gas,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '67',
      headCategoryId: '7',
      localizedNames: {enLan: 'Parking'},
      theme: ItemTheme(
        icon: ItemThemeIcons.parking,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '68',
      headCategoryId: '7',
      localizedNames: {enLan: 'Public transport'},
      theme: ItemTheme(
        icon: ItemThemeIcons.publicTransport,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '69',
      headCategoryId: '7',
      localizedNames: {enLan: 'Repair'},
      theme: ItemTheme(
        icon: ItemThemeIcons.repair,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '70',
      headCategoryId: '7',
      localizedNames: {enLan: 'Taxi'},
      theme: ItemTheme(
        icon: ItemThemeIcons.taxi,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
    Category(
      id: '71',
      headCategoryId: '7',
      localizedNames: {enLan: 'Transportation'},
      theme: ItemTheme(
        icon: ItemThemeIcons.transportation,
        color: ItemThemeColors.violetPurple,
      ),
      expenseType: ExpenseType.variable,
    ),
  ]),
];

final List<Category> appCategories = [
  //income
  Category(
    id: '0',
    headCategoryId: appHeadCategories[0].id,
    localizedNames: {enLan: 'Income'},
    theme: ItemTheme(
      icon: ItemThemeIcons.income,
      color: ItemThemeColors.limeGreen,
    ),
  ),
  // Housing Categories
  Category(
    id: '1',
    headCategoryId: appHeadCategories[1].id,
    localizedNames: {enLan: 'Rent'},
    theme: ItemTheme(
      icon: ItemThemeIcons.rent,
      color: ItemThemeColors.skyBlue,
    ),
    expenseType: ExpenseType.fixed,
  ),
  Category(
    id: '2',
    headCategoryId: appHeadCategories[1].id,
    localizedNames: {enLan: 'Internet'},
    theme: ItemTheme(
      icon: ItemThemeIcons.internet,
      color: ItemThemeColors.skyBlue,
    ),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: '3',
    headCategoryId: appHeadCategories[1].id,
    localizedNames: {enLan: 'Telephone'},
    theme: ItemTheme(
      icon: ItemThemeIcons.telephone,
      color: ItemThemeColors.skyBlue,
    ),
    expenseType: ExpenseType.variable,
  ),
  // Food Categories
  Category(
    id: '4',
    headCategoryId: appHeadCategories[2].id,
    localizedNames: {enLan: 'Restaurants'},
    theme: ItemTheme(
      icon: ItemThemeIcons.restaurant,
      color: ItemThemeColors.softRed,
    ),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: '5',
    headCategoryId: appHeadCategories[2].id,
    localizedNames: {enLan: 'Groceries'},
    theme: ItemTheme(
      icon: ItemThemeIcons.groceries,
      color: ItemThemeColors.softRed,
    ),
    expenseType: ExpenseType.variable,
  ),
  // Lifestyle Categories
  Category(
    id: '6',
    headCategoryId: appHeadCategories[3].id,
    localizedNames: {enLan: 'Clothes'},
    theme: ItemTheme(
      icon: ItemThemeIcons.clothes,
      color: ItemThemeColors.goldenYellow,
    ),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: '7',
    headCategoryId: appHeadCategories[3].id,
    localizedNames: {enLan: 'Healthcare'},
    theme: ItemTheme(
      icon: ItemThemeIcons.healthcare,
      color: ItemThemeColors.goldenYellow,
    ),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: '8',
    headCategoryId: appHeadCategories[3].id,
    localizedNames: {enLan: 'Gym'},
    theme: ItemTheme(
      icon: ItemThemeIcons.fitnessCenter,
      color: ItemThemeColors.goldenYellow,
    ),
    expenseType: ExpenseType.variable,
  ),
  Category(
    id: '9',
    headCategoryId: appHeadCategories[3].id,
    localizedNames: {enLan: 'Miscellaneous'},
    theme: ItemTheme(
      icon: ItemThemeIcons.miscellaneous,
      color: ItemThemeColors.violetPurple,
    ),
    expenseType: ExpenseType.variable,
  ),
  //saving
  Category(
    id: '10',
    headCategoryId: appHeadCategories[4].id,
    localizedNames: {enLan: 'Saving'},
    theme: ItemTheme(
      icon: ItemThemeIcons.savings,
      color: ItemThemeColors.goldenYellow,
    ),
    expenseType: ExpenseType.variable,
  ),
];
  // final List<Wallet> appWallets;
  // final List<Budget> appBudgets;
  // final List<Transaction> appTransactions;


