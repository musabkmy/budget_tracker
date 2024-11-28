// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpendingWalletAdapter extends TypeAdapter<SpendingWallet> {
  @override
  final int typeId = 22;

  @override
  SpendingWallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpendingWallet(
      id: fields[0] as String?,
      localizedNames: (fields[1] as Map).cast<String, String>(),
      localizedDescription: (fields[2] as Map).cast<String, String>(),
      walletTheme: fields[3] as ItemTheme,
      addToNetWorth: fields[4] == null ? false : fields[4] as bool,
      currentBalance: fields[5] as double,
      goalBalance: fields[6] == null ? 0 : fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SpendingWallet obj) {
    writer
      ..writeByte(7)
      ..writeByte(5)
      ..write(obj.currentBalance)
      ..writeByte(6)
      ..write(obj.goalBalance)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.localizedNames)
      ..writeByte(2)
      ..write(obj.localizedDescription)
      ..writeByte(3)
      ..write(obj.walletTheme)
      ..writeByte(4)
      ..write(obj.addToNetWorth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpendingWalletAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
