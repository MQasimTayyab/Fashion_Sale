import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Presentation/Common/bottomnav_controller.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/categories/categories.dart';
import 'package:fashion_sale/Presentation/Widget/fashion_sale/home_page.dart';
import 'package:fashion_sale/Presentation/Widget/street_cloth/street_cloth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row threewidgets(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Column(
          children: [
            Container(
              height: 171.h,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigate.to(context, Categories());
                  },
                  child: CommonText(
                    text: AppStrings.summersalee,
                    style: AppTextstyle.textone(context,
                        fontsize: 24.sp, color: Colors.pink),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigate.to(context, StreetCloth());
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: 0.25.sh,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/image 2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: CommonText(
                      text: AppStrings.streetcloth,
                      style: AppTextstyle.textone(context, fontsize: 20.sp),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 0.46.sh,
          width: double.infinity,
          child: Image.asset(
            "assets/images/image.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
