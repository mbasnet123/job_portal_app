import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_portal_app/models/job_model.dart';

class FirestoreHelper {

  static Stream<List<JobModel>> read() {
    final jobCollection = FirebaseFirestore.instance.collection("jobs");
    return jobCollection.snapshots().map((querysnapshot) =>
        querysnapshot.docs.map((e) => JobModel.fromSnapshot(e)).toList());
    
  }



  static Future add(JobModel job) async {
    final jobCollection = FirebaseFirestore.instance.collection("jobs");

    final jobId = jobCollection.doc().id;
    final docRef = jobCollection.doc(jobId);

    final newJob = JobModel(
            id: jobId,
            companyName: job.companyName,
            position: job.position,
            salary: job.salary,
      companyEmail: FirebaseAuth.instance.currentUser?.email ?? '',
    )
        .toJson();

    try {
      await docRef.set(newJob);
    } catch (e) {
      print("some error occurred $e");
    }
  }

  static Future update(JobModel job) async {
    final jobCollection = FirebaseFirestore.instance.collection("jobs");

    // final jobId = jobCollection.doc().id;
    final docRef = jobCollection.doc(job.id);

    final newJob = JobModel(
            id: job.id,
            companyName: job.companyName,
            position: job.position,
            salary: job.salary,
      companyEmail: FirebaseAuth.instance.currentUser?.email ?? '',)
        .toJson();

    try {
      await docRef.update(newJob);
    } catch (e) {
      print("some error occurred $e");
    }
  }

  static Future delete(JobModel job) async {
    final jobCollection = FirebaseFirestore.instance.collection("jobs");

    final docRed = jobCollection.doc(job.id).delete();
  }

// static Future update() async {
//   final jobCollection = FirebaseFirestore.instance.collection("jobs");
//
//   final docRef = jobCollection.doc("");
//
//   try {
//     await docRef.update({"position":"some updated data"});
//   } catch (e) {
//     print("some error occurred $e");
//   }
// }
}
