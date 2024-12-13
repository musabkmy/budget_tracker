// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_breakdown_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetBreakdownTypeAdapter extends TypeAdapter<BudgetBreakdownType> {
  @override
  final int typeId = 10;

  @override
  BudgetBreakdownType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BudgetBreakdownType.income;
      case 1:
        return BudgetBreakdownType.saving;
      case 2:
        return BudgetBreakdownType.fixedExpense;
      case 3:
        return BudgetBreakdownType.variableExpense;
      case 4:
        return BudgetBreakdownType.otherExpense;
      default:
        return BudgetBreakdownType.income;
    }
  }

  @override
  void write(BinaryWriter writer, BudgetBreakdownType obj) {
    switch (obj) {
      case BudgetBreakdownType.income:
        writer.writeByte(0);
        break;
      case BudgetBreakdownType.saving:
        writer.writeByte(1);
        break;
      case BudgetBreakdownType.fixedExpense:
        writer.writeByte(2);
        break;
      case BudgetBreakdownType.variableExpense:
        writer.writeByte(3);
        break;
      case BudgetBreakdownType.otherExpense:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetBreakdownTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
