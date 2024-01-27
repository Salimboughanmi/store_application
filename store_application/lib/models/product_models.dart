class ProductModels {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModels rating;
  ProductModels(
      {required this.id,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating,
      required this.title});

  factory ProductModels.fromJson(jsonData) {
    return ProductModels(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      category: jsonData["category"],
      image: jsonData["image"],
      rating: RatingModels.fronJson(jsonData["rating"]),
    );
  }
}

class RatingModels {
  final double rate;
  final int count;

  RatingModels({required this.rate, required this.count});

  factory RatingModels.fronJson(jsonData) {
    return RatingModels(rate: jsonData["rate"], count: jsonData["count"]);
  }
}
