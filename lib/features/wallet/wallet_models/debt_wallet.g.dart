// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebtWalletAdapter extends TypeAdapter<DebtWallet> {
  @override
  final int typeId = 24;

  @override
  DebtWallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebtWallet(
      id: fields[0] as String?,
      localizedNames: (fields[1] as Map).cast<String, String>(),
      localizedDescription: (fields[2] as Map).cast<String, String>(),
      walletTheme: fields[3] as ItemTheme,
      addToNetWorth: fields[4] == null ? false : fields[4] as bool,
      leftToPay: fields[5] as double,
      startingDebt: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DebtWallet obj) {
    writer
      ..writeByte(7)
      ..writeByte(5)
      ..write(obj.leftToPay)
      ..writeByte(6)
      ..write(obj.startingDebt)
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
      other is DebtWalletAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
