import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/applies_page.dart';

import '../models/firestore_helper.dart';
import '../models/job_model.dart';
import '../widgets/edit_page.dart';
import 'login.dart';

class JobSeekerAuth extends StatefulWidget {
  const JobSeekerAuth({Key? key}) : super(key: key);

  @override
  State<JobSeekerAuth> createState() => _JobSeekerAuthState();
}

class _JobSeekerAuthState extends State<JobSeekerAuth> {
  List<String> appliedJobIds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Seeker"),
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
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Text("Jobs"),
            StreamBuilder<List<JobModel>>(
                stream: FirestoreHelper.read(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("some error occurred"),
                    );
                  }
                  if (snapshot.hasData) {
                    final jobData = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: jobData!.length,
                          itemBuilder: (context, index) {
                            final singleJob = jobData[index];
                            if (appliedJobIds.contains(singleJob.jobId)) {
                              return Container();
                            } else {
                              return SingleChildScrollView(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: ListTile(
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
                                    trailing: TextButton(
                                        child: Text("Apply"),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AppliesPage(),
                                              ));
                                        }),
                                  ),
                                ),
                              );
                            }
                          }),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            // Text("Applied jobs"),
            // StreamBuilder<List<String>>(
            //     stream: FirebaseFirestore.instance
            //         .collection('appliedJobs')
            //         .doc(FirebaseAuth.instance.currentUser!.uid)
            //         .collection('jobs')
            //         .snapshots()
            //         .map((snapshot) =>
            //             snapshot.docs.map((doc) => doc.id).toList()),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const CircularProgressIndicator();
            //       }
            //       if (snapshot.hasData) {
            //         appliedJobIds = snapshot.data!;
            //         return ListView.builder(
            //             itemCount: appliedJobIds.length,
            //             itemBuilder: (context, index) {
            //               final appliedJobId = appliedJobIds[index];
            //               // Display information about the applied job
            //               return ListTile(
            //                 title: Text("Applied Job ID: $appliedJobId"),
            //               );
            //             });
            //       }
            //       return Container();
            //     })
          ],
        ),
      ),
    );
  }

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

//   Future _apply() async{
//     final applyCollection = FirebaseFirestore.instance.collection("applies");
//
//     final docRef = applyCollection.doc("apply-id");
//
//     await docRef.set({
//       "experience": 2,
//       "education": "masters",
//     });
// }
}
