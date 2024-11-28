// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemThemeAdapter extends TypeAdapter<ItemTheme> {
  @override
  final int typeId = 0;

  @override
  ItemTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemTheme(
      icon: fields[1] as IconData,
      color: fields[0] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, ItemTheme obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
