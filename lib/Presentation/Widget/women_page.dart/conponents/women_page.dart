import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Data/utils.dart';
import 'package:fashion_sale/Domain/Model/women_page.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/filter_screen/filter_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WomenPage extends StatefulWidget {
  const WomenPage({super.key});

  @override
  State<WomenPage> createState() => _WomenPageState();
}

class _WomenPageState extends State<WomenPage> {
  final List<WomenDiscountModel> womenProducts = womenDiscountProducts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigate.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Center(child: CommonText(text: AppStrings.womenstops)),
          actions: [Icon(Icons.search)],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(Icons.filter_list),
                  10.X,
                  InkWell(
                      onTap: () {
                        Navigate.to(context, RangeSliderScreen());
                      },
                      child: CommonText(text: AppStrings.filters)),
                ]),
                Row(children: [
                  Icon(Icons.double_arrow),
                  10.X,
                  CommonText(text: AppStrings.pricehighesttolow),
                ]),
                Icon(Icons.add),
              ],
            ).padSymmetric(horizontal: 16, vertical: 8),
            Expanded(
              child: TabBarView(
                children: [
                  buildProductList(),
                  Center(child: CommonText(text: "Pullover List Here")),
                  Center(child: CommonText(text: "Shirt List Here")),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CommonBottomNavBar(),
      ),
    );
  }

  Widget buildProductList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemCount: womenProducts.length,
      itemBuilder: (context, index) {
        final product = womenProducts[index];
        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          product.imagePath,
                          height: 265.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          product.discount,
                          style:
                              TextStyle(color: Colors.white, fontSize: 10.sp),
                        ),
                      ).padSymmetric(horizontal: 6, vertical: 6)
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: product.brand,
                  style: AppTextstyle.texttwo(context,
                      fontsize: 10.sp, fontWeight: FontWeight.normal),
                ),
                CommonText(
                    text: product.productName,
                    style: AppTextstyle.texttwo(context,
                        fontWeight: FontWeight.w400)),
                6.h.Y,
                Row(
                  children: [
                    CommonText(
                      text: "${product.oldPrice}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    8.w.X,
                    CommonText(
                        text: "\$${product.newPrice}",
                        style: AppTextstyle.textone(context,
                            fontWeight: FontWeight.w100,
                            fontsize: 12.sp,
                            color: AppColors.filterRed)),
                  ],
                ),
              ],
            ).padAll(8),
          ],
        );
      },
    ).padAll(12);
  }
}

final List<WomenDiscountModel> womenDiscountProducts = Utils
    .dummyWomenDiscountJson
    .map((e) => WomenDiscountModel.fromJson(e))
    .toList();
