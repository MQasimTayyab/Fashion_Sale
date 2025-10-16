import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Data/utils.dart';
import 'package:fashion_sale/Domain/Model/women_tops_model.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/women_page.dart/conponents/women_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WomenTops extends StatefulWidget {
  const WomenTops({super.key});

  @override
  State<WomenTops> createState() => _WomenTopsState();
}

class _WomenTopsState extends State<WomenTops> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigate.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          actions: [Icon(Icons.search)],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            InkWell(
              onTap: () {
                Navigate.to(context, WomenPage());
              },
              child: CommonText(
                text: AppStrings.womenstops,
                style: AppTextstyle.textone(
                  context,
                  fontsize: 34.sp,
                  color: AppColors.filterBlack,
                  fontWeight: FontWeight.w500,
                ),
              ).padSymmetric(vertical: 8, horizontal: 16),
            ),

            // TabBar
            TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppColors.darkText,
              ),
              labelColor: AppColors.whiteText,
              unselectedLabelColor: AppColors.filterBlack,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              tabs: const [
                Tab(text: "T-shirt"),
                Tab(text: "Blouse"),
                Tab(text: "Pullover"),
                Tab(text: "Shirt"),
              ],
            ),

            10.Y,

            // Filter row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.filter_list),
                    10.X,
                    CommonText(text: AppStrings.filters),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.double_arrow),
                    10.X,
                    CommonText(text: AppStrings.pricehighesttolow),
                  ],
                ),
              ],
            ).padSymmetric(horizontal: 16, vertical: 8),

            // TabBarView content
            Expanded(
              child: TabBarView(
                children: [
                  // 1st Tab — T-shirts List
                  ListView.builder(
                    itemCount: womenproducts.length,
                    itemBuilder: (context, index) {
                      final womentop = womenproducts[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // LEFT: IMAGE
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                womentop.imagePath,
                                height: 120.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            ),

                            12.X,
                            // right text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: womentop.brand,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  4.Y,
                                  CommonText(
                                    text: womentop.productName,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  8.Y,
                                  CommonText(
                                    text:
                                        "\$${womentop.price.toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  4.Y,
                                  // Row(
                                  //   children: List.generate(
                                  //     5,
                                  //     (starIndex) => Icon(
                                  //       Icons.star,
                                  //       size: 14,
                                  //       color: starIndex < womentop.rating
                                  //           ? Colors.amber
                                  //           : Colors.grey.shade300,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ).padAll(10),
                      );
                    },
                  ).padSymmetric(horizontal: 12),

                  // Other Tabs
                  Center(child: CommonText(text: "Blouses List Here")),
                  Center(child: CommonText(text: "Pullovers List Here")),
                  Center(child: CommonText(text: "Shirts List Here")),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CommonBottomNavBar(),
      ),
    );
  }
}

final List<WomenTopsModel> womenproducts =
    Utils.dummywomenJson.map((e) => WomenTopsModel.fromJson(e)).toList();
