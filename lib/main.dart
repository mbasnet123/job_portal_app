import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:job_portal_app/screens/home_page.dart';
import 'package:job_portal_app/screens/my_drawer_header.dart';
import 'package:job_portal_app/widgets/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: const HomePage(),
    );
  }
}
