// class InitialDbService {
//   /// Box Key
//   static const String _key = DbKeys.dbBudgets;

//   /// Products Box
//   late final Box<Map<String,Budget>> _budgetsBox;

//   /// init DB
//   Future<void> initDataBase() async {
//     try {
//       _budgetsBox = await Hive.openBox(_key);
//       debugPrint('Success on initializing database For *ProductsModel*');
//       // logger.d('Success on initializing database For *ProductsModel*');
//     } catch (e) {
//       // Handle initialization errors
//       debugPrint('Error initializing database For *ProductModel*');
//       // logger.e('Error initializing database For *ProductModel*');
//     }
//   }
// }