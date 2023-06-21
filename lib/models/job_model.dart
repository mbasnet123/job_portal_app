import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal_app/screens/company_authentication.dart';
class JobModel{
  String? id;
  String? companyName;
  String? position;
  String? salary;

  JobModel({required this.id,required this.companyName, required this.position, required this.salary});

  factory JobModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return JobModel(id: snapshot["id"],
      companyName: snapshot["companyName"],
        position: snapshot["position"],
        salary: snapshot["salary"],);
  }

  Object? get jobId => null;

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyName": companyName,
    "position": position,
    "salary": salary,
  };
}

List<JobModel> job_list = [
  JobModel(companyName: "Niu", position: "Manager", salary: "40000", id: '1'),
  JobModel(companyName: "Nabil Bank", position: "Operations Head", salary: "50000", id: '2'),
  JobModel(companyName: "Manish Bank", position: "Marketing head", salary: "60000", id: '3'),
  JobModel(companyName: "Oyo", position: "Customer Service", salary: "30000", id: '4'),
];