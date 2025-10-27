import 'package:fashion_sale/Presentation/Widget/fashion_sale/Components/banner.dart';
import 'package:fashion_sale/Presentation/Widget/fashion_sale/Components/new_product.dart';

import 'package:fashion_sale/Presentation/Widget/fashion_sale/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //banner
              banner(context),
              //new product

              newproduct(context)
                  .padSymmetric(horizontal: 20.w, vertical: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(),
    );
  }
}


// import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
// import 'package:fashion_sale/Data/app_strings.dart';
// import 'package:fashion_sale/Data/app_textstyle.dart';
// import 'package:fashion_sale/Data/extenstion.dart';
// import 'package:fashion_sale/Domain/Model/product_model.dart';
// import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
// import 'package:fashion_sale/Presentation/Common/common_btn.dart';
// import 'package:fashion_sale/Presentation/Common/common_card.dart';
// import 'package:fashion_sale/Presentation/Common/common_text.dart';
// import 'package:fashion_sale/Presentation/Widget/street_cloth/street_cloth.dart';
// import 'package:fashion_sale/dummt_product.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   color: Colors.grey,
//                   height: 536.h,
//                   width: 376.w,
//                   child: Image.asset(
//                     'assets/images/Big_Banner.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CommonText(
//                       text: AppStrings.fashionsalee,
//                       style: AppTextstyle.textone(context),
//                     ),
//                     CommonButton(
//                         text: AppStrings.check,
//                         onPressed: () {
//                           Navigate.to(context, StreetCloth());
//                         }),
//                     25.h.Y,

//                     //new
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CommonText(
//                               text: AppStrings.newest,
//                               style: AppTextstyle.texttwo(context),
//                             ),
//                             CommonText(
//                               text: AppStrings.viewall,
//                               style: AppTextstyle.texttwo(context),
//                             ),
//                           ],
//                         ),
                        
//                         CommonText(
//                           text: AppStrings.youvenever,
//                           style: AppTextstyle.texttwo(context),
//                         ),
//                         20.Y,
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: dummyproducts.map((product) {
//                               return ProductCard(
//                                 imagePath: product.imagePath.toString(),
//                                 discount: product.discount.toString(),
//                                 brand: product.brand.toString(),
//                                 productName: product.productName.toString(),
//                                 oldPrice: product.oldPrice.toString(),
//                                 newPrice: product.newPrice.toString(),
//                               );
//                             }).toList(),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ).paddingOnly(top: 300, left: 20)
//               ],
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: CommonBottomNavBar(),
//     );
//   }
// }

// List<ProductModel> dummyproducts =
//     dummyproduct.map((e) => ProductModel.fromjson(e)).toList();
