import 'package:flutter/material.dart';

import 'Login/LoginScreen.dart';
import 'Login/signup.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({Key? key}) : super(key: key);

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 600,
            height: 400,
            child: Image.asset(
              "assets/images/new.jpg",
              width: 700,
              height: 500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find your soul mate",
                style: TextStyle(
                    color: Color(0xFFFF91A4),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Wrap(children: [
                  Text(
                    "Match and chat with people you  ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                      fontSize: 20,
                    ),
                  ),
                ]),
                Wrap(children: [
                  Text(
                    " like from your area",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFFF91A4),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => signup()));
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Color(0xFFFF91A4),
                //   primary: Colors.transparent, // Make the button transparent
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50), // Optional: Adjust padding as needed
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFF91A4),
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                //primary: Colors.transparent, // Make the button transparent
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50), // Optional: Adjust padding as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
