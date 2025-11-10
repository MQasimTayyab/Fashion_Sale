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
import 'package:get/get_core/src/get_main.dart';

Column mentab(BuildContext context) {
  final ProductController controller = Get.put(ProductController(), tag: "men");
  final BannerController bannerController =
      Get.put(BannerController(), tag: "menBanner");

  return Column(
    children: [
      //  Banner
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
                    Navigate.to(
                        context,
                        Cataloge(
                          categoryName: banner["title"] ?? "Mens",
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

      // Categories
      SizedBox(
        height: 120.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
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

      //  Horizontal Product List
      Expanded(
        child: Obx(() {
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
          if (Utils.menscategories.isEmpty) {
            return const Center(child: Text("No products found"));
          }

          return SizedBox(
            height: 260.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: Utils.menscategories.length,
              separatorBuilder: (_, __) => 10.w.X,
              itemBuilder: (context, index) {
                final product = Utils.menscategories[index];
                return ProductCard(
                  imagePath: product["imagePath"] ?? "",
                  discount: product["discount"].toString(),
                  brand: product["brand"] ?? "",
                  productName: product["productName"] ?? "",
                  oldPrice: product["oldPrice"].toString(),
                  newPrice: product["newPrice"].toString(),
                  onTap: () {
                    // Navigate.to(
                    //     context,
                    //     ProductDetailScreen(
                    //       products: Utils.menscategories,
                    //       selectedIndex: index,
                    //     )
                    //     );
                  },
                );
              },
            ),
          );
        }),
      ),
    ],
  );
}
