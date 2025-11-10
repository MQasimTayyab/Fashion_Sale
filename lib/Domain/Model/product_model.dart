import 'package:flutter/material.dart';

class ProductModel {
  final String imagePath;
  final String brand;
  final String productName;
  final String discount;
  final double oldPrice;
  final double newPrice;

  final Color? color;
  final String? size;

  ProductModel({
    required this.imagePath,
    required this.brand,
    required this.productName,
    required this.discount,
    required this.oldPrice,
    required this.newPrice,
    this.color,
    this.size,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imagePath: json['imagePath'] ?? '',
      brand: json['brand'] ?? '',
      productName: json['productName'] ?? '',
      discount: json['discount'] ?? '',
      oldPrice: (json['oldPrice'] is String)
          ? double.tryParse(json['oldPrice']) ?? 0.0
          : (json['oldPrice'] ?? 0.0).toDouble(),
      newPrice: (json['newPrice'] is String)
          ? double.tryParse(json['newPrice']) ?? 0.0
          : (json['newPrice'] ?? 0.0).toDouble(),
      color: json['color'] ?? 'unknown',
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'brand': brand,
      'productName': productName,
      'discount': discount,
      'oldPrice': oldPrice,
      'newPrice': newPrice,
      'color': color,
    };
  }
}
