import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kikicall/screens/profileScreen.dart';
import 'package:kikicall/screens/videoConferencingScreen.dart';
import 'package:kikicall/variable.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int page = 0;

  List pageoptions = [
    VideoConferencingScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[250],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          selectedLabelStyle: mystyle(17, Colors.blue),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: mystyle(17, Colors.black),
          currentIndex: page,
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "video call",
              icon: Icon(
                Icons.video_call,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person,
                size: 32,
              ),
            ),
          ],
        ),
        body: pageoptions[page]);
  }
}
