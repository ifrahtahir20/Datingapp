import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/controller/authentication%20controller%20.dart';
import 'package:newproject/splashscreen.dart';
import 'Hive databse/Databox.dart';
import 'firstscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DataBox.getHiveFunction();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDjh4pS97sjX1in2Ppz8YHGPWPTUTdGQM4",
      appId: "1:16013407524:android:0cc8eeca6e156ba1066fb1",
      messagingSenderId: "16013407524",
      projectId: "assignment-7e782",
    ),
  ).then((value) {
    Get.put(AuthenticationController());
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: splashscreen(),
      ),
    );
  }
}
