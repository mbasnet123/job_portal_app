import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal_app/screens/company_authentication.dart';

class JobModel {
  String? id;
  String? companyName;
  String? position;
  String? salary;
  String? companyEmail;

  JobModel(
      {required this.id,
      required this.companyName,
      required this.position,
      required this.salary,
        required this.companyEmail,
      });

  factory JobModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return JobModel(
      id: snapshot["id"],
      companyName: snapshot["companyName"],
      position: snapshot["position"],
      salary: snapshot["salary"],
      companyEmail: snapshot["companyEmail"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "position": position,
        "salary": salary,
    "companyEmail": companyEmail,
      };
}

List<JobModel> job_list = [];
