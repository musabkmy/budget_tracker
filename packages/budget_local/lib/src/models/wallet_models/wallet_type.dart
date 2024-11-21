import 'package:budget_local/src/models/wallet.dart';

class WalletType {
  final String name;
  final String description;
  final List<Wallet> predefinedWallets;

  const WalletType({
    required this.name,
    required this.description,
    required this.predefinedWallets,
  });
}
