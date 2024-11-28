// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_head_categories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetHeadCategoryAdapter extends TypeAdapter<BudgetHeadCategory> {
  @override
  final int typeId = 13;

  @override
  BudgetHeadCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetHeadCategory(
      id: fields[0] as String,
      localizedNames: (fields[1] as Map).cast<String, String>(),
      totalBalance: fields[2] == null ? 0 : fields[2] as double,
      totalPlannedBalance: fields[3] == null ? 0 : fields[3] as double,
      categoriesId: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BudgetHeadCategory obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.localizedNames)
      ..writeByte(2)
      ..write(obj.totalBalance)
      ..writeByte(3)
      ..write(obj.totalPlannedBalance)
      ..writeByte(4)
      ..write(obj.categoriesId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetHeadCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
