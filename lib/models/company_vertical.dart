import 'firestore_helper.dart';
class CompanyVertical{
  final String image, title, reviews, totalReviews, text1, text2;

  CompanyVertical({required this.image, required this.title, required this.reviews, required this.totalReviews, required this.text1, required this.text2});
}

List<CompanyVertical> vertical_items = [
  CompanyVertical(image: "assets/images/benz.jpg", title: "Benz", reviews: "4.3", totalReviews: "1.1k+", text1: "Auto", text2: "B2C"),
  CompanyVertical(image: "assets/images/amazon.jpg", title: "Amazon", reviews: "4.2", totalReviews: "5k+", text1: "B2C", text2: "Shipping"),
  CompanyVertical(image: "assets/images/tesla.jpg", title: "Tesla", reviews: "4.1", totalReviews: "3k+", text1: "Auto", text2: "B2C"),
  CompanyVertical(image: "assets/images/starbucks.jpg", title: "Starbucks", reviews: "4.5", totalReviews: "7k+", text1: "Coffee", text2: "Beverages")
];