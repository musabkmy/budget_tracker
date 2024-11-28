// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_breakdown.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetBreakdownAdapter extends TypeAdapter<BudgetBreakdown> {
  @override
  final int typeId = 9;

  @override
  BudgetBreakdown read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetBreakdown(
      localizedNames: (fields[0] as Map).cast<String, String>(),
      plannedBalance: fields[1] as double,
      currentBalance: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetBreakdown obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.localizedNames)
      ..writeByte(1)
      ..write(obj.plannedBalance)
      ..writeByte(2)
      ..write(obj.currentBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetBreakdownAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
