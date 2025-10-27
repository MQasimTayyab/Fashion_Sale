import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Stack streetbanner(BuildContext context) {
  return Stack(
    children: [
      SizedBox(
        width: double.infinity,
        height: 0.35.sh,
        child: Image.asset(
          'assets/images/pexels-photo-911677 (1).png',
          fit: BoxFit.cover,
        ),
      ),
      // Text
      Positioned(
        bottom: 16.h,
        left: 16.w,
        child: CommonText(
          text: AppStrings.streetcloth,
          style: AppTextstyle.textone(
            context,
            color: Colors.white,
            fontsize: 22.sp,
          ),
        ),
      ),
      // Back Button
      Positioned(
        top: 16.h,
        left: 16.w,
        child: IconButton(
          onPressed: () {
            Navigate.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.whiteIcon),
        ),
      ),
    ],
  );
}
