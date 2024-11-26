// ignore_for_file: prefer_const_constructors

import 'package:uuid/uuid.dart';

sealed class Transaction {
  final String id;
  String budgetId;
  double amount;
  String description;
  DateTime date;

  Transaction(
      {required this.budgetId,
      required this.amount,
      required this.date,
      this.description = ''})
      : id = Uuid().v4();
}

class CategoryToWalletTransaction extends Transaction {
  final String fromCategoryId;
  final String headCategoryId;
  final String toWalletId;

  CategoryToWalletTransaction(
      {required super.budgetId,
      required super.amount,
      required super.date,
      super.description,
      required this.fromCategoryId,
      required this.headCategoryId,
      required this.toWalletId});
}

class WalletToCategoryTransaction extends Transaction {
  final String fromWalletId;
  final String headCategoryId;
  final String toCategoryId;

  WalletToCategoryTransaction(
      {required super.budgetId,
      required super.amount,
      required super.date,
      super.description,
      required this.fromWalletId,
      required this.headCategoryId,
      required this.toCategoryId});
}

class WalletToWalletWithCategoryTransaction extends Transaction {
  final String sourceWalletId;
  final String destinationWalletId;
  final String categoryId;
  final String headCategoryId;

  WalletToWalletWithCategoryTransaction(
      {required super.budgetId,
      required super.amount,
      required super.date,
      super.description,
      required this.sourceWalletId,
      required this.destinationWalletId,
      required this.headCategoryId,
      required this.categoryId});
}

extension TransactionExt on Transaction {
  bool get isCategoryToWallet => this is CategoryToWalletTransaction;
  bool get isWalletToCategory => this is WalletToCategoryTransaction;
  bool get isWalletToWalletWithCategory =>
      this is WalletToWalletWithCategoryTransaction;
}
