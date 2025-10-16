import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';

import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';

import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/categories/components/women_tab.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// summer sale /women / men/ kids

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
          leading: InkWell(
            onTap: () {
              Navigate.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Center(
            child: CommonText(
              text: AppStrings.categories,
              style: AppTextstyle.texttwo(context,
                  fontsize: 18.sp, fontWeight: FontWeight.w400),
            ),
          ),
          actions: [Icon(Icons.search)],
          bottom: TabBar(
            dividerHeight: 0,
            indicatorColor: AppColors.primaryButton,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                  child: CommonText(
                text: AppStrings.women,
                style: AppTextstyle.texttwo(context,
                    fontWeight: FontWeight.w400, fontsize: 16.sp),
              )),
              Tab(
                  child: CommonText(
                text: AppStrings.men,
                style: AppTextstyle.texttwo(context,
                    fontWeight: FontWeight.w400, fontsize: 16.sp),
              )),
              Tab(
                  child: CommonText(
                text: AppStrings.kid,
                style: AppTextstyle.texttwo(context,
                    fontWeight: FontWeight.w400, fontsize: 16.sp),
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //tab1

            womentab(context),
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
