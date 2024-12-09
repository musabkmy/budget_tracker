import 'dart:io';

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
  // Budget
  di.registerSingleton<CreateBudgetBloc>(
      CreateBudgetBloc(di<BudgetRepository>()));

  /// Providers
  di.registerLazySingleton<AppearanceProvider>(() => AppearanceProvider());
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
