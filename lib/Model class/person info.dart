import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  String? Uid;
  String? Dp;
  String? name;
  String? mobileno;
  String? email;
  String? password;

  Person(
      {this.Uid, this.Dp, this.name, this.mobileno, this.email, this.password});
  static Person fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return Person(
      Uid: dataSnapshot["Uid"],
      name: dataSnapshot["name"],
      Dp: dataSnapshot["Dp"],
      mobileno: dataSnapshot["mobileno"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Uid": Uid,
        "Dp": Dp,
        "name": name,
        "mobileno": mobileno,
        "email": email,
        "password": password,
      };
}
