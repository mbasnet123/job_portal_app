import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/company_authentication.dart';
import '../models/Company.dart';
import '../models/firestore_helper.dart';
import '../models/job_model.dart';


class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.image,
    required this.title,
    required this.press,
  });

  final String image, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: StreamBuilder<List<JobModel>>(
    //       stream: FirestoreHelper.read(),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //         if (snapshot.hasError) {
    //           return const Center(
    //             child: Text("some error occurred"),
    //           );
    //         }
    //         if (snapshot.hasData) {
    //           final jobData = snapshot.data;
    //           return Expanded(
    //             child: ListView.builder(
    //                 itemCount: jobData!.length,
    //                 itemBuilder: (context, index) {
    //                   final singleJob = jobData[index];
    //                   return SingleChildScrollView(
    //                     child: Container(
    //                       margin: const EdgeInsets.symmetric(vertical: 6),
    //                       child: ListTile(
    //                         onLongPress: (){
    //                           showDialog(context: context, builder: (context){
    //                             return AlertDialog(
    //                               title: const Text("Delete"),
    //                               content: const Text("are you sure you want to delete"),
    //                               actions: [
    //                                 ElevatedButton(
    //                                     onPressed: (){
    //                                       FirestoreHelper.delete(singleJob).then((value) {
    //                                         Navigator.pop(context);
    //                                       });
    //                                     },
    //                                     child: const Text("Delete")),
    //                               ],
    //                             );
    //                           });
    //                         },
    //                         leading: Container(
    //                           width: 35,
    //                           height: 35,
    //                           decoration: const BoxDecoration(
    //                               color: Colors.lime,
    //                               shape: BoxShape.circle),
    //                         ),
    //                         title: Text("${singleJob.companyName}"),
    //                         subtitle: Row(
    //                           mainAxisAlignment:
    //                           MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Text("${singleJob.position}"),
    //                             Text("${singleJob.salary}"),
    //                           ],
    //                         ),
    //                     ),
    //                     ),
    //                   );
    //                 }),
    //           );
    //         }
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }),
    // );
  // }
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),),
      child: InkWell(
        onTap: press,
        // style: OutlinedButton.styleFrom(
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(6),
        //     ),
        //   ),
        // ),
        child: Column(
          children: [
            Image(
              image: AssetImage(image),
              height: 150,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class CompanyList extends StatelessWidget {
  const CompanyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demo_company.length,
              (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CompanyCard(
                image: demo_company[index].image,
                title: demo_company[index].title,
                press: () {}),
          ),
        ),
      ),
    );
  }
}
