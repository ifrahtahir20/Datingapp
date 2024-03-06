// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 0;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      key: fields[1] as dynamic,
      Dp: fields[2] as Uint8List?,
      name: fields[3] as String?,
      mobileno: fields[4] as String?,
      email: fields[5] as String?,
      gender: fields[6] as String?,
      age: fields[7] as String?,
      maritalStatus: fields[8] as String?,
      education: fields[9] as String?,
      city: fields[10] as String?,
      height: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.Dp)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.mobileno)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.age)
      ..writeByte(8)
      ..write(obj.maritalStatus)
      ..writeByte(9)
      ..write(obj.education)
      ..writeByte(10)
      ..write(obj.city)
      ..writeByte(11)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
