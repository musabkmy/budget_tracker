// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../models/styled_text.dart';

enum WalletTypeKey {
  spending,
  saving,
  debt,
}

class WalletType {
  final WalletTypeKey walletTypeKey;
  Map<String, String> localizedNames;
  Map<String, StyledText> localizedDescriptions;
  double totalBalance;
  List<String> walletsId;

  WalletType._(this.walletTypeKey, this.localizedNames,
      this.localizedDescriptions, this.totalBalance, this.walletsId);

  //available instances
  static final WalletType _spending =
      WalletType._(WalletTypeKey.spending, {}, {}, 0.0, []);
  static final WalletType _saving =
      WalletType._(WalletTypeKey.saving, {}, {}, 0.0, []);
  static final WalletType _debt =
      WalletType._(WalletTypeKey.debt, {}, {}, 0.0, []);

  //ensure only one spending type initiated
  factory WalletType.spending({
    required Map<String, String> localizedNames,
    required Map<String, StyledText> localizedDescriptions,
  }) {
    _spending.localizedNames = localizedNames;
    _spending.localizedDescriptions = localizedDescriptions;
    return _spending;
  }

  //ensure only one saving category initiated
  factory WalletType.saving({
    required Map<String, String> localizedNames,
    required Map<String, StyledText> localizedDescriptions,
  }) {
    _saving.localizedNames = localizedNames;
    _saving.localizedDescriptions = localizedDescriptions;
    return _saving;
  }

  //ensure only one saving category initiated
  factory WalletType.dept({
    required Map<String, String> localizedNames,
    required Map<String, StyledText> localizedDescriptions,
  }) {
    _debt.localizedNames = localizedNames;
    _debt.localizedDescriptions = localizedDescriptions;
    return _debt;
  }

  ///get all wallets categories:
  ///[spending], [saving] and [dept]
  static List<WalletType> get allWalletsCategories =>
      [_spending, _saving, _debt];

  @override
  String toString() {
    return 'WalletType(walletTypeKey: $walletTypeKey, localizedNames: $localizedNames, localizedDescriptions: $localizedDescriptions, totalBalance: $totalBalance, walletsId: $walletsId)';
  }
}
