import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/upload_cv.dart';

class AppliesPage extends StatefulWidget {
  const AppliesPage({Key? key}) : super(key: key);

  @override
  State<AppliesPage> createState() => _AppliesPageState();
}

class _AppliesPageState extends State<AppliesPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _experienceController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _experienceController,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "experience(in years)",
                  suffixIcon: _experienceController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _experienceController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
                onChanged: (_) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[0-9]{1,3}').hasMatch(value!)) {
                    return "can have numbers only";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _educationController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "education",
                    suffixIcon: _educationController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _educationController.clear();
                            },
                            icon: const Icon(Icons.clear))
                        : null),
                onChanged: (_) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z]{1,20}').hasMatch(value!)) {
                    return "can be text only";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return UploadCV();
                    },
                  ));
                },
                child: const Text("Upload CV"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Submitting data")));
                    _apply();
                  }
                },
                child: const Text("Apply"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _apply() async {
    final applyCollection = FirebaseFirestore.instance.collection("applies");

    final docRef = applyCollection.doc();

    await docRef.set({
      "experience": _experienceController.text,
      "education": _educationController.text,
    });
  }
}
