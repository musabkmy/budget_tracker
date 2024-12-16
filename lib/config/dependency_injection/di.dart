import 'dart:io';

import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budgets_metadata/get_budgets_metadata_bloc.dart';

import 'di_ex.dart';

GetIt di = GetIt.instance;

Future<void> setupDi() async {
  // /// Helper
  // di.registerSingleton(InternetConnectionHelper());

  /// Hive DataBase
  await Hive.initFlutter();

  registerAdapters();

  /// DB Services
  // Budget DataBase Service
  di.registerSingleton(BudgetDataBaseService());
  await di<BudgetDataBaseService>().initDataBase();

  // /// Api Providers
  // di.registerSingleton(CategoriesApiProvider(di<Dio>()));

  /// DataBase Providers
  // Categories
  di.registerSingleton(BudgetDataBaseProvider(
    budgetDataBaseService: di<BudgetDataBaseService>(),
  ));

  /// Repository
  // Budget
  di.registerSingleton(BudgetRepository(
    di<BudgetDataBaseProvider>(),
  ));

  /// Blocs
  /// get all budgets metadata
  di.registerSingleton<GetBudgetsMetadataBloc>(
      GetBudgetsMetadataBloc(di<BudgetRepository>()));
  // Create a Budget
  di.registerSingleton<CreateBudgetBloc>(
      CreateBudgetBloc(di<BudgetRepository>()));
  // get specific budget
  di.registerSingleton<GetBudgetBloc>(GetBudgetBloc(di<BudgetRepository>()));

  /// Providers
  di.registerLazySingleton<CreateBudgetPopupAppearanceProvider>(
      () => CreateBudgetPopupAppearanceProvider());
  di.registerLazySingleton<EditingNumericFieldProvider>(
      () => EditingNumericFieldProvider());
}

Future<Directory> testSetupDi() async {
  // /// Helper
  // di.registerSingleton(InternetConnectionHelper());

  /// Hive DataBase
  // final testDir = Directory.systemTemp.createTempSync();
  final testDir = Directory(
      '/Users/nasracentre/Musab/Projects/budget_tracker/test/data_data');
  if (!testDir.existsSync()) {
    testDir.createSync(recursive: true);
  }
  Hive.init(testDir.path);

  registerAdapters();

  /// DB Services
  // Budget DataBase Service
  di.registerSingleton<BudgetDataBaseService>(BudgetDataBaseService());
  await di<BudgetDataBaseService>().initDataBase();

  // /// Api Providers
  // di.registerSingleton(CategoriesApiProvider(di<Dio>()));

  /// DataBase Providers
  // Categories
  di.registerSingleton<BudgetDataBaseProvider>(BudgetDataBaseProvider(
    budgetDataBaseService: di<BudgetDataBaseService>(),
  ));

  // /// Repository
  // Budget
  di.registerSingleton<BudgetRepository>(BudgetRepository(
    di<BudgetDataBaseProvider>(),
  ));

  // /// Blocs
  // Budget
  di.registerSingleton<CreateBudgetBloc>(
      CreateBudgetBloc(di<BudgetRepository>()));

  return testDir;
}
