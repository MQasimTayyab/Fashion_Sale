import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_card.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/fashion_sale/all_product.dart';
import 'package:fashion_sale/Presentation/Widget/fashion_sale/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Column newproduct(BuildContext context) {
  final ProductController controller = Get.put(ProductController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: AppStrings.neww,
            style: AppTextstyle.texttwo(context),
          ),
          GestureDetector(
            onTap: () {
              Navigate.to(context, AllProductsPage());
            },
            child: CommonText(
              text: AppStrings.viewall,
              style: AppTextstyle.texttwo(context),
            ),
          ),
        ],
      ),
      10.h.Y,
      CommonText(
        text: AppStrings.youvenever,
        style:
            AppTextstyle.texttwo(context, fontsize: 12.sp, color: Colors.grey),
      ),
      20.h.Y,

      // 🔹 Horizontal Products List
      Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(
            child: Text(
              "Error: ${controller.error.value}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (controller.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return SizedBox(
          height: 260.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.products.length,
            separatorBuilder: (_, __) => 12.w.X,
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
          ),
        );
      }),
    ],
  );
}
