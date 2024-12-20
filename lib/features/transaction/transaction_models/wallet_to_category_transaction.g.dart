// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_to_category_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletToCategoryTransactionAdapter
    extends TypeAdapter<WalletToCategoryTransaction> {
  @override
  final int typeId = 19;

  @override
  WalletToCategoryTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletToCategoryTransaction(
      id: fields[0] as String,
      budgetId: fields[1] as String,
      amount: fields[2] as double,
      date: fields[4] as DateTime,
      description: fields[3] == null ? '' : fields[3] as String,
      fromWalletId: fields[5] as String,
      headCategoryId: fields[6] as String,
      toCategoryId: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WalletToCategoryTransaction obj) {
    writer
      ..writeByte(8)
      ..writeByte(5)
      ..write(obj.fromWalletId)
      ..writeByte(6)
      ..write(obj.headCategoryId)
      ..writeByte(7)
      ..write(obj.toCategoryId)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.budgetId)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletToCategoryTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
