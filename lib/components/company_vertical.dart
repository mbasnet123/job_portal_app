import 'package:flutter/material.dart';

import '../models/Company.dart';

class CompanyVertical extends StatelessWidget {
  const CompanyVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          demo_company.length,
              (index) => CompanyView(
              image: demo_company[index].image,
              title: demo_company[index].title),
        ),
      ),
    );
  }
}

class CompanyView extends StatelessWidget {
  const CompanyView({
    super.key,
    required this.image,
    required this.title,
  });

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 160,
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}