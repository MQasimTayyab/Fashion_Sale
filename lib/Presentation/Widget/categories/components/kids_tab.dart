import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Data/utils.dart';
import 'package:fashion_sale/Presentation/Common/categories_card.dart';
import 'package:fashion_sale/Presentation/Common/common_card.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/catalog.dart/components/catalog.dart';
import 'package:fashion_sale/Presentation/Widget/categories/categories.dart';
import 'package:fashion_sale/Presentation/Widget/fashion_sale/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Column kidstab(BuildContext context) {
  //
  final ProductController controller =
      Get.put(ProductController(), tag: "kids");
  final BannerController bannerController =
      Get.put(BannerController(), tag: "kidsBanner");

  return Column(
    children: [
      ///  Banner Section
      Obx(() {
        final banner =
            bannerController.banners[bannerController.currentBannerIndex.value];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: banner["color"],
          ),
          width: double.infinity,
          height: 100.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Use banner title & Catalog screen
                    Navigate.to(
                        context,
                        Cataloge(
                          categoryName: banner["title"] ?? "Kids",
                        ));
                  },
                  child: CommonText(
                    text: banner["title"],
                    style: AppTextstyle.textone(context,
                        fontsize: 24.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                CommonText(
                  text: banner["subtitle"],
                  style: AppTextstyle.textone(context,
                      fontsize: 11.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ).padOnly(top: 10.h);
      }),

      10.Y,

      ///  horizontal Category List
      SizedBox(
        height: 520.h,
        child: ListView.builder(
          itemCount: Utils.dummyCategories.length,
          itemBuilder: (context, index) {
            final category = Utils.dummyCategories[index];
            return CategoryCard(
              title: category["title"],
              imagePath: category["imagePath"],
            ).padOnly(right: 10.w);
          },
        ),
      ),

      10.Y,

      ///  horizontal Product List (Kids Products)
      // Expanded(
      //   child: Obx(() {
      //     if (controller.isLoading.value) {
      //       return const Center(child: CircularProgressIndicator());
      //     }

      //     if (controller.error.isNotEmpty) {
      //       return Center(
      //         child: Text(
      //           "Error: ${controller.error.value}",
      //           style: const TextStyle(color: Colors.red),
      //         ),
      //       );
      //     }

      //     //
      //     if (Utils.kidscategories.isEmpty) {
      //       return Center(child: CommonText(text: "No products found"));
      //     }

      //     return SizedBox(
      //       height: 260.h,
      //       child: ListView.separated(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: Utils.kidscategories.length,
      //         separatorBuilder: (_, __) => 10.w.X,
      //         itemBuilder: (context, index) {
      //           final product = Utils.kidscategories[index];

      //           return ProductCard(
      //             imagePath: product["imagePath"] ?? "",
      //             discount: product["discount"].toString(),
      //             brand: product["brand"] ?? "",
      //             productName: product["productName"] ?? "",
      //             oldPrice: product["oldPrice"].toString(),
      //             newPrice: product["newPrice"].toString(),
      //             onTap: () {
      //               // Example: open detail screen later
      //               // Navigate.to(
      //               //   context,
      //               //   ProductDetailScreen(
      //               //     products: Utils.kidscategories,
      //               //     selectedIndex: index,
      //               //   ),
      //               // );
      //             },
      //           );
      //         },
      //       ),
      //     );
      //   }),
      // ),
    ],
  );
}
