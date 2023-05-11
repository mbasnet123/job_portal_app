import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
                }, icon: const Icon(Icons.arrow_back)),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 40, top: 80),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          const SizedBox(
            height: 40,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 150, left: 10,right: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          TextButton(onPressed: (){},
              child: const Text("Forget Password"),),

        ],
      ),
    );
  }
}
