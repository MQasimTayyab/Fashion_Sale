import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Domain/Model/product_model.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_btn.dart';
import 'package:fashion_sale/Presentation/Common/common_card.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/street_cloth/street_cloth.dart';
import 'package:fashion_sale/dummt_product.dart';
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppStrings.fashionsalee,
                      style: AppTextstyle.textone(context),
                    ),
                    CommonButton(
                        text: AppStrings.check,
                        onPressed: () {
                          Navigate.to(context, StreetCloth());
                        }),
                    25.h.Y,

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
                ).paddingOnly(top: 300, left: 20)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(),
    );
  }
}

List<ProductModel> dummyproducts =
    dummyproduct.map((e) => ProductModel.fromjson(e)).toList();

///
///
///
// import 'package:fashion_sale/Data/app_strings.dart';
// import 'package:fashion_sale/Data/app_textstyle.dart';
// import 'package:fashion_sale/Domain/Model/product_model.dart';
// import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
// import 'package:fashion_sale/Presentation/Common/common_btn.dart';
// import 'package:fashion_sale/Presentation/Common/common_card.dart';
// import 'package:fashion_sale/Presentation/Common/common_text.dart';
// import 'package:fashion_sale/dummt_product.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Banner Section
//             Stack(
//               children: [
//                 Container(
//                   height: 0.65.sh, // 65% of screen height
//                   width: 1.sw, // full screen width
//                   color: Colors.grey,
//                   child: Image.asset(
//                     'assets/images/Big_Banner.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),

//                 // Positioned text + button
//                 Positioned(
//                   top: 0.38.sh, // 38% of screen height
//                   left: 20.w,
//                   right: 20.w,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CommonText(
//                         text: AppStrings.fashionsalee,
//                         style: AppTextstyle.textone(context),
//                       ),
//                       16.h.verticalSpace,
//                       CommonButton(
//                         text: AppStrings.check,
//                         onPressed: () {},
//                       ),
//                       25.h.verticalSpace,

//                       // New products section
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CommonText(
//                                 text: AppStrings.newest,
//                                 style: AppTextstyle.texttwo(context),
//                               ),
//                               CommonText(
//                                 text: AppStrings.viewall,
//                                 style: AppTextstyle.texttwo(context),
//                               ),
//                             ],
//                           ),
//                           8.h.verticalSpace,
//                           CommonText(
//                             text: AppStrings.youvenever,
//                             style: AppTextstyle.texttwo(context),
//                           ),
//                           20.h.verticalSpace,

//                           // Horizontal product list
//                           SizedBox(
//                             height: 280.h,
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: dummyproducts.length,
//                               itemBuilder: (context, index) {
//                                 final product = dummyproducts[index];
//                                 return Padding(
//                                   padding: EdgeInsets.only(right: 12.w),
//                                   child: ProductCard(
//                                     imagePath: product.imagePath.toString(),
//                                     discount: product.discount.toString(),
//                                     brand: product.brand.toString(),
//                                     productName: product.productName.toString(),
//                                     oldPrice: product.oldPrice.toString(),
//                                     newPrice: product.newPrice.toString(),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CommonBottomNavBar(),
//     );
//   }
// }

// // Convert dummy map data → ProductModel
// List<ProductModel> dummyproducts =
//     dummyproduct.map((e) => ProductModel.fromjson(e)).toList();
