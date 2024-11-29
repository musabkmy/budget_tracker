import 'package:budget_tracker/features/wallet/wallet_models/wallet.dart';
import 'package:budget_tracker/hive_helper/fields/saving_wallet_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/core/models/item_theme.dart';
import 'package:hive/hive.dart';

part 'saving_wallet.g.dart';

@HiveType(
    typeId: HiveTypes.savingWallet, adapterName: HiveAdapters.savingWallet)
class SavingWallet extends Wallet {
  @HiveField(SavingWalletFields.currentBalance)
  double currentBalance;
  @HiveField(SavingWalletFields.goalBalance, defaultValue: 0)
  double goalBalance;
  SavingWallet({
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
      'SavingWallet(currentBalance: $currentBalance, goalBalance: $goalBalance)';
}
