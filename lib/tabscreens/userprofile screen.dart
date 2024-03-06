import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newproject/Login/signup.dart';
import 'package:newproject/firstscreen.dart';
import '../controller/authentication controller .dart';
import 'Aaccount detail.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding:
                  EdgeInsets.only(left: 15, right: 10, bottom: 10, top: 10),
              child: Text(
                "My Profile",
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: authenticationController.pickedfile.value != null
                          ? FileImage(
                              authenticationController.pickedfile.value!)
                          : AssetImage('assets/default_avatar.png')
                              as ImageProvider,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 135,
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              width: 50,
                              height: 50,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    child: Icon(
                                      Icons.camera_alt_sharp,
                                      size: 50,
                                    ),
                                    onTap: () async {
                                      await authenticationController
                                          .captureImageFileFromCamera();
                                      setState(() {
                                        authenticationController.pickedfile;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.photo,
                                      size: 50,
                                    ),
                                    onTap: () async {
                                      await authenticationController
                                          .pickImageFromGallery();
                                      setState(() {
                                        authenticationController.pickedfile;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF91A4),
                      ),
                      child: Icon(Icons.camera_alt_sharp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    authenticationController.pickedfile.value != null
                        ? authenticationController.currentUser.value?.name ??
                            '' // Replace with the actual logic to get the user's name
                        : "User Name",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountDetailsScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Account Details",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => signup(
                              dataRecord:
                                  authenticationController.currentUser.value,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.edit_outlined),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Edit Account",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  deleteAccount();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Delete Account",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFF91A4),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => firstscreen()));
                    setState(() {});
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xFFFF91A4),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Account"),
          content: Text("Are you sure you want to delete your account?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await deleteAccount();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteAccount() async {
    try {
      // Delete the user account using Firebase Authentication
      await FirebaseAuth.instance.currentUser?.delete();

      // Navigate to a screen indicating successful deletion
      navigateToDeletionSuccessScreen();
    } catch (e) {
      // Handle deletion failure (e.g., display an error message)
      showDeletionFailureMessage();
    }
  }

  // ... (existing code)

  void navigateToDeletionSuccessScreen() {
    // Implement navigation logic for deletion success
  }

  void showDeletionFailureMessage() {
    // Implement logic to display an error message for deletion failure
  }
}
