// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************



import 'package:hive/hive.dart';

import 'class_topic.dart';

class topicAdapter extends TypeAdapter<topic> {
  @override
  final int typeId = 0;

  @override
  topic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return topic(
      name: fields[0] as String,
      done: fields[1] as bool,
      language: fields[2] as String,
      details: (fields[3] as List).cast<Details>(),
    );
  }

  @override
  void write(BinaryWriter writer, topic obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.done)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is topicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetailsAdapter extends TypeAdapter<Details> {
  @override
  final int typeId = 1;

  @override
  Details read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Details(
      details: fields[1] as String,
      topicName: fields[0] as String,
      url: fields[2] as String,
      code: fields[3] as String,
      error: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Details obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.topicName)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.error);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
