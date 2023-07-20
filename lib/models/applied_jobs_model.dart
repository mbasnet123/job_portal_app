import 'package:cloud_firestore/cloud_firestore.dart';

class AppliedJobsModel {
  String? id;
  // String? email;
  String? education;
  String? experience;

  AppliedJobsModel(
      {required this.id,
      // required this.email,
      required this.education,
      required this.experience});

  factory AppliedJobsModel.fromsnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AppliedJobsModel(
      id: snapshot["id"],
      // email: snapshot["email"],
      education: snapshot["education"],
      experience: snapshot["experience"],
    );
  }

  Object? get jobId => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        // "email" : email,
        "education": education,
        "experience": experience,
      };
}
