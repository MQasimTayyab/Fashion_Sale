import 'package:fashion_sale/Data/extenstion.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fashion_sale/Presentation/Widget/homepage/product_controller.dart';
import 'package:fashion_sale/Presentation/Common/common_card.dart';

class AllProductsPage extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Products")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(child: Text("Error: ${controller.error.value}"));
        }
        if (controller.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return ListView.separated(
          itemCount: controller.products.length,
          separatorBuilder: (_, __) => 12.h.Y,
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
