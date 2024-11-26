// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'wallet.dart';

class DebtWallet extends Wallet {
  double leftToPay;
  double startingDebt;
  DebtWallet({
    required super.localizedNames,
    required super.localizedDescription,
    required super.type,
    required super.walletTheme,
    super.addToNetWorth,
    required this.leftToPay,
    required this.startingDebt,
  });

  @override
  String toString() =>
      'DebtWallet(leftToPay: $leftToPay, startingDebt: $startingDebt)';
}
