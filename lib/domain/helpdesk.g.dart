// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpdesk.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HelpDeskAdapter extends TypeAdapter<HelpDesk> {
  @override
  final int typeId = 1;

  @override
  HelpDesk read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HelpDesk(
      status: fields[0] as String,
      helpDesk: (fields[1] as List).cast<HelpDeskElement>(),
    );
  }

  @override
  void write(BinaryWriter writer, HelpDesk obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.helpDesk);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HelpDeskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HelpDeskElementAdapter extends TypeAdapter<HelpDeskElement> {
  @override
  final int typeId = 2;

  @override
  HelpDeskElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HelpDeskElement(
      locId: fields[0] as String,
      locationName: fields[1] as String,
      locationUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HelpDeskElement obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.locId)
      ..writeByte(1)
      ..write(obj.locationName)
      ..writeByte(2)
      ..write(obj.locationUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HelpDeskElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
