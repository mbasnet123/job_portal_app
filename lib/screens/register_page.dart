import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
         body: Padding(
           padding: const EdgeInsets.all(16.0),
           child: SingleChildScrollView(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(
                   // width: size.width*0.5,
                   // height: size.height*0.1,
                   child: IconButton(
                       onPressed: () {
                         Navigator.push(
                           context, MaterialPageRoute(
                           builder: (context) => const HomePage(),
                         ),
                         );
                       },
                       icon: const Icon(Icons.arrow_back)),
                 ),
                 SizedBox(
                   width: size.width*0.7,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: const [
                       Text("This is register page",
                         style: TextStyle(
                           fontSize: 12,
                           color: Colors.blue,
                         ),
                       ),
                     ],
                   ),
                 ),

               ],
             ),
           ),
         ),
       ),
          // SingleChildScrollView(
          //   child: SizedBox(
          //     width: size.width*0.1,
          //     child: TextFormField(
          //       decoration: const InputDecoration(
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(3),
          //           ),
          //         )
          //       ),
          //     ),
          //   ),
          // ),
      );
  }
}
