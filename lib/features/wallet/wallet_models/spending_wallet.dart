import 'package:budget_tracker/features/wallet/wallet_models/wallet.dart';
import 'package:budget_tracker/hive_helper/fields/spending_wallet_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/core/models/item_theme.dart';
import 'package:hive/hive.dart';

part 'spending_wallet.g.dart';

@HiveType(
    typeId: HiveTypes.spendingWallet, adapterName: HiveAdapters.spendingWallet)
class SpendingWallet extends Wallet {
  @HiveField(SpendingWalletFields.currentBalance)
  double currentBalance;
  @HiveField(SpendingWalletFields.goalBalance, defaultValue: 0)
  double goalBalance;
  SpendingWallet({
    required super.id,
    required super.localizedNames,
    required super.localizedDescription,
    required super.walletTheme,
    super.addToNetWorth,
    required this.currentBalance,
    this.goalBalance = 0,
  });

  @override
  String toString() =>
      'SpendingWallet(currentBalance: $currentBalance, goalBalance: $goalBalance)';
}
