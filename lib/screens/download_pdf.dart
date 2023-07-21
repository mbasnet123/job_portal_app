// import 'package:dio/dio.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
//
// class DownloadPdf extends StatefulWidget {
//   const DownloadPdf({super.key});
//
//   @override
//   State<DownloadPdf> createState() => _DownloadPdfState();
// }
//
// class _DownloadPdfState extends State<DownloadPdf> {
//   late Future<ListResult> futureFiles;
//
//   @override
//   void initState() {
//     super.initState();
//
//     futureFiles = FirebaseStorage.instance.ref('/files').listAll();
//   }
//
//   Future downloadFile(Reference ref) async {
//     final url = await ref.getDownloadURL();
//
//     final tempDir = await getTemporaryDirectory();
//     final path = "${tempDir.path}/${ref.name}";
//     await Dio().download(url,path);
//
//     // final dir = await getApplicationDocumentsDirectory();
//     // final file = File("${dir.path}/${ref.name}");
//     //
//     // await ref.writeToFile(file);
//
//     if (url.contains(".mp4")) {
//       await GallerySaver.saveVideo(path, toDcim: true);
//     }
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Downloaded ${ref.name}")),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Download Files"),
//       ),
//       body: FutureBuilder<ListResult>(
//         future: futureFiles,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final files = snapshot.data!.items;
//
//             return ListView.builder(
//               itemCount: files.length,
//               itemBuilder: (context, index) {
//                 final file = files[index];
//
//                 return ListTile(
//                   title: Text(file.name),
//                   trailing: IconButton(
//                     icon: const Icon(
//                       Icons.download,
//                       color: Colors.black,
//                     ),
//                     onPressed: () => downloadFile(file),
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text("Error occurred"),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//
//   }
// }

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:gallery_saver/gallery_saver.dart';
//
// class DownloadPdf extends StatefulWidget {
//   const DownloadPdf({super.key});
//
//   @override
//   State<DownloadPdf> createState() => _DownloadPdfState();
// }
//
// class _DownloadPdfState extends State<DownloadPdf> {
//   late Future<ListResult> futureFiles;
//   bool _isViewingPdf = false;
//   String? _pdfPath;
//
//   @override
//   void initState() {
//     super.initState();
//     futureFiles = FirebaseStorage.instance.ref('/files').listAll();
//   }
//
//   Future<void> downloadFile(Reference ref) async {
//     final url = await ref.getDownloadURL();
//     final tempDir = await getTemporaryDirectory();
//     final path = "${tempDir.path}/${ref.name}";
//     await Dio().download(url, path);
//
//     if (url.contains(".mp4")) {
//       await GallerySaver.saveVideo(path, toDcim: true);
//     } else if (url.contains(".pdf")) {
//       setState(() {
//         _isViewingPdf = true;
//         _pdfPath = path;
//       });
//     }
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Downloaded ${ref.name}")),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_isViewingPdf) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text("View PDF"),
//         ),
//         body: PDFView(
//           filePath: _pdfPath!,
//         ),
//       );
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text("Download Files"),
//         ),
//         body: FutureBuilder<ListResult>(
//           future: futureFiles,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final files = snapshot.data!.items;
//               return ListView.builder(
//                 itemCount: files.length,
//                 itemBuilder: (context, index) {
//                   final file = files[index];
//                   return ListTile(
//                     title: Text(file.name),
//                     trailing: IconButton(
//                       icon: const Icon(
//                         Icons.download,
//                         color: Colors.black,
//                       ),
//                       onPressed: () => downloadFile(file),
//                     ),
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return const Center(
//                 child: Text("Error occurred"),
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       );
//     }
//   }
// }

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';

class DownloadPdf extends StatefulWidget {
  const DownloadPdf({super.key});

  @override
  State<DownloadPdf> createState() => _DownloadPdfState();
}

class _DownloadPdfState extends State<DownloadPdf> {
  late Future<ListResult> futureFiles;
  bool _isViewingPdf = false;
  String? _pdfPath;

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
  }

  Future<void> downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();
    final tempDir = await getTemporaryDirectory();
    final path = "${tempDir.path}/${ref.name}";
    await Dio().download(url, path);

    if (url.contains(".mp4")) {
      await GallerySaver.saveVideo(path, toDcim: true);
    } else if (url.contains(".pdf")) {
      setState(() {
        _isViewingPdf = true;
        _pdfPath = path;
      });
      return; // Exit the function early if it's a PDF
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Downloaded ${ref.name}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isViewingPdf) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("View PDF"),
        ),
        body: PDFView(
          filePath: _pdfPath!,
        ),
      );
    } else {
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
}
