// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_category_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetCategoryTypeAdapter extends TypeAdapter<BudgetCategoryType> {
  @override
  final int typeId = 12;

  @override
  BudgetCategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BudgetCategoryType.income;
      case 1:
        return BudgetCategoryType.expense;
      default:
        return BudgetCategoryType.income;
    }
  }

  @override
  void write(BinaryWriter writer, BudgetCategoryType obj) {
    switch (obj) {
      case BudgetCategoryType.income:
        writer.writeByte(0);
        break;
      case BudgetCategoryType.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetCategoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
