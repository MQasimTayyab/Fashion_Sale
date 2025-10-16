import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/categories_item/filter_text_controller.dart';
import 'package:fashion_sale/Presentation/Widget/women_tops/women_tops.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesItem extends StatelessWidget {
  CategoriesItem({super.key});

  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigate.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Center(
          child: CommonText(
            text: AppStrings.categories,
            style: AppTextstyle.texttwo(context),
          ),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigate.to(context, WomenTops());
            },
            child: Container(
              width: 343.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.primaryRed,
              ),
              child: Center(
                child: CommonText(
                  text: AppStrings.viewallitems,
                  style: AppTextstyle.textone(context,
                      fontsize: 14.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ).padOnly(top: 20.h, left: 20.w, right: 20.w),
          ),
          TextField(
            onChanged: controller.filterSearch,
            decoration: InputDecoration(
              hintText: 'Choose categories',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ).padSymmetric(horizontal: 10.w, vertical: 10.h),
          Expanded(
            child: Obx(() {
              return ListView.separated(
                padding: EdgeInsets.all(16.w),
                itemCount: controller.filteredList.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (context, index) {
                  final category = controller.filteredList[index];

                  return InkWell(
                    onTap: () {
                      if (category.title == "Women Tops") {
                        Navigate.to(context, WomenTops());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("No screen defined for ${category.title}"),
                          ),
                        );
                      }
                    },
                    child: CommonText(
                      text: category.title.toString(),
                      style: AppTextstyle.texttwo(
                        context,
                        fontsize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ).padSymmetric(vertical: 8.h),
                  );
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: CommonBottomNavBar(),
    );
  }
}
