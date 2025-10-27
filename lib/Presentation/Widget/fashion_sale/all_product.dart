import 'package:fashion_sale/Data/app_strings.dart';

import 'package:fashion_sale/Presentation/Common/common_text.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:fashion_sale/Presentation/Widget/fashion_sale/product_controller.dart';
import 'package:fashion_sale/Presentation/Common/common_card.dart';

class AllProductsPage extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CommonText(text: AppStrings.viewall)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(
              child: CommonText(text: "Error: ${controller.error.value}"));
        }
        if (controller.products.isEmpty) {
          return const Center(child: CommonText(text: "No products found"));
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.90),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ProductCard(
              imagePath: product.imagePath ?? "",
              discount: product.discount.toString(),
              brand: product.brand ?? "",
              productName: product.productName ?? "",
              oldPrice: product.oldPrice.toString(),
              newPrice: product.newPrice.toString(),
            );
          },
        ).paddingAll(16);
      }),
    );
  }
}
