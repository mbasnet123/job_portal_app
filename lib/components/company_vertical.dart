import 'package:flutter/material.dart';
import 'package:job_portal_app/models/company_vertical.dart';

class CompanyVertical extends StatelessWidget {
  const CompanyVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
            vertical_items.length,
            (index) => VerticalTile(
                image: vertical_items[index].image,
                title: vertical_items[index].title,
                reviews: vertical_items[index].reviews,
                totalReviews: vertical_items[index].totalReviews,
                text1: vertical_items[index].text1,
                text2: vertical_items[index].text2),
          ),
        ),
      ),
    );
  }
}

class VerticalTile extends StatelessWidget {
  const VerticalTile({
    super.key,
    required this.image,
    required this.title,
    required this.reviews,
    required this.totalReviews,
    required this.text1,
    required this.text2,
  });

  final String image, title, reviews, totalReviews, text1, text2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListTile(
                    leading: Image.asset(image),
                    title: Text(title),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.star),
                        Text(reviews),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(totalReviews),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(text1),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(text2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
