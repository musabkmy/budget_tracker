// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_text.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StyledTextAdapter extends TypeAdapter<StyledText> {
  @override
  final int typeId = 2;

  @override
  StyledText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StyledText(
      fullText: fields[0] as String,
      styledTextKeys: (fields[1] as List).cast<StyledTextKey>(),
    );
  }

  @override
  void write(BinaryWriter writer, StyledText obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fullText)
      ..writeByte(1)
      ..write(obj.styledTextKeys.toList());
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyledTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
