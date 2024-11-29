import 'package:budget_tracker/features/wallet/wallet_models/wallet.dart';
import 'package:budget_tracker/hive_helper/fields/debt_wallet_fields.dart';
import 'package:budget_tracker/hive_helper/hive_adapters.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:budget_tracker/core/models/item_theme.dart';
import 'package:hive/hive.dart';

part 'debt_wallet.g.dart';

@HiveType(typeId: HiveTypes.debtWallet, adapterName: HiveAdapters.debtWallet)
class DebtWallet extends Wallet {
  @HiveField(DebtWalletFields.leftToPay)
  double leftToPay;
  @HiveField(DebtWalletFields.startingDebt)
  double startingDebt;
  DebtWallet({
    required super.id,
    required super.localizedNames,
    required super.localizedDescription,
    required super.walletTheme,
    super.addToNetWorth,
    required this.leftToPay,
    required this.startingDebt,
  });

  @override
  String toString() =>
      'DebtWallet(leftToPay: $leftToPay, startingDebt: $startingDebt)';
}
