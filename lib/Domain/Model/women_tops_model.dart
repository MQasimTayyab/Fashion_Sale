class WomenTopsModel {
  final String productName;
  final String brand;
  final int rating;
  final double price;
  final String imagePath;

  WomenTopsModel({
    required this.productName,
    required this.brand,
    required this.rating,
    required this.price,
    required this.imagePath,
  });

  factory WomenTopsModel.fromJson(Map<String, dynamic> json) {
    return WomenTopsModel(
      productName: json['productName'],
      brand: json['brand'],
      rating: json['rating'],
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'],
    );
  }
}
