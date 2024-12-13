// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_period.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetPeriodAdapter extends TypeAdapter<BudgetPeriod> {
  @override
  final int typeId = 15;

  @override
  BudgetPeriod read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetPeriod(
      fields[2] as BudgetPeriodType,
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetPeriod obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.periodInDays)
      ..writeByte(2)
      ..write(obj.budgetPeriodType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetPeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
