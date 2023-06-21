import 'package:flutter/material.dart';
import 'package:job_portal_app/models/firestore_helper.dart';
import 'package:job_portal_app/models/job_model.dart';

class EditPage extends StatefulWidget {
  final JobModel job;

  const EditPage({Key? key, required this.job}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController? _positionController;
  TextEditingController? _companyNameController;
  TextEditingController? _salaryController;

  @override
  void initState() {
    _positionController = TextEditingController(text: widget.job.position);
    _companyNameController =
        TextEditingController(text: widget.job.companyName);
    _salaryController = TextEditingController(text: widget.job.salary);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _positionController!.dispose();
    _companyNameController!.dispose();
    _salaryController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              controller: _positionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "position",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _companyNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "company",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "salary",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                FirestoreHelper.update(
                  JobModel(
                      id: widget.job.id,
                      companyName: _companyNameController!.text,
                      position: _positionController!.text,
                      salary: _salaryController!.text),
                ).then((value) {
                  Navigator.pop(context);
                });
                // _add();
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
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
