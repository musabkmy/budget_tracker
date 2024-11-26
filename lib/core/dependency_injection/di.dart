import 'dart:io';

import 'package:budget_tracker/hive_helper/register_adapters.dart';

import 'di_ex.dart';

GetIt di = GetIt.instance;

Future<void> setupDi() async {
  // /// Helper
  // di.registerSingleton(InternetConnectionHelper());

  /// Hive DataBase
  await Hive.initFlutter();

  // registerAdapters();

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

  // /// Repository
  // // Categories
  // di.registerSingleton(CategoriesRepository(
  //   di<CategoriesApiProvider>(),
  //   di<BudgetDataBaseProvider>(),
  // ));

  // /// Blocs
  // // Categories
  // di.registerSingleton<CategoriesBloc>(CategoriesBloc(di<CategoriesRepository>()));
}

Future<Directory> testSetupDi() async {
  // /// Helper
  // di.registerSingleton(InternetConnectionHelper());

  /// Hive DataBase
  final testDir = Directory.systemTemp.createTempSync();
  Hive.init(testDir.path);

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

  // /// Repository
  // // Categories
  // di.registerSingleton(CategoriesRepository(
  //   di<CategoriesApiProvider>(),
  //   di<BudgetDataBaseProvider>(),
  // ));

  // /// Blocs
  // // Categories
  // di.registerSingleton<CategoriesBloc>(CategoriesBloc(di<CategoriesRepository>()));

  return testDir;
}
