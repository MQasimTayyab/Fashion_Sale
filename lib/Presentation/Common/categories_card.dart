// import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
// import 'package:fashion_sale/Data/app_color.dart';
// import 'package:fashion_sale/Data/app_textstyle.dart';
// import 'package:fashion_sale/Data/extenstion.dart';
// import 'package:fashion_sale/Presentation/Common/common_images.dart';
// import 'package:fashion_sale/Presentation/Common/common_text.dart';
// import 'package:fashion_sale/Presentation/Widget/catalog.dart/components/catalog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CategoryCard extends StatelessWidget {
//   final String title;

//   final String imagePath;

//   const CategoryCard({
//     super.key,
//     required this.title,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigate.to(context, Cataloge());
//       },
//       child: Card(
//         child: SizedBox(
//           width: 343.w,
//           height: 140.h,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: CommonText(
//                       text: title,
//                       style: AppTextstyle.textone(context,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.blackIcon,
//                           fontsize: 18.sp),
//                     ).padOnly(left: 22.h),
//                   ),
//                 ],
//               ),
//               AssetImages(
//                 issvg: false,
//                 imagepath: imagePath,
//                 width: 170.w,
//               )
//               // Image.asset(
//               //   imagePath,
//               //   width: 170.w,
//               //   // height: 80.h,
//               //   fit: BoxFit.contain,
//               // ),
//             ],
//           ).padSymmetric(horizontal: 16),
//         ),
//       ),
//     );
//   }
// }
import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_images.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/catalog.dart/components/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 👇 Category name pass ho raha hai Cataloge screen me
        Navigate.to(context, Cataloge(categoryName: title));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 343.w,
          height: 140.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: title,
                style: AppTextstyle.textone(
                  context,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackIcon,
                  fontsize: 18.sp,
                ),
              ).padOnly(left: 22.h),
              AssetImages(
                issvg: false,
                imagepath: imagePath,
                width: 170.w,
              ),
            ],
          ).padSymmetric(horizontal: 16),
        ),
      ),
    );
  }
}
