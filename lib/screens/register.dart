import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/home_page.dart';
import 'login.dart';
import 'package:email_validator/email_validator.dart';
// import 'model.dart';

class Register extends StatefulWidget {
  final String role;
  Register({required this.role});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
  new TextEditingController();
  // final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;

  String? validateEmail(String? value) {
    if (!EmailValidator.validate(value!)) {
      return 'Please enter a valid email address';
    }

    if (value!.length == 0) {
      return "Email cannot be empty";
    }
    if (!RegExp(
        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return ("Please enter a valid email");
    }

    // Define allowed email providers
    const allowedProviders = ['gmail.com', 'outlook.com', 'icloud.com'];

    final emailParts = value.split('@');
    if (!allowedProviders.contains(emailParts[1])) {
      return 'Please use a valid email provider (e.g., Gmail, Outlook, Apple Mail)';
    }

    return null; // Email is valid
  }

  // var options = [
  //   'Company',
  //   'JobSeeker',
  // ];
  // var _currentItemSelected = "Company";
  // var role = "Company";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.cyan,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const Text(
                          "Register Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // TextFormField(
                        //   controller: nameController,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     hintText: 'Name',
                        //     enabled: true,
                        //     contentPadding: const EdgeInsets.only(
                        //         left: 14.0, bottom: 8.0, top: 8.0),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: new BorderSide(color: Colors.white),
                        //       borderRadius: new BorderRadius.circular(20),
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: new BorderSide(color: Colors.white),
                        //       borderRadius: new BorderRadius.circular(20),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                          validator: validateEmail,
                          //     (value) {
                          //   if (value!.length == 0) {
                          //     return "Email cannot be empty";
                          //   }
                          //   if (!RegExp(
                          //       "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          //       .hasMatch(value)) {
                          //     return ("Please enter a valid email");
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password did not match";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     const Text(
                        //       "role : ",
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     DropdownButton<String>(
                        //       dropdownColor: Colors.blue[900],
                        //       isDense: true,
                        //       isExpanded: false,
                        //       iconEnabledColor: Colors.white,
                        //       focusColor: Colors.white,
                        //       items: options.map((String dropDownStringItem) {
                        //         return DropdownMenuItem<String>(
                        //           value: dropDownStringItem,
                        //           child: Text(
                        //             dropDownStringItem,
                        //             style: const TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 20,
                        //             ),
                        //           ),
                        //         );
                        //       }).toList(),
                        //       onChanged: (newValueSelected) {
                        //         setState(() {
                        //           _currentItemSelected = newValueSelected!;
                        //           role = newValueSelected;
                        //         });
                        //       },
                        //       value: _currentItemSelected,
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                setState(() {
                                  showProgress = true;
                                });
                                signUp(
                                    // nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    // role
                                );
                              },
                              color: Colors.white,
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(
      // String name,
      String email, String password,
      // String role
      ) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(
          email: email, password: password)
          .then((value) {
            User? user = _auth.currentUser;
            // user!.updateDisplayName(name);
            return {postDetailsToFirestore(
                // name,
                email
                // ,role
            )};
          })
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(
      // String name,
      String email,
      // String role
      ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set(
        {
          // 'name' : nameController.text,
          'email': emailController.text,
          // 'role': role,
          'role': widget.role});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage(role: widget.role,)));
  }
}
