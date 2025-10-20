import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/range_price/filter_product.dart';
import 'package:fashion_sale/Presentation/Widget/range_price/range_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RangeSliderScreen extends StatelessWidget {
  const RangeSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RangeController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: CommonText(
            text: AppStrings.filters,
            style: AppTextstyle.texttwo(
              context,
              fontsize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // price label
          CommonText(
            text: AppStrings.pricerange,
            style: AppTextstyle.texttwo(
              context,
              fontsize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          20.Y,

          // Price range value
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${controller.currentRangeValues.value.start.round()}",
                    style: AppTextstyle.texttwo(context),
                  ),
                  Text(
                    "\$${controller.currentRangeValues.value.end.round()}",
                    style: AppTextstyle.texttwo(context),
                  ),
                ],
              )),

          // Range slider
          Obx(
            () => RangeSlider(
              activeColor: AppColors.primaryRed,
              inactiveColor: Colors.grey.shade400,
              values: controller.currentRangeValues.value,
              max: 200,
              divisions: 20,
              labels: RangeLabels(
                controller.currentRangeValues.value.start.round().toString(),
                controller.currentRangeValues.value.end.round().toString(),
              ),
              onChanged: controller.updateRange,
            ),
          ),
          20.Y,

          //colors filter
          CommonText(
            text: AppStrings.colors,
            style: AppTextstyle.texttwo(
              context,
              fontsize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                foregroundColor: AppColors.warning,
                backgroundColor: AppColors.blackIcon,
              ),
              5.X,
              CircleAvatar(
                backgroundColor: AppColors.lightRed,
              ),
              // ColorFiltered(
              //   colorFilter:
              //       ColorFilter.mode(Colors.pinkAccent, BlendMode.color),
              //   child: CommonText(
              //     text: AppStrings.accessories,
              //     style: AppTextstyle.textone(context),
              //   ),
              // ),
              5.X,
              // Container(
              //   width: 50,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     shape: BoxShape.circle,
              //     border: Border.all(
              //       color: Colors.green,
              //       width: 2,
              //     ),
              //   ),
              // )
            ],
          ),
          15.Y,
          //

          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Discard Button
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  onPressed: () {
                    controller.resetRange();
                  },
                  child: CommonText(
                    text: "Discard",
                    style: AppTextstyle.texttwo(
                      context,
                      fontsize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              15.X,

              // Apply Button
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  onPressed: () {
                    controller.applyFilter();

                    Navigate.to(context, FilteredProductScreen());
                  },
                  child: CommonText(
                    text: "Apply",
                    style: AppTextstyle.texttwo(
                      context,
                      fontsize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).padAll(20.w),
    );
  }
}

// import 'package:fashion_sale/Data/app_color.dart';
// import 'package:fashion_sale/Data/app_strings.dart';
// import 'package:fashion_sale/Data/app_textstyle.dart';
// import 'package:fashion_sale/Data/extenstion.dart';
// import 'package:fashion_sale/Presentation/Common/common_text.dart';
// import 'package:fashion_sale/Presentation/Widget/range_price/range_controller.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class RangeSliderScreen extends StatelessWidget {
//   const RangeSliderScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(RangeController());

//     return Scaffold(
//       appBar: AppBar(
//           title: Center(
//               child: CommonText(
//         text: AppStrings.filters,
//         style: AppTextstyle.texttwo(context,
//             fontsize: 18.sp, fontWeight: FontWeight.w400),
//       ))),
//       body:
//           //parent column price/color or more....
//           Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //price range slider
//           CommonText(
//             text: AppStrings.pricerange,
//             style: AppTextstyle.texttwo(context,
//                 fontsize: 16.sp, fontWeight: FontWeight.w400),
//           ),
//           30.Y,
//           Obx(() => RangeSlider(
//                 activeColor: AppColors.primaryRed,
//                 values: controller.currentRangeValues.value,
//                 max: 200,
//                 divisions: 10,
//                 labels: RangeLabels(
//                   controller.currentRangeValues.value.start.round().toString(),
//                   controller.currentRangeValues.value.end.round().toString(),
//                 ),
//                 onChanged: controller.updateRange,
//               )),
//           10.Y,

//           //colors section
//           CommonText(
//             text: AppStrings.colors,
//             style: AppTextstyle.texttwo(context, fontWeight: FontWeight.w400),
//           ),
//           10.Y,

// Row(
//   children: [
//     CircleAvatar(
//       radius: 20,
//       foregroundColor: Colors.amber,
//       backgroundColor: AppColors.blackIcon,
//     ),
//     5.X,
//     CircleAvatar(
//       backgroundColor: AppColors.backgroundColor,
//     ),
//     5.X,
//     Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: Colors.green,
//           width: 2,
//         ),
//       ),
//     )
//   ],
// ),
//           //sizes
//           10.Y,
//           CommonText(
//             text: AppStrings.sizes,
//             style: AppTextstyle.texttwo(context, fontWeight: FontWeight.w400),
//           )
//         ],
//       ).padAll(20),
//     );
//   }
// }
