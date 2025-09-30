import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';

import 'package:fashion_sale/Presentation/Common/common_card.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/collections/collection.dart';
import 'package:fashion_sale/Presentation/Widget/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StreetCloth extends StatefulWidget {
  const StreetCloth({super.key});

  @override
  State<StreetCloth> createState() => _StreetClothState();
}

class _StreetClothState extends State<StreetCloth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.grey,
                  height: 260.h,
                  width: 390.w,
                  child: Image.asset(
                    'assets/images/pexels-photo-911677 (1).png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigate.to(context, Collection());
                      },
                      child: CommonText(
                        text: AppStrings.streetcloth,
                        style:
                            AppTextstyle.textone(context, color: Colors.white),
                      ),
                    ),

                    25.h.Y,

                    //new
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: AppStrings.sale,
                              style: AppTextstyle.texttwo(context),
                            ),
                            CommonText(
                              text: AppStrings.viewall,
                              style: AppTextstyle.texttwo(context),
                            ),
                          ],
                        ),
                        CommonText(
                          text: AppStrings.supersummer,
                          style: AppTextstyle.texttwo(context),
                        ),
                        10.Y,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: dummyproducts.map((product) {
                              return ProductCard(
                                imagePath: product.imagePath.toString(),
                                discount: product.discount.toString(),
                                brand: product.brand.toString(),
                                productName: product.productName.toString(),
                                oldPrice: product.oldPrice.toString(),
                                newPrice: product.newPrice.toString(),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    15.Y,
                    //second
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: AppStrings.newest,
                              style: AppTextstyle.texttwo(context),
                            ),
                            CommonText(
                              text: AppStrings.viewall,
                              style: AppTextstyle.texttwo(context),
                            ),
                          ],
                        ),
                        CommonText(
                          text: AppStrings.youvenever,
                          style: AppTextstyle.texttwo(context),
                        ),
                        20.Y,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: dummyproducts.map((product) {
                              return ProductCard(
                                imagePath: product.imagePath.toString(),
                                discount: product.discount.toString(),
                                brand: product.brand.toString(),
                                productName: product.productName.toString(),
                                oldPrice: product.oldPrice.toString(),
                                newPrice: product.newPrice.toString(),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    )
                  ],
                ).paddingOnly(top: 150, left: 20)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(),
    );
  }
}
