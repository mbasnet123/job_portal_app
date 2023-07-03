import 'package:cloud_firestore/cloud_firestore.dart';

class AppliedJobsModel {
  String? id;
  String? email;
  String? eduaction;
  int? experience;

  AppliedJobsModel(
      {required this.id,
      required this.email,
      required this.eduaction,
      required this.experience});

  factory AppliedJobsModel.fromsnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AppliedJobsModel(
      id: snapshot["id"],
      email: snapshot["email"],
      eduaction: snapshot["education"],
      experience: snapshot["experience"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id" :id,
    "email" : email,
    "education" : eduaction,
    "experience" : experience,
  };
}
