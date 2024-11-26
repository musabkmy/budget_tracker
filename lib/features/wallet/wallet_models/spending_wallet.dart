// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'wallet.dart';

class SpendingWallet extends Wallet {
  double currentBalance;
  double goalBalance;
  SpendingWallet({
    required super.localizedNames,
    required super.localizedDescription,
    required super.type,
    required super.walletTheme,
    super.addToNetWorth,
    required this.currentBalance,
    this.goalBalance = 0,
  });

  @override
  String toString() =>
      'SpendingWallet(currentBalance: $currentBalance, goalBalance: $goalBalance)';
}
