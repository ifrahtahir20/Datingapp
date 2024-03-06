import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:newproject/dashboard.dart';
import 'package:newproject/firstscreen.dart';

import '../Hive databse/Databox.dart';
import '../Hive databse/data record.dart';
import '../Model class/person info.dart' as PersonModel;

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();
  late Rx<File?> pickedfile;
  late Rx<User?> firebaseCurrentUser;
  XFile? imageFile;
  File? get profileImage => pickedfile.value;
  late Box<Person> _personBox;
  late Rx<Person?> currentUser;
  @override
  void onInit() {
    super.onInit();
    DataBox.getHiveFunction();
    _personBox = DataBox.dataRecordBox();
    currentUser = Rx<Person?>(null);
  }

  pickImageFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "You have sucessfully picked your profile picture");
    }
    pickedfile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFileFromCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      Get.snackbar("Profile Image",
          "You have sucessfully captured your picture using camera");
    }
    pickedfile = Rx<File?>(File(imageFile!.path));
  }

  createNewAccount(
    File Dp,
    String name,
    String mobileno,
    String email,
    String password,
    String gender,
    String age,
    String maritalStatus,
    String education,
    String city,
    String height,
  ) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String userKey = DateTime.now().millisecondsSinceEpoch.toString();
      Uint8List? dpBytes = await Dp.readAsBytes();
      final newUser = Person(
        key: userKey,
        name: name,
        mobileno: mobileno,
        email: email,
        Dp: dpBytes,
        gender: gender,
        age: age,
        maritalStatus: maritalStatus,
        education: education,
        city: city,
        height: height,
      );

      await _personBox.put(userKey, newUser);
      currentUser.value = newUser;
      Get.snackbar("Account created", "Congratulations!!");

      //  Get.to(Dashboard());
    } catch (e) {
      Get.snackbar(
          'Account creation error!!', 'Error occured:${e.toString()} ');
      print("Account creation error: ${e.toString()}");
    }
  }
}
