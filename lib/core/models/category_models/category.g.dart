// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 5;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[1] as String,
      headCategoryId: fields[0] as String,
      localizedNames: (fields[2] as Map).cast<String, String>(),
      theme: fields[3] as ItemTheme,
      expenseType:
          fields[4] == null ? ExpenseType.variable : fields[4] as ExpenseType,
      isSaving: fields[5] == null ? false : fields[5] as bool,
      isRemoved: fields[6] == null ? false : fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(7)
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
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
