import 'dart:async';

import 'package:flutter/material.dart';

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

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigationBarInterface(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.all(60.0),
        child: Center(
          child: Text(
            "Nepajob",
            style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
