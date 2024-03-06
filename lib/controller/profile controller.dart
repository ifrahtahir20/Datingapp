import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Model class/person info.dart';

class ProfileController extends GetxController {
  final Rx<List<Person>> userProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => userProfileList.value;
  @override
  void onInit() {
    super.onInit();
    userProfileList.bindStream(FirebaseFirestore.instance
        .collection("users")
        .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((QuerySnapshot queryDataSnapshot) {
      List<Person> profileList = [];
      for (var eachProfile in queryDataSnapshot.docs) {
        profileList.add(Person.fromDataSnapshot(eachProfile));
      }
      return profileList;
    }));
  }
}
