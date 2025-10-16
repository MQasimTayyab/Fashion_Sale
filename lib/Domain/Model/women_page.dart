class WomenDiscountModel {
  final String productName;
  final String brand;
  final int rating;
  final double oldPrice;
  final double newPrice;
  final String discount;
  final String imagePath;

  WomenDiscountModel({
    required this.productName,
    required this.brand,
    required this.rating,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
    required this.imagePath,
  });

  factory WomenDiscountModel.fromJson(Map<String, dynamic> json) {
    return WomenDiscountModel(
      productName: json['productName'],
      brand: json['brand'],
      rating: json['rating'],
      oldPrice: (json['oldPrice'] as num).toDouble(),
      newPrice: (json['newPrice'] as num).toDouble(),
      discount: json['discount'],
      imagePath: json['imagePath'],
    );
  }
}
