import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              SizedBox(
                height: 90,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/dummy_user.png"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Build your profile\n\n Job opportunities\n waiting for"
                    " you at NepaJob",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Text("Job opportunities waiting for"
          //     " you at NepaJob"),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text("Search Jobs"),
            style: TextButton.styleFrom(
              primary: Colors.purpleAccent,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.chat),
            label: const Text("Chat for help"),
            style: TextButton.styleFrom(
              primary: Colors.purpleAccent,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.notes),
            label: const Text("NepaJob Blog"),
            style: TextButton.styleFrom(
              primary: Colors.purpleAccent,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.info),
            label: const Text("About us"),
            style: TextButton.styleFrom(
              primary: Colors.purpleAccent,
            ),
          ),
          const SizedBox(
            height: 140,
          ),
          const Text(
            "Version  1.1.1",
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
