// import 'package:flutter/material.dart';
// import 'package:job_portal_app/screens/home_page.dart';
// import 'package:job_portal_app/screens/inbox_page.dart';
// import 'package:job_portal_app/screens/profile_page.dart';
// import 'package:job_portal_app/screens/applies_page.dart';
//
// class BottomNavigationBarInterface extends StatefulWidget {
//   const BottomNavigationBarInterface({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNavigationBarInterface> createState() =>
//       _BottomNavigationBarInterfaceState();
// }
//
// class _BottomNavigationBarInterfaceState
//     extends State<BottomNavigationBarInterface> {
//   List pages = [
//     const HomePage(),
//     const AppliesPage(),
//     const ProfilePage(),
//     const InboxPage(),
//   ];
//
//   int currentIndex = 0;
//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTap,
//         unselectedFontSize: 0,
//         selectedFontSize: 0,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         currentIndex: currentIndex,
//         selectedItemColor: Colors.black45,
//         unselectedItemColor: Colors.grey.withOpacity(0.5),
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         elevation: 0,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: "Home",
//             backgroundColor: Colors.blueAccent,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.work_history,
//             ),
//             label: "Applies",
//             backgroundColor: Colors.blueAccent,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.inbox,
//             ),
//             label: "Inbox",
//             backgroundColor: Colors.blueAccent,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.verified_user,
//             ),
//             label: "Profile",
//             backgroundColor: Colors.blueAccent,
//           ),
//         ],
//       ),
//     );
//   }
// }
