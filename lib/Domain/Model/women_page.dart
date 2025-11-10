class WomenDiscountModel {
  final String productName;
  final String brand;
  final double oldPrice;
  final double newPrice;
  final String discount;
  final String imagePath;
  final String? category;
  final int rating;

  WomenDiscountModel({
    required this.productName,
    required this.brand,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
    required this.imagePath,
    required this.rating,
    this.category, // <-- optional rakho
  });

  factory WomenDiscountModel.fromJson(Map<String, dynamic> json) {
    return WomenDiscountModel(
      productName: json['productName'] ?? '',
      brand: json['brand'] ?? '',
      oldPrice: (json['oldPrice'] ?? 0).toDouble(),
      newPrice: (json['newPrice'] ?? 0).toDouble(),
      discount: json['discount'] ?? '',
      imagePath: json['imagePath'] ?? '',
      rating: json['rating'] ?? 0,
      category: json['category'],
    );
  }
}
