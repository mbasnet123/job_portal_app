class Company{
  final String image, title;

  Company({required this.image, required this.title});
}

List<Company> demo_company = [
  Company(image: "assets/images/benz.jpg", title: "Benz"),
  Company(image: "assets/images/amazon.jpg", title: "Amazon"),
  Company(image: "assets/images/tesla.jpg", title: "Tesla"),
  Company(image: "assets/images/starbucks.jpg", title: "Starbucks"),
] ;