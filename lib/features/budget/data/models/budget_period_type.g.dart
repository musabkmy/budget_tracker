// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_period_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetPeriodTypeAdapter extends TypeAdapter<BudgetPeriodType> {
  @override
  final int typeId = 14;

  @override
  BudgetPeriodType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BudgetPeriodType.week;
      case 1:
        return BudgetPeriodType.biWeek;
      case 2:
        return BudgetPeriodType.month;
      case 3:
        return BudgetPeriodType.biMonth;
      case 4:
        return BudgetPeriodType.year;
      default:
        return BudgetPeriodType.week;
    }
  }

  @override
  void write(BinaryWriter writer, BudgetPeriodType obj) {
    switch (obj) {
      case BudgetPeriodType.week:
        writer.writeByte(0);
        break;
      case BudgetPeriodType.biWeek:
        writer.writeByte(1);
        break;
      case BudgetPeriodType.month:
        writer.writeByte(2);
        break;
      case BudgetPeriodType.biMonth:
        writer.writeByte(3);
        break;
      case BudgetPeriodType.year:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetPeriodTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
