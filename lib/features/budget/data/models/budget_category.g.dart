// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetCategoryAdapter extends TypeAdapter<BudgetCategory> {
  @override
  final int typeId = 11;

  @override
  BudgetCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetCategory(
      id: fields[1] as String,
      headCategoryId: fields[0] as String,
      localizedNames: (fields[2] as Map).cast<String, String>(),
      theme: fields[3] as ItemTheme,
      expenseType:
          fields[4] == null ? ExpenseType.variable : fields[4] as ExpenseType,
      isSaving: fields[5] == null ? false : fields[5] as bool,
      isRemoved: fields[6] == null ? false : fields[6] as bool,
      hasCustomHeadCategory: fields[7] == null ? false : fields[7] as bool,
      budgetCategoryType: fields[8] == null
          ? BudgetCategoryType.expense
          : fields[8] as BudgetCategoryType,
      balance: fields[9] == null ? 0 : fields[9] as double,
      plannedBalance: fields[10] == null ? 0 : fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetCategory obj) {
    writer
      ..writeByte(11)
      ..writeByte(7)
      ..write(obj.hasCustomHeadCategory)
      ..writeByte(8)
      ..write(obj.budgetCategoryType)
      ..writeByte(9)
      ..write(obj.balance)
      ..writeByte(10)
      ..write(obj.plannedBalance)
      ..writeByte(0)
      ..write(obj.headCategoryId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.localizedNames)
      ..writeByte(3)
      ..write(obj.theme)
      ..writeByte(4)
      ..write(obj.expenseType)
      ..writeByte(5)
      ..write(obj.isSaving)
      ..writeByte(6)
      ..write(obj.isRemoved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
