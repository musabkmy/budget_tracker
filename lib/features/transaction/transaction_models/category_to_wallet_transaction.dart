import 'package:budget_tracker/features/transaction/transaction_models/transaction.dart';
import 'package:budget_tracker/hive_helper/fields/category_to_wallet_transaction_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

part 'category_to_wallet_transaction.g.dart';

@HiveType(
    typeId: HiveTypes.categoryToWalletTransaction,
    adapterName: HiveAdapters.categoryToWalletTransaction)
class CategoryToWalletTransaction extends Transaction {
  @HiveField(CategoryToWalletTransactionFields.fromCategoryId)
  final String fromCategoryId;
  @HiveField(CategoryToWalletTransactionFields.headCategoryId)
  final String headCategoryId;
  @HiveField(CategoryToWalletTransactionFields.toWalletId)
  final String toWalletId;

  CategoryToWalletTransaction(
      {required super.id,
      required super.budgetId,
      required super.amount,
      required super.date,
      super.description,
      required this.fromCategoryId,
      required this.headCategoryId,
      required this.toWalletId});
}
