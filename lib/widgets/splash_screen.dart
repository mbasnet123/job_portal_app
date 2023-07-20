import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/home_page.dart';

import 'bottom_navigation_bar_interface.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const
          BottomNavigationBarInterface(),
          // HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "Nepajob",
            //   style: TextStyle(
            //       fontSize: 35,
            //       color: Colors.white,
            //       fontWeight: FontWeight.w700),
            // ),
            Image(
              image: AssetImage(
                "assets/images/nepaJob_logo.png",
              ),
              height: 250,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
