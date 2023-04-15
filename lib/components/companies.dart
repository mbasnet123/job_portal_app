import 'package:flutter/material.dart';

import '../models/Company.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.image,
    required this.title,
    required this.press,
  });

  final String image, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}

class CompanyList extends StatelessWidget {
  const CompanyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demo_company.length,
              (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CompanyCard(
                image: demo_company[index].image,
                title: demo_company[index].title,
                press: () {}),
          ),
        ),
      ),
    );
  }
}
