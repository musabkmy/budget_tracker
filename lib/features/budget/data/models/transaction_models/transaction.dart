// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/features/budget/data/models/transaction_models/category_to_wallet_transaction.dart';
import 'package:budget_tracker/features/budget/data/models/transaction_models/wallet_to_category_transaction.dart';
import 'package:budget_tracker/features/budget/data/models/transaction_models/wallet_to_wallet_with_category_transaction.dart';
import 'package:budget_tracker/hive_helper/fields/transaction_fields.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: HiveTypes.transaction)
abstract class Transaction extends HiveObject {
  @HiveField(TransactionFields.id)
  final String id;
  @HiveField(TransactionFields.budgetId)
  String budgetId;
  @HiveField(TransactionFields.amount)
  double amount;
  @HiveField(TransactionFields.description, defaultValue: '')
  String description;
  @HiveField(TransactionFields.date)
  DateTime date;

  Transaction(
      {required this.id,
      required this.budgetId,
      required this.amount,
      required this.date,
      this.description = ''});
}

extension TransactionExt on Transaction {
  bool get isCategoryToWallet => this is CategoryToWalletTransaction;
  bool get isWalletToCategory => this is WalletToCategoryTransaction;
  bool get isWalletToWalletWithCategory =>
      this is WalletToWalletWithCategoryTransaction;
}
