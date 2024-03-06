import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data record.dart';

class DataBox {
  static const String person = "person"; // defining box name

  //=====INITIALIZATION WORK ..(start)
  static Future<void> getHiveFunction() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(PersonAdapter());
    }
    if (!Hive.isBoxOpen(person)) {
      await Hive.openBox<Person>(person);
    }
  }

  //=====Getting box for crud operation   ..(start)
  static Box<Person> dataRecordBox() {
    return Hive.box(person);
  }

  static String getNewKey() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static Future<void> addUser({
    required String name,
    required String mobileNo,
    required String email,
    Uint8List? dp,
    String gender = '',
    String age = '',
    String maritalStatus = '',
    String education = '',
    String city = '',
    String height = '',
  }) async {
    final newKey = getNewKey();
    final newUser = Person(
      key: newKey,
      name: name,
      mobileno: mobileNo,
      email: email,
      Dp: dp,
      gender: gender,
      age: age,
      maritalStatus: maritalStatus,
      education: education,
      city: city,
      height: height,
    );
    await dataRecordBox().put(newKey, newUser);
  }

  // Edit an existing user account
  static Future<void> editUser({
    required String userKey,
    required String name,
    required String mobileNo,
    required String email,
    Uint8List? dp,
    String gender = '',
    String age = '',
    String maritalStatus = '',
    String education = '',
    String city = '',
    String height = '',
  }) async {
    final existingUser = dataRecordBox().get(userKey);
    if (existingUser != null) {
      final updatedUser = Person(
        key: userKey,
        name: name,
        mobileno: mobileNo,
        email: email,
        Dp: dp,
        gender: gender,
        age: age,
        maritalStatus: maritalStatus,
        education: education,
        city: city,
        height: height,
      );
      await dataRecordBox().put(userKey, updatedUser);
    }
  }

  // Delete an existing user account
  static Future<void> deleteUser(String userKey) async {
    await dataRecordBox().delete(userKey);
  }
}

// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'data record.dart';
//
// class DataBox {
//   static const String person = "person"; //definning box name
//   //=====INITIALIZATION WORK ..(start)
//   static GetHiveFunction() async {
//     await Hive.initFlutter();
//     if (!Hive.isAdapterRegistered(0)) {
//       Hive.registerAdapter(PersonAdapter());
//     }
//     if (!Hive.isBoxOpen(person)) {
//       await Hive.openBox<Person>(person);
//     }
//   }
//
//   //=====INITIALIZATION WORK ..(end)
//
//   //=====Getting box for crud operation   ..(start)
//   static Box<Person> DataRecordBox() {
//     return Hive.box(person);
//   }
//
//   static String GetNewKey() {
//     return DateTime.now().millisecondsSinceEpoch.toString();
//   }
//
//   static Future<void> addUser({
//     required String name,
//     required String mobileNo,
//     required String email,
//     Uint8List? dp,
//   }) async {
//     final newKey = GetNewKey();
//     final newUser = Person(
//       key: newKey,
//       name: name,
//       mobileno: mobileNo,
//       email: email,
//       Dp: dp,
//     );
//     await DataRecordBox().put(newKey, newUser);
//   }
//
//   // Edit an existing user account
//   static Future<void> editUser({
//     required String userKey,
//     required String name,
//     required String mobileNo,
//     required String email,
//     Uint8List? dp,
//   }) async {
//     final existingUser = DataRecordBox().get(userKey);
//     if (existingUser != null) {
//       final updatedUser = Person(
//         key: userKey,
//         name: name,
//         mobileno: mobileNo,
//         email: email,
//         Dp: dp,
//       );
//       await DataRecordBox().put(userKey, updatedUser);
//     }
//   }
//
//   // Delete an existing user account
//   static Future<void> deleteUser(String userKey) async {
//     await DataRecordBox().delete(userKey);
//   }
// }
