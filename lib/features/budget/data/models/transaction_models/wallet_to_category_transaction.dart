import 'package:budget_tracker/features/budget/data/models/transaction_models/transaction.dart';
import 'package:budget_tracker/hive_helper/fields/wallet_to_category_transaction_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

part 'wallet_to_category_transaction.g.dart';

@HiveType(
    typeId: HiveTypes.walletToCategoryTransaction,
    adapterName: HiveAdapters.walletToCategoryTransaction)
class WalletToCategoryTransaction extends Transaction {
  @HiveField(WalletToCategoryTransactionFields.fromWalletId)
  final String fromWalletId;
  @HiveField(WalletToCategoryTransactionFields.headCategoryId)
  final String headCategoryId;
  @HiveField(WalletToCategoryTransactionFields.toCategoryId)
  final String toCategoryId;

  WalletToCategoryTransaction(
      {required super.id,
      required super.budgetId,
      required super.amount,
      required super.date,
      super.description,
      required this.fromWalletId,
      required this.headCategoryId,
      required this.toCategoryId});
}
