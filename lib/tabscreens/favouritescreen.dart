import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:hive/hive.dart';
import 'package:newproject/controller/authentication controller .dart';
import 'package:newproject/tabscreens/detail%20info.dart';

import '../Hive databse/Databox.dart';
import '../Hive databse/data record.dart';

class favouritesScreen extends StatefulWidget {
  final List<User>? favoriteProfiles; // List of favorite profiles

  const favouritesScreen({Key? key, this.favoriteProfiles}) : super(key: key);

  @override
  State<favouritesScreen> createState() => _favouritesScreenState();
}

class _favouritesScreenState extends State<favouritesScreen> {
  var authenticationcontroller = AuthenticationController.authController;
  late Box<Person> _personBox;

  @override
  void initState() {
    super.initState();
    DataBox.getHiveFunction(); // Ensure Hive is initialized
    _personBox = DataBox.dataRecordBox();
  }

  Future<List<String>> _loadUserKeys() async {
    List<String> keys = _personBox.keys.cast<String>().toList();

    // Get the current user's details from Firebase Authentication
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Exclude the current user's key by comparing email addresses
      String currentUserEmail = currentUser.email ?? "";
      keys.removeWhere((key) {
        Person user = _personBox.get(key) as Person;
        return user.email == currentUserEmail;
      });
    }

    return keys;
  }

  void showUserDetails(String userKey) {
    Person user = DataBox.dataRecordBox().get(userKey) as Person;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFF91A4),
        title: Text(
          "Let's find your match!",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<String>>(
              future: _loadUserKeys(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<String> cards = snapshot.data as List<String>;
                  print('Snapshot data: ${snapshot.data}');

                  return CardSwiper(
                    numberOfCardsDisplayed: 1,
                    cardsCount: cards.length,
                    cardBuilder:
                        (context, index, percentThresholdX, percentThresholdY) {
                      String userKey = cards[index];
                      Person user = _personBox.get(userKey) as Person;

                      return GestureDetector(
                        onTap: () {
                          showUserDetails(userKey);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: user.Dp != null
                                  ? MemoryImage(user.Dp!)
                                  : AssetImage('assets/default_avatar.png')
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
