import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(28.0),
          child: Text("This is profile page",
          style: TextStyle(color: Colors.black,
          fontSize: 20),),
        )
      ],
    );
  }
}
