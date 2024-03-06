// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:newproject/tabscreens/favouritescreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomeScreen extends StatefulWidget {
//   static const String path = '/home_view';
//   static const String name = 'home';
//
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => HomeScreenController();
// }
//
// class HomeScreenController extends State<HomeScreen> {
//   late TextEditingController searchController;
//   // late LocationBloc locationBloc = serviceLocator<LocationBloc>();
//  // final refreshController = RefreshController(initialRefresh: true);
//
//   String name = '';
//   String mobileno = '';
//   String email = '';
//   String Dp = '';
//   String Uid = '';
//
//   @override
//   void initState() {
//     super.initState();
//     searchController = TextEditingController();
//     SharedPreferences.getInstance().then((pref) {
//       setState(() {
//         name = pref.getString('firstName') ?? '';
//         mobileno = pref.getString('mobileno') ?? '';
//         email = pref.getString('email') ?? '';
//         Dp = pref.getString('ProfilePicture') ?? '';
//         Uid = pref.getString('') ?? '';
//       });
//     });
//     // Timer.periodic(nearbyUsers, (timer) {
//     //   locationBloc.getCurrentPosition();
//     //   sendLocation();
//     //   debugPrint(locationBloc.state.lastKnownLocation?.latitude.toString());
//     // });
//   }
//
//   @override
//   void dispose() {
//     searchController.dispose();
//    // refreshController.dispose();
//     super.dispose();
//   }
//
//   // onRefresh() {
//   //   context.read<FetchUserBloc>().add(const FetchUserEvent.fetchNearbyUsers());
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return favouritesScreen();
//   }
// }
