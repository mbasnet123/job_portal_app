import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal_app/models/applied_jobs_model.dart';

class AppliedJobsFirestoreHelper {
  static Stream<List<AppliedJobsModel>> read() {
    final applyCollection = FirebaseFirestore.instance.collection("appies");
    return applyCollection.snapshots().map((querysnapshot) =>
        querysnapshot.docs.map((e) =>
            AppliedJobsModel.fromsnapshot(e)).toList()
    );
  }

  static Future add(AppliedJobsModel apply) async {
    final applyCollection = FirebaseFirestore.instance.collection("applies");

    final applyId = applyCollection
        .doc()
        .id;
    final docRef = applyCollection.doc(applyId);

    final newApply = AppliedJobsModel(
        id: applyId,
        email: apply.email,
        eduaction: apply.eduaction,
        experience: apply.experience).toJson();

    try {
      await docRef.set(newApply);
    } catch (e) {
      print("Some error occurred $e");
    }
  }

// static Future update(AppliedJobsModel apply) async{
//   final applyCollection = FirebaseFirestore.instance.collection("applies");
//
//   final docRef =
// }
  }
