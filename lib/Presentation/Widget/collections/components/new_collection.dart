import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';

import 'package:fashion_sale/Presentation/Widget/fashion_sale/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Stack newcollection(BuildContext context) {
  return Stack(
    children: [
      SizedBox(
        width: 1.sw,
        height: 0.50.sh,
        child: Image.asset(
          "assets/images/main.png",
          fit: BoxFit.fill,
        ),
      ),
      Center(
          child: TextButton(
        onPressed: () {
          Navigate.to(context, HomePage());
        },
        child: CommonText(
          text: AppStrings.fashionsale,
          style: AppTextstyle.textone(
            context,
            fontsize: 34.sp,
          ),
        ),
      ).padOnly(top: 300, left: 50)),
    ],
  );
}
