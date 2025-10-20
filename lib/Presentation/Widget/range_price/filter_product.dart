import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/range_price/range_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilteredProductScreen extends StatelessWidget {
  const FilteredProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RangeController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: CommonText(
            text: AppStrings.filters,
            style: AppTextstyle.texttwo(
              context,
              fontsize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Obx(() {
        RxList products = controller.filteredProducts;

        if (products.isEmpty) {
          return const Center(
            child: Text("No products found"),
          );
        }

        return GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.w,
            crossAxisSpacing: 15.w,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            Map product = products[index];
            dynamic price = product["price"] ?? product["newPrice"];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.whiteIcon,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      product["imagePath"],
                      height: 205.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: product["productName"] ?? "",
                        style: AppTextstyle.texttwo(
                          context,
                          fontsize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        // maxLines: 1,
                        // overflow: TextOverflow.ellipsis,
                      ),
                      3.Y,
                      CommonText(
                        text: product["brand"] ?? "",
                        style: AppTextstyle.texttwo(
                          context,
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      3.Y,
                      CommonText(
                        text: "\$${price.toString()}",
                        style: AppTextstyle.texttwo(
                          context,
                          fontsize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryRed,
                        ),
                      ),
                    ],
                  ).padAll(8.w),
                ],
              ),
            );
          },
        );
      }).padAll(15.w),
    );
  }
}
