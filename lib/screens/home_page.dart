import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/my_drawer_header.dart';
import 'package:job_portal_app/screens/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,


        flexibleSpace: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: size.width*0.2,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),)
                ),
                suffixText: "Search Jobs",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
                height: 1.0,
                color: Colors.grey.withOpacity(0.5),
          ),
        ),

        ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: SingleChildScrollView(
          child: Container(
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
        // centerTitle: true,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
          )
        ],
      ),

    );
  }
}
