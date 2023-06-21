// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'company_authentication.dart';
//
// class AppliedJobsPage extends StatelessWidget {
//   const AppliedJobsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Applied Jobs"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('applies').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError) {
//             return const Center(
//               child: Text("Error occurred"),
//             );
//           }
//           if (!snapshot.hasData) {
//             return const Center(
//               child: Text("No applied jobs found"),
//             );
//           }
//
//           final appliedJobs = snapshot.data!.docs;
//           if (appliedJobs.isEmpty) {
//             return const Center(
//               child: Text("No applied jobs found"),
//             );
//           }
//
//           return ListView.builder(
//             itemCount: appliedJobs.length,
//             itemBuilder: (context, index) {
//               final appliedJob = appliedJobs[index];
//               final experience = appliedJob.['experience'] as String;
//               final education = appliedJob.['education'] as String;
//
//               return ListTile(
//                 title: Text("Experience: $experience"),
//                 subtitle: Text("Education: $education"),
//                 // Add any other information you want to display
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
