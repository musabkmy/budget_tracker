// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetAdapter extends TypeAdapter<Budget> {
  @override
  final int typeId = 16;

  @override
  Budget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Budget(
      id: fields[0] as String,
      localizedNames: (fields[1] as Map).cast<String, String>(),
      budgetPeriod: fields[2] as BudgetPeriod,
      headCategories: (fields[3] as Map).cast<String, BudgetHeadCategory>(),
      categories: (fields[4] as Map).cast<String, BudgetCategory>(),
      startDate: fields[7] as DateTime,
      allBudgetBreakdown:
          (fields[10] as Map).cast<BudgetBreakdownType, BudgetBreakdown>(),
      totalPlannedExpenses: fields[5] as int,
      totalCurrentBalance: fields[6] as int,
    )..numberOfTransactions = fields[11] as int;
  }

  @override
  void write(BinaryWriter writer, Budget obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.localizedNames)
      ..writeByte(2)
      ..write(obj.budgetPeriod)
      ..writeByte(3)
      ..write(obj.headCategories)
      ..writeByte(4)
      ..write(obj.categories)
      ..writeByte(5)
      ..write(obj.totalPlannedExpenses)
      ..writeByte(6)
      ..write(obj.totalCurrentBalance)
      ..writeByte(7)
      ..write(obj.startDate)
      ..writeByte(8)
      ..write(obj.endDate)
      ..writeByte(9)
      ..write(obj.allTransactionsInDayNumber)
      ..writeByte(11)
      ..write(obj.numberOfTransactions)
      ..writeByte(10)
      ..write(obj.allBudgetBreakdown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
