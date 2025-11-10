import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Data/imagepath.dart';
import 'package:fashion_sale/Domain/Model/product_model.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_appbar.dart';
import 'package:fashion_sale/Presentation/Common/common_images.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/catalog.dart/cataloge_controller.dart';
import 'package:fashion_sale/Presentation/Widget/filter_screen/filter_screen.dart';
import 'package:fashion_sale/Presentation/Widget/product_card/product_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Cataloge extends StatelessWidget {
  final String categoryName;
  const Cataloge({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CatalogController());
    controller.filterProductsByCategory(categoryName);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CommonAppBar(title: categoryName),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar
            TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppColors.darkText,
              ),
              labelColor: AppColors.whiteText,
              unselectedLabelColor: AppColors.filterBlack,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              tabs: [
                Tab(text: "T-shirt"),
                Tab(text: "Blouse"),
                Tab(text: "Pullover"),
                Tab(text: "Shirt"),
              ],
            ),
            10.Y,

            // filter sort b
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  AssetImages(
                    width: 30,
                    height: 30,
                    issvg: true,
                    imagepath: ImagePath.filtersvg,
                    fit: BoxFit.contain,
                  ),
                  10.X,
                  InkWell(
                    onTap: () => Navigate.to(context, RangeSliderScreen()),
                    child: CommonText(text: AppStrings.filters),
                  ),
                ]),
                InkWell(
                  onTap: () => _showSortBottomSheet(context, controller),
                  child: Obx(
                    () => Row(
                      children: [
                        AssetImages(
                          width: 30,
                          height: 30,
                          issvg: true,
                          imagepath: ImagePath.pricelowhighsvg,
                          fit: BoxFit.contain,
                        ),
                        10.X,
                        CommonText(text: controller.selectedSort.value),
                      ],
                    ),
                  ),
                ),
                AssetImages(
                  width: 20,
                  height: 20,
                  issvg: true,
                  imagepath: ImagePath.listsvg,
                  fit: BoxFit.contain,
                ),
              ],
            ).padSymmetric(horizontal: 16, vertical: 8),

            // Product Grid
            Expanded(
              child: Obx(() {
                if (controller.filteredProducts.isEmpty) {
                  return Center(
                    child: CommonText(
                      text: "No products found for $categoryName",
                      style: AppTextstyle.textone(context,
                          fontsize: 14.sp, color: AppColors.filterBlack),
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: controller.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.filteredProducts[index];

                    final productModel = ProductModel(
                      imagePath: product.imagePath,
                      brand: product.brand,
                      productName: product.productName,
                      oldPrice: product.oldPrice,
                      newPrice: product.newPrice,
                      discount: product.discount,
                    );

                    return InkWell(
                      onTap: () {
                        Navigate.to(
                          context,
                          ProductDetailScreen(product: productModel),
                        );
                      },
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      child: AssetImages(
                                        issvg: false,
                                        imagepath: product.imagePath,
                                        height: 235.h,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.filterRed,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: CommonText(
                                        text: product.discount ?? "",
                                        style: AppTextstyle.textthree(context,
                                            color: AppColors.whiteText,
                                            fontsize: 10.sp),
                                      ),
                                    ).padSymmetric(
                                        horizontal: 12, vertical: 12),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: product.brand ?? "",
                                style: AppTextstyle.texttwo(context,
                                    fontsize: 10.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              CommonText(
                                text: product.productName ?? "",
                                style: AppTextstyle.texttwo(context,
                                    fontWeight: FontWeight.w400),
                              ),
                              6.h.Y,
                              Row(
                                children: [
                                  CommonText(
                                    text: "\$${product.oldPrice ?? ""}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.sp,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  8.w.X,
                                  CommonText(
                                    text: "\$${product.newPrice ?? ""}",
                                    style: AppTextstyle.textone(context,
                                        fontWeight: FontWeight.w100,
                                        fontsize: 12.sp,
                                        color: AppColors.filterRed),
                                  ),
                                ],
                              ),
                            ],
                          ).padAll(8),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
        bottomNavigationBar: CommonBottomNavBar(),
      ),
    );
  }

  // Sort bottom sheet
  void _showSortBottomSheet(
      BuildContext context, CatalogController controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteIcon,
      barrierColor: AppColors.filterBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              20.Y,
              CommonText(
                text: "Sort by",
                style:
                    AppTextstyle.textone(context, fontWeight: FontWeight.bold),
              ),
              20.Y,
              ...[
                "Popular",
                "Newest",
                "Customer Review",
                "Price: Lowest to Highest",
                "Price: Highest to Low"
              ].map((title) => ListTile(
                    leading: Icon(
                      controller.selectedSort.value == title
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: controller.selectedSort.value == title
                          ? AppColors.filterRed
                          : AppColors.darkText,
                    ),
                    title: CommonText(
                      text: title,
                      style: TextStyle(
                        color: controller.selectedSort.value == title
                            ? AppColors.filterRed
                            : AppColors.filterBlack,
                        fontWeight: controller.selectedSort.value == title
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      controller.sortProducts(title);
                      Navigator.pop(context);
                    },
                  ))
            ],
          )).padAll(16),
    );
  }
}
