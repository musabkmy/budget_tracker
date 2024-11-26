// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'styled_text_key.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StyledTextKeyAdapter extends TypeAdapter<StyledTextKey> {
  @override
  final int typeId = 1;

  @override
  StyledTextKey read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StyledTextKey(
      styledText: fields[0] as String,
      isBold: fields[1] as bool,
      isItalic: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StyledTextKey obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.styledText)
      ..writeByte(1)
      ..write(obj.isBold)
      ..writeByte(2)
      ..write(obj.isItalic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyledTextKeyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
