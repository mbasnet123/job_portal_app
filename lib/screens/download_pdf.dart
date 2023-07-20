import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DownloadPdf extends StatefulWidget {
  const DownloadPdf({super.key});

  @override
  State<DownloadPdf> createState() => _DownloadPdfState();
}

class _DownloadPdfState extends State<DownloadPdf> {
  late Future<ListResult> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
  }

  Future downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = "${tempDir.path}/${ref.name}";
    await Dio().download(url,path);

    // final dir = await getApplicationDocumentsDirectory();
    // final file = File("${dir.path}/${ref.name}");
    //
    // await ref.writeToFile(file);

    if (url.contains(".mp4")) {
      await GallerySaver.saveVideo(path, toDcim: true);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Downloaded ${ref.name}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download Files"),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];

                return ListTile(
                  title: Text(file.name),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(file),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error occurred"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );

  }
}
