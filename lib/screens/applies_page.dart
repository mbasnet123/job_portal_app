import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppliesPage extends StatefulWidget {
  const AppliesPage({Key? key}) : super(key: key);

  @override
  State<AppliesPage> createState() => _AppliesPageState();
}

class _AppliesPageState extends State<AppliesPage> {
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
        child: Column(
          children: [
            TextFormField(
              controller: _experienceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "experience(in years)",
                suffixIcon: IconButton(onPressed: (){
                  _experienceController.clear();
                },
                    icon: const Icon(Icons.clear),)
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _educationController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "education",
                suffixIcon: IconButton(onPressed: (){
                  _educationController.clear();
                }, icon: const Icon(Icons.clear))
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              _apply();
            }, child: const Text("Apply"),),
          ],
        ),
      ),
    );
  }

  Future _apply() async{
    final applyCollection = FirebaseFirestore.instance.collection("applies");

    final docRef = applyCollection.doc();

    await docRef.set({
      "experience" : _experienceController.text,
      "education" : _educationController.text,
    });
  }

}