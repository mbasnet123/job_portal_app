import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/dummy_user.png"),
        ),
        Text(
          "Build your profile",
          style: TextStyle(
            fontWeight: FontWeight.w400,)   ,
        ),
        Text("Job opportunities waiting for"
            " you at RojgaarApp"),
      ],
    );
  }
}
