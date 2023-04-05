import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/my_drawer_header.dart';
import 'package:job_portal_app/screens/register_page.dart';
import 'package:job_portal_app/widgets/register_interface.dart';
import 'package:job_portal_app/widgets/bottom_navigation_bar_interface.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search Jobs",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        // automaticallyImplyLeading: false,
        ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              MyDrawerHeader(),
              // MyDrawerList(),
            ],
          ),
        ),
      ),
        // centerTitle: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                RegisterInterface(),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                        ),
                        );
                      },
                      child: const Text("Register"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                       child: const Text("Login"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    // bottomNavigationBar: const BottomNavigationBarInterface(),
    );
  }
}
