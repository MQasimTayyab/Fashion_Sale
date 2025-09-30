import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  final String imagePath;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 343.w,
        height: 140.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CommonText(
                    text: title,
                    style: AppTextstyle.textone(context,
                        color: AppColors.blackIcon, fontsize: 22.sp),
                  ),
                ),
              ],
            ),
            Image.asset(
              imagePath,
              width: 150.w,
              // height: 80.h,
              fit: BoxFit.contain,
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
