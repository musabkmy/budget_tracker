// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_to_wallet_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryToWalletTransactionAdapter
    extends TypeAdapter<CategoryToWalletTransaction> {
  @override
  final int typeId = 18;

  @override
  CategoryToWalletTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryToWalletTransaction(
      id: fields[0] as String,
      budgetId: fields[1] as String,
      amount: fields[2] as double,
      date: fields[4] as DateTime,
      description: fields[3] == null ? '' : fields[3] as String,
      fromCategoryId: fields[5] as String,
      headCategoryId: fields[6] as String,
      toWalletId: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryToWalletTransaction obj) {
    writer
      ..writeByte(8)
      ..writeByte(5)
      ..write(obj.fromCategoryId)
      ..writeByte(6)
      ..write(obj.headCategoryId)
      ..writeByte(7)
      ..write(obj.toWalletId)
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
      other is CategoryToWalletTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
