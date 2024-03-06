import 'package:flutter/material.dart';
import 'package:newproject/tabscreens/favouritescreen.dart';
import 'package:newproject/tabscreens/homeappbar.dart';
import 'package:newproject/tabscreens/searchscreen.dart';
import 'package:newproject/tabscreens/userprofile%20screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int screenIndex = 0;
  List TabScreenList = [
    favouritesScreen(),
    SearchScreen(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber) {
          setState(() {
            screenIndex = indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFF91A4),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: screenIndex,
        items: [
          BottomNavigationBarItem(
            label: "Favourites",
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "User Detail",
            icon: Icon(
              Icons.person,
              size: 30,
            ),
          )
        ],
      ),
      body: TabScreenList[screenIndex],
    );
  }
}
