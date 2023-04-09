import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/login_page.dart';
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
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Padding(
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
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text("Register"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        // primary: Color(Colors.redAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 8,
              ),
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("assets/images/magnifying-glass.jpg"),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Get your dream job",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter skills",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.brown,
                  ),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Location",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.brown,
                  ),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text("Search Jobs"),
              ),
              Divider(
                thickness: 8,
                color: Colors.grey.shade100,
              ),
              const Text(
                "Companies",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              // ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: const [
              //     Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text(
              //         "One",
              //         style: TextStyle(
              //           fontSize: 5,
              //         ),
              //       ),
              //     ),
              //
              //     Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text(
              //         "Two",
              //         style: TextStyle(
              //           fontSize: 5,
              //         ),
              //       ),
              //     ),
              //
              //     Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text(
              //         "Three",
              //         style: TextStyle(
              //           fontSize: 5,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavigationBarInterface(),
    );
  }
}
