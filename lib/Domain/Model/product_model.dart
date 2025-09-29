class ProductModel {
  String? imagePath;
  String? discount;
  String? brand;
  String? productName;
  String? oldPrice;
  String? newPrice;

  ProductModel({
    this.imagePath,
    this.discount,
    this.brand,
    this.productName,
    this.oldPrice,
    this.newPrice,
  });
  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      imagePath: json["imagePath"],
      discount: json["discount"],
      brand: json["brand"] as String,
      productName: json["productName"],
      oldPrice: json["oldPrice"],
      newPrice: json["newPrice"],
    );
  }
}
