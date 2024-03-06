import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/dashboard.dart';

import 'Google sign In.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool showProgressBar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 15, right: 10, bottom: 20, top: 20),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.pinkAccent.shade200,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 350,
            padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: "E-mail Address",
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          width: 5,
                          style: BorderStyle.none,
                          color: Colors.grey.shade50))),
            ),
          ),
          Container(
            width: 350,
            padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
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
                          color: Colors.grey.shade50,
                          style: BorderStyle.none))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.pinkAccent.shade200,
              // gradient: LinearGradient(colors: [
              //   Color.fromRGBO(143, 148, 251, 1),
              //   Color.fromRGBO(143, 148, 251, .6),
              // ])
            ),
            child: ElevatedButton(
              onPressed: () {
                String email = emailController.text.toString();
                String password = passwordController.text.toString();
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((value) {
                  print("Login sucessfully");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                }).onError((error, stackTrace) {
                  bool loginSuccessful = false;
                  if (!loginSuccessful) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Incorrect username or password'),
                      ),
                    );
                  }
                  print("Login error: ${error.toString()}");
                });
              },
              child: Text(
                "Log In",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor:
                    Colors.transparent, // Make the button transparent
                padding: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 80), // Optional: Adjust padding as needed
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(143, 148, 251, 1),
                  Color.fromRGBO(143, 148, 251, .6),
                ])),
            child: ElevatedButton(
              onPressed: () async {
                await GoogleSignInService().signInWithGoogle();
                print("Gmail Login sucessfully");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/googlelogo.jpg",
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Login with Gmail",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor:
                    Colors.transparent, // Make the button transparent
                padding: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 80), // Optional: Adjust padding as needed
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          showProgressBar == true
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                )
              : Container(),
          SizedBox(
            height: 30,
          ),
          // Container(
          //   color: Colors.white70,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "Don't have account? ",
          //       ),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       // Container(
          //       //   decoration: BoxDecoration(
          //       //       borderRadius: BorderRadius.circular(2),
          //       //       gradient: LinearGradient(colors: [
          //       //         Color.fromRGBO(143, 148, 251, 1),
          //       //         Color.fromRGBO(143, 148, 251, .6),
          //       //       ])),
          //       //   child: ElevatedButton(
          //       //     onPressed: () {
          //       //       Navigator.push(context,
          //       //           MaterialPageRoute(builder: (context) => signup()));
          //       //     },
          //       //     child: Text(
          //       //       "Signup",
          //       //       style: TextStyle(
          //       //           fontSize: 18,
          //       //           color: Colors.white,
          //       //           fontWeight: FontWeight.bold),
          //       //     ),
          //       //     style: ElevatedButton.styleFrom(
          //       //       shape: RoundedRectangleBorder(
          //       //         borderRadius: BorderRadius.circular(0),
          //       //       ),
          //       //       primary:
          //       //           Colors.transparent, // Make the button transparent
          //       //       padding:
          //       //           EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          //       //     ),
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // InkWell(
          //   onTap: () {
          //     // anotherway();
          //   },
          //   child: Text("Try another way!"),
          // )
        ],
      ),
    );
  }
}
