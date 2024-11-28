// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'head_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HeadCategoryAdapter extends TypeAdapter<HeadCategory> {
  @override
  final int typeId = 3;

  @override
  HeadCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HeadCategory(
      id: fields[0] as String,
      localizedNames: (fields[1] as Map).cast<String, String>(),
      showList: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HeadCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.localizedNames)
      ..writeByte(2)
      ..write(obj.showList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeadCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
