import 'package:budget_tracker/features/transaction/transaction_models/transaction.dart';
import 'package:budget_tracker/hive_helper/fields/wallet_to_wallet_with_category_transaction_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

part 'wallet_to_wallet_with_category_transaction.g.dart';

@HiveType(
    typeId: HiveTypes.walletToWalletWithCategoryTransaction,
    adapterName: HiveAdapters.walletToWalletWithCategoryTransaction)
class WalletToWalletWithCategoryTransaction extends Transaction {
  @HiveField(WalletToWalletWithCategoryTransactionFields.sourceWalletId)
  final String sourceWalletId;
  @HiveField(WalletToWalletWithCategoryTransactionFields.destinationWalletId)
  final String destinationWalletId;
  @HiveField(WalletToWalletWithCategoryTransactionFields.categoryId)
  final String categoryId;
  @HiveField(WalletToWalletWithCategoryTransactionFields.headCategoryId)
  final String headCategoryId;

  WalletToWalletWithCategoryTransaction(
      {required super.id,
      required super.budgetId,
      required super.amount,
      required super.date,
      super.description,
      required this.sourceWalletId,
      required this.destinationWalletId,
      required this.headCategoryId,
      required this.categoryId});
}
