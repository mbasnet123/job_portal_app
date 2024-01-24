import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_app/models/firestore_helper.dart';
import 'package:job_portal_app/models/job_model.dart';
import 'package:job_portal_app/widgets/edit_page.dart';

import 'applied_jobs_page.dart';
import 'download_pdf.dart';
import 'login.dart';

class CompanyAuth extends StatefulWidget {
  final String companyEmail;
  const CompanyAuth({Key? key, required this.companyEmail}) : super(key: key);

  @override
  State<CompanyAuth> createState() => _CompanyAuthState();
}

class _CompanyAuthState extends State<CompanyAuth> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  @override
  void dispose() {
    _positionController.dispose();
    _companyNameController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<User?>(
          future: FirebaseAuth.instance.authStateChanges().first,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData && snapshot.data != null) {
              return Text(snapshot.data!.email ?? "Company");
            } else {
              return const Text("Company");
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _positionController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "position",
                  suffixIcon: _positionController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _positionController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                onChanged: (_) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]{3,20}[0-9]{0,1}').hasMatch(value!)) {
                    return "Position can have text with one number";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _companyNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "company",
                  suffixIcon: _companyNameController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _companyNameController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                onChanged: (_) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z]{3,20}[0-9]?[a-zA-Z]{0,17}$')
                          .hasMatch(value!)) {
                    return "Company name can have text with 1 number";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _salaryController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "salary",
                  suffixIcon: _salaryController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _salaryController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                onChanged: (_) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[0-9]{4,10}').hasMatch(value!)) {
                    return "can be numbers less than 10 and greater than 4 places";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Submitting data"),
                          ),
                        );
                        FirestoreHelper.add(
                          JobModel(
                              companyName: _companyNameController.text,
                              position: _positionController.text,
                              salary: _salaryController.text,
                              id: '', companyEmail: ''),
                        );
                        _salaryController.clear();
                        _positionController.clear();
                        _companyNameController.clear();
                        // _add();
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.cyanAccent,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Add Job",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AppliedJobsPage();
                          },
                        ),
                      );
                    },
                    child: const Text("Applied positions"),
                  ),
                  const SizedBox(width: 10,),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DownloadPdf();
                          },
                        ));
                      },
                      child: Text("Pdf")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text("Job Applications"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     if (formKey.currentState!.validate()) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //           const SnackBar(content: Text("Submitting data")));
              //       _apply();
              //
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => AppliedJobsPage()),
              //       );
              //     }
              //   },
              //   child: const Text("Job applications"),
              // ),

              const SizedBox(
                height: 10,
              ),
              // StreamBuilder<List<JobModel>>(
              //     // stream: FirestoreHelper.read(),
              //     stream: FirestoreHelper.read()
              //         .where('companyEmail', isEqualTo: FirebaseAuth.instance.currentUser?.email),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection('jobs')
                      .where('companyEmail', isEqualTo: FirebaseAuth.instance.currentUser?.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError  || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("some error occurred"),
                      );
                    }
                    if (snapshot.hasData) {
                      // final jobData = snapshot.data;
                      final jobData = snapshot.data!.docs.map((doc) => JobModel.fromSnapshot(doc)).toList();

                      return Expanded(
                        child: ListView.builder(
                            itemCount: jobData!.length,
                            itemBuilder: (context, index) {
                              final singleJob = jobData[index];
                              return SingleChildScrollView(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: ListTile(
                                    onLongPress: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Delete"),
                                              content: const Text(
                                                  "are you sure you want to delete"),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      FirestoreHelper.delete(
                                                              singleJob)
                                                          .then((value) {
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    child:
                                                        const Text("Delete")),
                                              ],
                                            );
                                          });
                                    },
                                    leading: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                          color: Colors.lime,
                                          shape: BoxShape.circle),
                                    ),
                                    title: Text("${singleJob.companyName}"),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${singleJob.position}"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text("\$"),
                                            Text("${singleJob.salary}"),
                                          ],
                                        )
                                      ],
                                    ),
                                    trailing: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditPage(
                                                job: JobModel(
                                                    position:
                                                        singleJob.position,
                                                    companyName:
                                                        singleJob.companyName,
                                                    salary: singleJob.salary,
                                                    id: singleJob.id, companyEmail: ''),
                                              ),
                                            ));
                                      },
                                      child: const Icon(Icons.edit),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  // Future _add() async{
  //   final jobCollection = FirebaseFirestore.instance.collection("jobs");
  //
  //   final docRef = jobCollection.doc('jobId');
  //
  //   await docRef.set({
  //     "position": _positionController.text,
  //     "company" : _companyController.text,
  //     "salary" : _salaryController.text,
  //   });
  // }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(role: '',),
      ),
    );
  }
}

// class _apply {}
