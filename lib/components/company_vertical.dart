import 'package:job_portal_app/models/company_vertical.dart';

import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/company_authentication.dart';
import '../models/Company.dart';
import '../models/firestore_helper.dart';
import '../models/job_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_portal_app/screens/login.dart';


import 'package:job_portal_app/components/companies.dart';

class CompanyVertical extends StatefulWidget {
  const CompanyVertical({Key? key}) : super(key: key);

  @override
  State<CompanyVertical> createState() => _CompanyVerticalState();
}

class _CompanyVerticalState extends State<CompanyVertical> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
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
                              final singleJob = jobData?[index];
                              return SingleChildScrollView(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 6),
                                  child: ListTile(
                                    leading: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                          color: Colors.lime,
                                          shape: BoxShape.circle),
                                    ),
                                    title: Text("${singleJob?.companyName}"),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${singleJob?.position}"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text("Rs."),
                                            Text("${singleJob?.salary}"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}










































































// class CompanyVertical extends StatefulWidget {
//   const CompanyVertical({Key? key}) : super(key: key);
//
//   @override
//   State<CompanyVertical> createState() => _CompanyVerticalState();
// }
//
// class _CompanyVerticalState extends State<CompanyVertical> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back, color: Colors.blue,
//             size: 35),
//           )),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: List.generate(
//             vertical_items.length,
//             (index) => VerticalTile(
//                 image: vertical_items[index].image,
//                 title: vertical_items[index].title,
//                 reviews: vertical_items[index].reviews,
//                 totalReviews: vertical_items[index].totalReviews,
//                 text1: vertical_items[index].text1,
//                 text2: vertical_items[index].text2),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class VerticalTile extends StatelessWidget {
//   const VerticalTile({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.reviews,
//     required this.totalReviews,
//     required this.text1,
//     required this.text2,
//   });
//
//   final String image, title, reviews, totalReviews, text1, text2;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: SizedBox(
//             width: double.infinity,
//             height: 150,
//             child: Card(
//               elevation: 10,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: ListTile(
//                       onTap: () {
//                         _tripEditModalBottomSheet(context);
//                       },
//                       leading: Image.asset(
//                         image,
//                         height: 70,
//                         width: 70,
//                       ),
//                       title: Text(title),
//                       subtitle: Row(
//                         children: [
//                           const Icon(Icons.star),
//                           Text(reviews),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text(totalReviews),
//                         ],
//                       ),
//                       // trailing: const Icon(Icons.arrow_forward_ios_rounded),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(text1),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(text2),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ]);
//   }
//
//   void _tripEditModalBottomSheet(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return SizedBox(
//             height: 400,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         title,
//                         style:
//                             const TextStyle(fontSize: 25, color: Colors.black),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(Icons.cancel),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
