import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Hive databse/Databox.dart';
import '../Hive databse/data record.dart';
import '../controller/authentication controller .dart';
import '../themes/themses.dart';
import 'auth_helper.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var authenticationcontroller = AuthenticationController.authController;
    return Container(
      padding: EdgeInsets.only(left: 20, top: 25, bottom: 5, right: 10),
      color: Color(0xFFFF91A4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: AuthHelper.getName(),
                builder: (context, snapshot) {
                  return TextFormat.bold(
                    text: "Hi ${snapshot.data ?? 'User'}, Let's start!!",
                    textColor: Colors.white,
                    fontWeight: FontWeight.w300,
                  );
                },
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: _buildUserImage(),
                )),
          ),
        ],
      ),
    );
  }

  ImageProvider<Object> _buildUserImage() {
    var userBox = DataBox.dataRecordBox(); // Use your DataBox to get the box
    Person? user =
        userBox.get('user_key'); // Replace 'user_key' with the actual key

    if (user != null && user.Dp != null) {
      return MemoryImage(user.Dp!);
    } else {
      // Provide a default image or placeholder if no image is available
      return AssetImage(
          'assets/images/anonymous.jpg'); // Replace with your default image path
    }
  }
}
