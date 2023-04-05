import 'package:flutter/material.dart';

class BottomNavigationBarInterface extends StatelessWidget {
  const BottomNavigationBarInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: "Home",
              backgroundColor: Colors.blueAccent,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.work_history,),
            label: "Applies",
            backgroundColor: Colors.blueAccent,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.inbox,),
            label: "Inbox",
            backgroundColor: Colors.blueAccent,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user,),
            label: "Profile",
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
