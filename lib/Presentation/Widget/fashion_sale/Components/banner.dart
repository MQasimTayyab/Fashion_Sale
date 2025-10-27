import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Stack banner(BuildContext context) {
  return Stack(
    children: [
      SizedBox(
        width: double.infinity,
        height: 0.7.sh,
        child: Image.asset(
          'assets/images/Big_Banner.png',
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        left: 20.w,
        bottom: 40.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppStrings.fashionsalee,
              style: AppTextstyle.textone(
                context,
                color: AppColors.whiteText,
                fontsize: 24.sp,
              ),
            ),
            10.h.Y,
          ],
        ),
      ),
    ],
  );
}
