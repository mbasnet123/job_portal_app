import 'package:flutter/material.dart';

class AppliesPage extends StatelessWidget {
  const AppliesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(36.0),
          child: Text("This is Applies page",
          style: TextStyle(color: Colors.black,
          fontSize: 20),),
        )
      ],
    );
  }
}