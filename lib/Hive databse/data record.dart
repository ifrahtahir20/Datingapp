import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'data record.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(1)
  dynamic key;
  @HiveField(2)
  Uint8List? Dp;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? mobileno;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? gender;
  @HiveField(7)
  String? age;
  @HiveField(8)
  String? maritalStatus;
  @HiveField(9)
  String? education;
  @HiveField(10)
  String? city;
  @HiveField(11)
  String? height;

  Person({
    this.key,
    this.Dp,
    this.name,
    this.mobileno,
    this.email,
    this.gender,
    this.age,
    this.maritalStatus,
    this.education,
    this.city,
    this.height,
  });
}
