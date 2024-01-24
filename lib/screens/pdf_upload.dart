import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/download_pdf.dart';

class PdfUpload extends StatefulWidget {
  const PdfUpload({super.key});

  @override
  State<PdfUpload> createState() => _PdfUploadState();
}

class _PdfUploadState extends State<PdfUpload> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future uploadFile() async {
    final path = "files/${pickedFile!.name}";
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print("Download Link: $urlDownload");
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;

            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      );

  // Future uploadFile() async {
  //   final path = "files/${pickedFile!.name}";
  //   final file = File(pickedFile!.path!);
  //
  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   ref.putFile(file);
  // }

  @override
  Widget build(BuildContext context) {
    final String title = "Upload pdf";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedFile != null)
              Expanded(
                child: Container(
                  color: Colors.blue[100],
                  child: Center(
                    child: Text(pickedFile!.name),
                  ),
                ),
              ),
            const SizedBox(
              height: 22,
            ),
            ElevatedButton(
              onPressed: selectFile,
              child: const Text("Select File"),
            ),
            const SizedBox(
              height: 22,
            ),
            ElevatedButton(
              onPressed: uploadFile,
              child: const Text("Upload File"),
            ),
            const SizedBox(
              height: 12,
            ),

            const SizedBox(
              height: 32,
            ),
            buildProgress(),
          ],
        ),
      ),
    );
  }
}
