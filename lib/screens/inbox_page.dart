import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(28.0),
          child: Text(
            "This is Inbox page",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
