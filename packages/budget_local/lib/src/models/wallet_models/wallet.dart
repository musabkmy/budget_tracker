import 'package:budget_local/src/models/wallet_type.dart';
import 'package:uuid/uuid.dart';

class Wallet {
  // UUID generator

  final String? id;
  final String name;
  final WalletType type;
  final double currentBalance;
  final double goalBalance;
  final bool inNetWorth;

  Wallet({
    this.id,
    required this.name,
    required this.type,
    this.currentBalance = 0,
    this.goalBalance = 0,
    this.inNetWorth = false,
  });

  Wallet copyWithId({
    // String? id,
    String? name,
    double? currentBalance,
    double? goalBalance,
    bool? inNetWorth,
  }) {
    return Wallet(
      // ignore: prefer_const_constructors
      id: Uuid().v1(),
      name: name ?? this.name,
      type: type,
      currentBalance: currentBalance ?? this.currentBalance,
      goalBalance: goalBalance ?? this.goalBalance,
      inNetWorth: inNetWorth ?? this.inNetWorth,
    );
  }
}
