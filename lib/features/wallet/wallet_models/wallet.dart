import 'package:budget_tracker/features/wallet/wallet_models/debt_wallet.dart';
import 'package:budget_tracker/features/wallet/wallet_models/saving_wallet.dart';
import 'package:budget_tracker/features/wallet/wallet_models/spending_wallet.dart';
import 'package:budget_tracker/hive_helper/fields/wallet_fields.dart';
import 'package:budget_tracker/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

import '../../../core/models/item_theme.dart';

@HiveType(typeId: HiveTypes.wallet)
abstract class Wallet extends HiveObject {
  @HiveField(WalletFields.id)
  final String? id;
  @HiveField(WalletFields.localizedNames)
  Map<String, String> localizedNames;
  @HiveField(WalletFields.localizedDescription)
  Map<String, String> localizedDescription;
  @HiveField(WalletFields.walletTheme)
  ItemTheme walletTheme;
  @HiveField(WalletFields.addToNetWorth, defaultValue: false)
  bool addToNetWorth;

  Wallet({
    required this.id,
    required this.localizedNames,
    required this.localizedDescription,
    required this.walletTheme,
    this.addToNetWorth = false,
  });

  @override
  String toString() {
    return 'Wallet(id: $id, localizedNames: $localizedNames, localizedDescription: $localizedDescription,walletTheme: $walletTheme, addToNetWorth: $addToNetWorth)';
  }
}

extension WalletExt on Wallet {
  bool get isSpendingWallet => this is SpendingWallet;
  bool get isSavingWallet => this is SavingWallet;
  bool get isDebtWallet => this is DebtWallet;
}
