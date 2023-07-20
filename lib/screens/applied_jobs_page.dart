import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_app/models/applied_jobs_model.dart';
import 'package:job_portal_app/models/applied_jobs_firestore.dart';

class AppliedJobsPage extends StatefulWidget {
  const AppliedJobsPage({super.key});

  @override
  State<AppliedJobsPage> createState() => _AppliedJobsPageState();
}

class _AppliedJobsPageState extends State<AppliedJobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<List<AppliedJobsModel>>(
            stream: AppliedJobsFirestoreHelper.read(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Some error occurred"),
                );
              }
              if (snapshot.hasData) {
                final applyData = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: applyData!.length,
                    itemBuilder: (context, index) {
                      final singleApply = applyData[index];
                      return SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Delete"),
                                    content: const Text(
                                        "Are you sure you want to delete"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Delete"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            leading: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.lime, shape: BoxShape.circle),
                            ),
                            title: Text("${singleApply.id}"),
                            subtitle: Text("${singleApply.experience}"),
                            trailing: Text("${singleApply.education}"),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
