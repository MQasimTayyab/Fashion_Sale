import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_btn.dart';
import 'package:fashion_sale/Presentation/Common/common_card.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  height: 536.h,
                  width: 376.w,
                  child: Image.asset(
                    'assets/images/Big_Banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: AppStrings.fashionsalee,
                        style: AppTextstyle.textone(context),
                      ),
                      CommonButton(text: AppStrings.check, onPressed: () {}),
                      20.Y,

                      //new
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
                              children: [
                                ProductCard(
                                    imagePath:
                                        'assets/images/ff48013c2e83ffc52e71ad79aa63042d84df66ea (1).png',
                                    discount: AppStrings.neww,
                                    brand: AppStrings.addtocart,
                                    productName: AppStrings.all,
                                    oldPrice: AppStrings.accessories,
                                    newPrice: AppStrings.bag),
                                ProductCard(
                                    imagePath:
                                        'assets/images/744caf4f8cbe22e0d501d66b730b03c24f793383.png',
                                    discount: AppStrings.neww,
                                    brand: AppStrings.addtocart,
                                    productName: AppStrings.all,
                                    oldPrice: AppStrings.accessories,
                                    newPrice: AppStrings.bag),
                                ProductCard(
                                    imagePath:
                                        'assets/images/ff48013c2e83ffc52e71ad79aa63042d84df66ea (1).png',
                                    discount: AppStrings.neww,
                                    brand: AppStrings.addtocart,
                                    productName: AppStrings.all,
                                    oldPrice: AppStrings.accessories,
                                    newPrice: AppStrings.bag),
                                ProductCard(
                                    imagePath:
                                        'assets/images/744caf4f8cbe22e0d501d66b730b03c24f793383.png',
                                    discount: AppStrings.neww,
                                    brand: AppStrings.addtocart,
                                    productName: AppStrings.all,
                                    oldPrice: AppStrings.accessories,
                                    newPrice: AppStrings.bag),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
