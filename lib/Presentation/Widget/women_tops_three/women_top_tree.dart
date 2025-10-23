import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Data/utils.dart';
import 'package:fashion_sale/Domain/Model/women_page.dart';

import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/range_price/range_price.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WomenTopTree extends StatefulWidget {
  const WomenTopTree({super.key});

  @override
  State<WomenTopTree> createState() => _WomenTopsState();
}

class _WomenTopsState extends State<WomenTopTree> {
  final List<WomenDiscountModel> womenProducts = womenDiscountProducts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigate.pop(context),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Center(
              child: InkWell(
                  onTap: () {
                    Navigate.to(context, const RangeSliderScreen());
                  },
                  child: CommonText(text: AppStrings.womenstops))),
          actions: const [Icon(Icons.search)],
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
                  const Icon(Icons.filter_list),
                  10.X,
                  CommonText(text: AppStrings.filters),
                ]),
                Row(children: [
                  const Icon(Icons.double_arrow),
                  10.X,
                  CommonText(text: AppStrings.pricehighesttolow),
                ]),
                const Icon(Icons.add),
              ],
            ).padSymmetric(horizontal: 16, vertical: 8),
            Expanded(
              child: TabBarView(
                children: [
                  buildProductList(),
                  const Center(child: CommonText(text: "Pullover List Here")),
                  const Center(child: CommonText(text: "Shirt List Here")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductList() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          product.imagePath,
                          height: 265.h,
                          width: double.infinity,
                          fit: BoxFit.contain,
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
                      text: "\$${product.oldPrice}",
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
    );
  }
}

final List<WomenDiscountModel> womenDiscountProducts = Utils
    .dummyWomenDiscountJson
    .map((e) => WomenDiscountModel.fromJson(e))
    .toList();
