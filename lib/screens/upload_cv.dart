import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadCV extends StatefulWidget {
  const UploadCV({super.key});

  @override
  State<UploadCV> createState() => _UploadCVState();
}

class _UploadCVState extends State<UploadCV> {
  List<Map<String, dynamic>> pdfData = [];

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> uploadCV(String fileName, File file) async {
    final reference = FirebaseStorage.instance.ref().child("pdfs/$fileName");

    final uploadTask = reference.putFile(file);

    await uploadTask.whenComplete(() {});

    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
    //  Collection uploadedCVS
    //  name: fileName.split(".").
    //   "url": downloadLink
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name!;

      File file = File(pickedFile.files[0].path!);

      final downloadLink = await uploadCV(fileName, file);

      await _firebaseFirestore.collection("pdfs").add({
        "name": fileName,
        "url": downloadLink,
      });

      print("pdf uploaded successfully");
    }
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore.collection("pdfs").get();

    pdfData = results.docs.map((e) => e.data()).toList();
    //File aauxa

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        // itemCount: pdfData.length,
        itemCount: 1,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //  Flutter pdf pass
              //  asBytes
              //  File new file Create File.writeFromBytes
              //  Pdf.open(file
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PDF_file_icon.svg/1200px-PDF_file_icon.svg.png",
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    // pdfData[index]["name"],
                    "name",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: pickFile,
        icon: const Icon(Icons.upload_file),
      ),
    );
  }
}
