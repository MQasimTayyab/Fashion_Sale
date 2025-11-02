import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Data/utils.dart';
import 'package:fashion_sale/Presentation/Common/categories_card.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/catalog.dart/components/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column womentab(BuildContext context) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.primaryRed,
        ),
        width: 343.w,
        height: 100.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigate.to(context, const WomenPage());
                },
                child: CommonText(
                  text: AppStrings.summersale,
                  style: AppTextstyle.textone(context,
                      fontsize: 24.sp, fontWeight: FontWeight.w400),
                ),
              ),
              CommonText(
                text: AppStrings.upto,
                style: AppTextstyle.textone(context,
                    fontsize: 11.sp, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ).padOnly(top: 10.h),
      10.Y,
      Expanded(
        child: ListView.builder(
          itemCount: Utils.dummyCategories.length,
          itemBuilder: (context, index) {
            final category = Utils.dummyCategories[index];
            return CategoryCard(
              title: category["title"],
              imagePath: category["imagePath"],
            );
          },
        ),
      ),
    ],
  );
}
