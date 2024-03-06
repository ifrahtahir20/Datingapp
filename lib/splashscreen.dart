import 'package:flutter/material.dart';
import 'package:newproject/dashboard.dart';
import 'package:newproject/firstscreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds (adjust the duration as needed)
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the next screen using Navigator
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => firstscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                //shape: BoxShape.circle,
                // color: Colors.grey,
                ),
            child: Image.asset(
              "assets/images/new.jpg",
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
