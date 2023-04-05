import 'package:flutter/material.dart';

class RegisterInterface extends StatelessWidget {
  const RegisterInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: const [
            Text(
              "Make the most out of Rojgaar by",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "creating your job profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              "Get discovered by top recruiters",
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Text(
              "Recruiters will not post a job 70% of the times",
              style: TextStyle(
                fontSize: 15,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              "Find relevant job recommendations",
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Text(
              "Relevance is better for complete profiles",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],


        )
      ],
    );
  }
}
