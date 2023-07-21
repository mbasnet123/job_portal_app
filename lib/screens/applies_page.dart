import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_app/models/applied_jobs_firestore.dart';
import 'package:job_portal_app/models/applied_jobs_model.dart';
import 'package:job_portal_app/models/firestore_helper.dart';
import 'package:job_portal_app/screens/pdf_upload.dart';
import 'package:job_portal_app/screens/upload_cv.dart';

class AppliesPage extends StatefulWidget {
  const AppliesPage({Key? key}) : super(key: key);

  @override
  State<AppliesPage> createState() => _AppliesPageState();
}

class _AppliesPageState extends State<AppliesPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  @override
  void dispose() {
    _experienceController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _experienceController,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "experience(in years)",
                  suffixIcon: _experienceController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _experienceController.clear();
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
                      !RegExp(r'^[0-9]{1,3}').hasMatch(value!)) {
                    return "can have numbers only";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _educationController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "education",
                    suffixIcon: _educationController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _educationController.clear();
                            },
                            icon: const Icon(Icons.clear))
                        : null),
                onChanged: (_) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z]{1,20}').hasMatch(value!)) {
                    return "can be text only";
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
                        AppliedJobsFirestoreHelper.add(
                          AppliedJobsModel(
                            id: '',
                            education: _educationController.text,
                            experience: _experienceController.text,
                          ),
                        );
                        _educationController.clear();
                        _experienceController.clear();
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
                            "Apply",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // couldn't view pdf using this method
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return UploadCV();
                  //       },
                  //     ));
                  //   },
                  //   child: const Text("Upload CV"),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PdfUpload();
                          },
                        ),
                      );
                    },
                    child: const Text("Upload Pdf"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: applyData!.length,
                        itemBuilder: (context, index) {
                          final singleApply = applyData[index];
                          return ListTile(
                            leading: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Colors.lime,
                                shape: BoxShape.circle,
                              ),
                            ),
                            title:
                                Text("Experience: ${singleApply.experience}"),
                            subtitle:
                                Text("Education: ${singleApply.education}"),
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Delete"),
                                    content: const Text(
                                        "Are you sure you want to delete?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          AppliedJobsFirestoreHelper.delete(
                                                  singleApply)
                                              .then((value) {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    }

                    // StreamBuilder<List<AppliedJobsModel>>(
                    //     stream: AppliedJobsFirestoreHelper.read(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.connectionState == ConnectionState.waiting) {
                    //         return const Center(
                    //           child: CircularProgressIndicator(),
                    //         );
                    //       }
                    //       if (snapshot.hasError) {
                    //         return const Center(
                    //           child: Text("some error occurred"),
                    //         );
                    //       }
                    //       if (snapshot.hasData) {
                    //         final applyData = snapshot.data;
                    //         return ListView.builder(
                    //           shrinkWrap: true,
                    //             itemCount: applyData!.length,
                    //             itemBuilder: (context, index) {
                    //               final singleApply = applyData[index];
                    //               return SingleChildScrollView(
                    //                 child: Container(
                    //                   margin:
                    //                       const EdgeInsets.symmetric(vertical: 6),
                    //                   child: ListTile(
                    //                     onLongPress: () {
                    //                       showDialog(
                    //                           context: context,
                    //                           builder: (context) {
                    //                             return AlertDialog(
                    //                               title: const Text("Delete"),
                    //                               content: const Text(
                    //                                   "are you sure you want to delete"),
                    //                               actions: [
                    //                                 ElevatedButton(
                    //                                     onPressed: () {
                    //                                       AppliedJobsFirestoreHelper
                    //                                               .delete(
                    //                                                   singleApply)
                    //                                           .then((value) {
                    //                                         Navigator.pop(context);
                    //                                       });
                    //                                     },
                    //                                     child:
                    //                                         const Text("Delete")),
                    //                               ],
                    //                             );
                    //                           });
                    //                     },
                    //                     leading: Container(
                    //                       width: 35,
                    //                       height: 35,
                    //                       decoration: const BoxDecoration(
                    //                           color: Colors.lime,
                    //                           shape: BoxShape.circle),
                    //                     ),
                    //                     title: Text("${singleApply.experience}"),
                    //                     subtitle: Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Text("${singleApply.education}"),
                    //                       ],
                    //                     ),
                    //                     // trailing: InkWell(
                    //                     //     onTap: () {
                    //                     //       Navigator.push(
                    //                     //           context,
                    //                     //           MaterialPageRoute(
                    //                     //             builder: (context) => EditPage(
                    //                     //               job: JobModel(
                    //                     //                   position:
                    //                     //                       singleJob.position,
                    //                     //                   companyName:
                    //                     //                       singleJob.companyName,
                    //                     //                   salary: singleJob.salary,
                    //                     //                   id: singleJob.id),
                    //                     //             ),
                    //                     //           ));
                    //                     //     },
                    //                     //     child: const Icon(Icons.edit)),
                    //                   ),
                    //                 ),
                    //               );
                    //             });
                    //       }
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     })

                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(context, MaterialPageRoute(
                    //       builder: (context) {
                    //         return UploadCV();
                    //       },
                    //     ));
                    //   },
                    //   child: const Text("Upload CV"),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (formKey.currentState!.validate()) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //           const SnackBar(content: Text("Submitting data")));
                    //       _apply();
                    //     }
                    //   },
                    //   child: const Text("Apply"),
                    // ),
                    return Container();
                  },),
            ],
          ),
        ),
      ),
    );
  }

// Future _apply() async {
//   final applyCollection = FirebaseFirestore.instance.collection("applies");

//   final docRef = applyCollection.doc();

//   await docRef.set({
//     "experience": _experienceController.text,
//     "education": _educationController.text,
//   });
// }
}
