import 'package:fashion_sale/Presentation/Widget/mybag/bag_controller.dart';
import 'package:fashion_sale/Presentation/Widget/mybag/mybag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'size_controller.dart';
import 'color_controller.dart';
import 'size_bottomsheet.dart';
import 'color_bottomsheet.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Domain/Model/product_model.dart';
import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  ProductDetailScreen({required this.product});

  final SizeController sizeController = Get.put(SizeController());
  final ColorController colorController = Get.put(ColorController());
  final BagController bagController = Get.put(BagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: CommonText(
          text: product.brand ?? "",
          style: AppTextstyle.texttwo(
            context,
            fontsize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(product.imagePath ?? ""),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            20.Y,
            CommonText(
              text: product.brand ?? "",
              style: AppTextstyle.texttwo(
                context,
                fontsize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            5.Y,
            CommonText(
              text: product.productName ?? "",
              style: AppTextstyle.texttwo(
                context,
                fontsize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.filterGrey,
              ),
            ),
            10.Y,
            CommonText(
              text: "\$${product.newPrice ?? ""}",
              style: AppTextstyle.texttwo(
                context,
                fontsize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryRed,
              ),
            ),
            25.Y,
            // Size & Color
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) => SizeBottomSheet(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.filterGrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => CommonText(
                                text: sizeController.selectedSize.value.isEmpty
                                    ? "Size"
                                    : "Size: ${sizeController.selectedSize.value}",
                                style: AppTextstyle.texttwo(
                                  context,
                                  fontsize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ).padSymmetric(horizontal: 16, vertical: 14),
                  ),
                ),
                10.X,
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) => ColorBottomSheet(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.filterGrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => CommonText(
                                text: colorController
                                        .selectedColorName.value.isEmpty
                                    ? "Color"
                                    : colorController.selectedColorName.value,
                                style: AppTextstyle.texttwo(
                                  context,
                                  fontsize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ).padSymmetric(vertical: 14, horizontal: 16),
                  ),
                ),
              ],
            ),
            25.Y,
            // Add to Bag
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  bagController.addToCart({
                    'imagePath': product.imagePath,
                    'productName': product.productName,
                    'brand': product.brand,
                    'size': sizeController.selectedSize.value.isEmpty
                        ? "M"
                        : sizeController.selectedSize.value,
                    'color': colorController.selectedColorName.value.isEmpty
                        ? "Default"
                        : colorController.selectedColorName.value,
                    'price': product.newPrice?.toDouble() ?? 0.0,
                  });
                  Navigate.to(context, MyBagScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: CommonText(
                  text: "ADD TO BAG",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            25.Y,
            CommonText(
              text: "Description",
              style: AppTextstyle.texttwo(
                context,
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.Y,
            CommonText(
              text: "Product description goes here...",
              style: AppTextstyle.texttwo(
                context,
                fontsize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.filterGrey,
              ),
            ),
          ],
        ).padAll(16),
      ),
    );
  }
}
