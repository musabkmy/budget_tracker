import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class IconDataAdapter extends TypeAdapter<IconData> {
  @override
  final int typeId = 7; // Define a unique typeId for this adapter.

  @override
  IconData read(BinaryReader reader) {
    return IconData(
      reader.readInt32(),
      fontFamily: reader.readString(), // This can return null if not provided
      fontPackage: reader.readString(), // This can return null if not provided
      matchTextDirection: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, IconData obj) {
    writer.writeInt32(obj.codePoint);
    writer.writeString(
        obj.fontFamily ?? ''); // Handle null by using a fallback value
    writer.writeString(
        obj.fontPackage ?? ''); // Handle null by using a fallback value
    writer.writeBool(obj.matchTextDirection);
  }
}
