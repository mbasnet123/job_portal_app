import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/dummy_user.png"),
              ),

              SizedBox(
                width: 10,
              ),


              Text(
                "Build your profile",
                style: TextStyle(
                  fontWeight: FontWeight.w400,)   ,
              ),

            ],
          ),


          const SizedBox(
            height: 10,
          ),

          const Text("Job opportunities waiting for"
              " you at RojgaarApp"),
        ],
      ),

    );
  }
}
