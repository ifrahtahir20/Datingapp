import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/controller/authentication%20controller%20.dart';
import 'package:newproject/Login/LoginScreen.dart';

import '../Hive databse/data record.dart';

class signup extends StatefulWidget {
  Person? dataRecord;
  signup({this.dataRecord});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var name = TextEditingController();
  var PhoneNo = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var genderController = TextEditingController();
  var ageController = TextEditingController();
  var maritalStatusController = TextEditingController();
  var educationController = TextEditingController();
  var cityController = TextEditingController();
  var heightController = TextEditingController();
  bool showProgressBar = false;
  var authenticationcontroller = AuthenticationController.authController;
  void initState() {
    if (widget.dataRecord != null) {
      setState(() {
        name.text = widget.dataRecord!.name!;
        PhoneNo.text = widget.dataRecord!.mobileno!;
        emailController.text = widget.dataRecord!.email!;
        genderController.text = widget.dataRecord!.gender!;
        ageController.text = widget.dataRecord!.age!;
        maritalStatusController.text = widget.dataRecord!.maritalStatus!;
        educationController.text = widget.dataRecord!.education!;
        cityController.text = widget.dataRecord!.city!;
        heightController.text = widget.dataRecord!.height!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
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
                "${widget.dataRecord != null ? "Update" : "Create New"} Account!",
                style: TextStyle(
                  color: Color(0xFFFF91A4),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Profile Image
            authenticationcontroller.imageFile == null
                ? Stack(
                    children: [
                      const CircleAvatar(
                        radius: 85,
                        backgroundImage:
                            AssetImage("assets/images/anonymous.jpg"),
                        backgroundColor: Colors.black87,
                      ),
                      Positioned(
                        top: 120,
                        left: 115,
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
                                            await authenticationcontroller
                                                .captureImageFileFromCamera();
                                            setState(() {
                                              authenticationcontroller
                                                  .imageFile;
                                            });
                                          },
                                        ),
                                        InkWell(
                                          child: Icon(
                                            Icons.photo,
                                            size: 50,
                                          ),
                                          onTap: () async {
                                            await authenticationcontroller
                                                .pickImageFromGallery();
                                            setState(() {
                                              authenticationcontroller
                                                  .imageFile;
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
                  )
                : Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: FileImage(
                                File(authenticationcontroller.imageFile!.path)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 130,
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
                                            await authenticationcontroller
                                                .captureImageFileFromCamera();
                                            setState(() {
                                              authenticationcontroller
                                                  .imageFile;
                                            });
                                          },
                                        ),
                                        InkWell(
                                          child: Icon(
                                            Icons.photo,
                                            size: 50,
                                          ),
                                          onTap: () async {
                                            await authenticationcontroller
                                                .pickImageFromGallery();
                                            setState(() {
                                              authenticationcontroller
                                                  .imageFile;
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
              height: 30,
            ),
            // Name
            Container(
              width: 350,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Phone Number
            SizedBox(height: 10),
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: PhoneNo,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Email Address
            SizedBox(height: 10),
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  hintText: 'Email Address',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Password
            SizedBox(height: 10),
            Container(
              width: 350,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Confirm Password
            SizedBox(height: 10),
            // Gender
            SizedBox(height: 10),
            Container(
              width: 350,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: TextFormField(
                controller: genderController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Gender',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Age
            SizedBox(height: 10),
            Container(
              width: 350,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Age',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Marital Status
            SizedBox(height: 10),
            Container(
              width: 350,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: TextFormField(
                controller: maritalStatusController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Marital Status',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Education
            SizedBox(height: 10),
            Container(
              width: 350,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: TextFormField(
                controller: educationController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Education',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // City
            SizedBox(height: 10),
            Container(
              width: 350,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  hintText: 'City',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            // Height
            SizedBox(height: 10),
            Container(
              width: 350,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: TextFormField(
                controller: heightController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height),
                  hintText: 'Height',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      width: 5,
                      style: BorderStyle.none,
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Sign Up Button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  if (authenticationcontroller.imageFile != null) {
                    if (name.text.trim().isNotEmpty &&
                        PhoneNo.text.trim().isNotEmpty &&
                        emailController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty) {
                      setState(() {
                        showProgressBar = true;
                      });
                      await authenticationcontroller.createNewAccount(
                        authenticationcontroller.profileImage!,
                        name.text.trim(),
                        PhoneNo.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        genderController.text.trim(),
                        ageController.text.trim(),
                        maritalStatusController.text.trim(),
                        educationController.text.trim(),
                        cityController.text.trim(),
                        heightController.text.trim(),
                      );
                      setState(() {
                        showProgressBar = false;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                        Get.snackbar(
                            "Account created", " Sign in to continue!!");
                      });
                    } else {
                      Get.snackbar("Field is empty", " Fill all the fields!!");
                    }
                  } else {
                    Get.snackbar("Image", " Missing!!");
                  }
                },
                child: Text(
                  "${widget.dataRecord != null ? "Update" : "Sign Up"} ",
                  // "Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Progress Indicator
            Row(
              children: [
                showProgressBar == true
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
