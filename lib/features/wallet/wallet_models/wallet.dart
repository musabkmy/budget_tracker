// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import '../../../models/item_theme.dart';
import 'wallet_type.dart';
import 'package:uuid/uuid.dart';

abstract class Wallet {
  // UUID generator

  final String? id;
  Map<String, String> localizedNames;
  Map<String, String> localizedDescription;
  final WalletTypeKey type;
  ItemTheme walletTheme;
  bool addToNetWorth;

  Wallet({
    required this.localizedNames,
    required this.localizedDescription,
    required this.type,
    required this.walletTheme,
    this.addToNetWorth = false,
  }) : id = Uuid().v4();

  @override
  String toString() {
    return 'Wallet(id: $id, localizedNames: $localizedNames, localizedDescription: $localizedDescription, type: $type, walletTheme: $walletTheme, addToNetWorth: $addToNetWorth)';
  }
}
