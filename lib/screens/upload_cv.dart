import 'package:flutter/material.dart';

class UploadCV extends StatefulWidget {
  const UploadCV({Key? key}) : super(key: key);

  @override
  State<UploadCV> createState() => _UploadCVState();
}

class _UploadCVState extends State<UploadCV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              height: 60,
              width: 60,
              color: Colors.blue.shade200,
            );
          },),
      floatingActionButton: IconButton(onPressed: (){
        
      }, icon: Icon(Icons.upload_file),),
    );
  }
}
