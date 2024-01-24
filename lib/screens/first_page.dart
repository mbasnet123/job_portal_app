import 'package:flutter/material.dart';
import 'package:job_portal_app/screens/company_authentication.dart';
import 'package:job_portal_app/screens/home_page.dart';
import 'package:job_portal_app/screens/job_seeker_authentication.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  "assets/images/nepaJob_logo.png",
                ),
                height: 150,
                width: 150,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JobSeekerAuth(userEmail: '',),
                      ));
                },
                child: Container(
                  height: 120,
                  width: 220,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Hire Me",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                          "Click here to register yourself as\n    a  Jobseeker and find a job")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CompanyAuth(companyEmail: '',)));
                },
                child: Container(
                  height: 120,
                  width: 220,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Hiring",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                          "Click here to register yourself as\n   an Employer and a post a job")
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
