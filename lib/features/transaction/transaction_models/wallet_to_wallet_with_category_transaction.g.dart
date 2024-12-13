// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_to_wallet_with_category_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletToWalletWithCategoryTransactionAdapter
    extends TypeAdapter<WalletToWalletWithCategoryTransaction> {
  @override
  final int typeId = 20;

  @override
  WalletToWalletWithCategoryTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletToWalletWithCategoryTransaction(
      id: fields[0] as String,
      budgetId: fields[1] as String,
      amount: fields[2] as double,
      date: fields[4] as DateTime,
      description: fields[3] == null ? '' : fields[3] as String,
      sourceWalletId: fields[5] as String,
      destinationWalletId: fields[6] as String,
      headCategoryId: fields[8] as String,
      categoryId: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WalletToWalletWithCategoryTransaction obj) {
    writer
      ..writeByte(9)
      ..writeByte(5)
      ..write(obj.sourceWalletId)
      ..writeByte(6)
      ..write(obj.destinationWalletId)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(8)
      ..write(obj.headCategoryId)
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
      other is WalletToWalletWithCategoryTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
