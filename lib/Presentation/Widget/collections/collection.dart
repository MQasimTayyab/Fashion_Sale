import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/categories/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 0.45.sh,
                  child: Image.asset(
                    "assets/images/main.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 250.h, left: 50.w),
                    child: TextButton(
                      onPressed: () {
                        Navigate.to(context, Categories());
                      },
                      child: CommonText(
                        text: AppStrings.newcollection,
                        style: AppTextstyle.textone(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT COLUMN
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: CommonText(
                            text: AppStrings.summersale,
                            style: AppTextstyle.textone(context,
                                color: Colors.pink),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.25.sh,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/image 2.png",
                          fit: BoxFit.cover,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(),
    );
  }
}
