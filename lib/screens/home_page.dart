import 'package:flutter/material.dart';
import 'package:job_portal_app/models/Company.dart';
import 'package:job_portal_app/screens/company_authentication.dart';
import 'package:job_portal_app/screens/job_seeker_authentication.dart';
import 'package:job_portal_app/screens/login_page.dart';
import 'package:job_portal_app/screens/my_drawer_header.dart';
import 'package:job_portal_app/screens/register.dart';
import 'package:job_portal_app/screens/register_page.dart';
import 'package:job_portal_app/widgets/register_interface.dart';
import 'package:job_portal_app/widgets/bottom_navigation_bar_interface.dart';
import '../components/companies.dart';
import '../components/company_vertical.dart';
import 'package:job_portal_app/screens/search_page.dart';

import '../models/job_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(backgroundColor: Colors.white,
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
      ),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu,
              color: Colors.cyan,
            ),
          );
        }),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
            },
            child: Container
              (child: Text("Search Here", style: TextStyle(color: Colors.black),),),
          ),
        ),
        // automaticallyImplyLeading: false,
      ),
      // centerTitle: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              // Center(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => const RegisterPage(),
              //             ),
              //           );
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.black45,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //         ),
              //         child: const Text("Register"),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       ElevatedButton(
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => const LoginPage(),
              //             ),
              //           );
              //         },
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.redAccent,
              //           // primary: Color(Colors.redAccent),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //         ),
              //         child: const Text("Login"),
              //       ),
              //     ],
              //   ),
              // ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text("Company"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text("JobSeeker"),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const Divider(
                // color: Colors.grey,
                thickness: 8,
              ),
              // Center(
              //   child: SizedBox(
              //     height: 80,
              //     width: 80,
              //     child: Image.asset("assets/images/magnifying-glass.jpg"),
              //   ),
              // ),
              // const Center(
              //   child: Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text(
              //       "Get your dream job",
              //       style: TextStyle(
              //         fontSize: 20,
              //       ),
              //     ),
              //   ),
              // ),
              // const TextField(
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: "Enter skills",
              //     hintStyle: TextStyle(
              //       fontSize: 25,
              //       color: Colors.brown,
              //     ),
              //   ),
              // ),
              // const Divider(
              //   thickness: 3,
              // ),
              // const TextField(
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: "Enter Location",
              //     hintStyle: TextStyle(
              //       fontSize: 25,
              //       color: Colors.brown,
              //     ),
              //   ),
              // ),
              // const Divider(
              //   thickness: 3,
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //     ),
              //     child: const Text("Search Jobs"),
              //   ),
              // ),
              // Divider(
              //   thickness: 8,
              //   color: Colors.grey.shade100,
              // ),
              Row(
                children: [
                  const Text(
                    "Companies",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompanyVertical()),
                      );
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const CompanyList(),
            ],
          ),
        ),
      ),
    );
  }
}

