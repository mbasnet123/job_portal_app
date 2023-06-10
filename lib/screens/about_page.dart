import 'package:flutter/material.dart';
import 'package:job_portal_app/models/team_desc.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              children: [
                Text("Our Team:",
                style: TextStyle(
                  fontSize: 25,
                ),),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        teamDesc.length, (index) {
                      return TeamDesc(imageLink: teamDesc[index].imageLink, nameDesc: teamDesc[index].nameDesc);
                    }),
                  ),
                ),
                SizedBox(height: 30,),
                Text("We are a team of dedicated developers passionate about connecting job seekers and employers. With expertise in technology and user experience, we strive to create a seamless and efficient job search platform."
                ,style: TextStyle(
                    fontSize: 15,
                  ),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.location_on_sharp),
                    Text("Tikathali, Lalitpur"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamDesc extends StatelessWidget {
  const TeamDesc({
    super.key,
    required this.imageLink,
    required this.nameDesc,
  });

  final String imageLink;
  final String nameDesc;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text("Our Team"),
            SizedBox(height: 20,),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  imageLink),
              radius: 50,
            ),
            Text(nameDesc,
            style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
      ),
    );
  }
}


