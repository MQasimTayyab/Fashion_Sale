import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/categories_card.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
          ),
          title: CommonText(
            text: AppStrings.categories,
            style: AppTextstyle.texttwo(context),
          ),
          actions: [Icon(Icons.search)],
          bottom: TabBar(
            indicatorColor: AppColors.primaryButton,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: AppStrings.women),
              Tab(text: AppStrings.men),
              Tab(text: AppStrings.women),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //tab1

            Column(
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
                        CommonText(
                          text: AppStrings.summersale,
                        ),
                        CommonText(
                          text: AppStrings.sale,
                        )
                      ],
                    ),
                  ),
                ),
                10.Y,
                CategoryCard(
                    title: AppStrings.neww, imagePath: 'assets/images/main.png')
              ],
            ),
            //tab2
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.pink,
                )
              ],
            ),
            //tab 3
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: CommonBottomNavBar(),
      ),
    );
  }
}
