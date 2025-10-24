import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_btn.dart';
import 'package:fashion_sale/Presentation/Common/common_circleavtar.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/range_price/filter_product.dart';
import 'package:fashion_sale/Presentation/Widget/range_price/range_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//range slider

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
          CommonText(
            text: AppStrings.pricerange,
            style: AppTextstyle.texttwo(
              context,
              fontsize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          20.Y,
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text:
                        "\$${controller.currentRangeValues.value.start.round()}",
                    style: AppTextstyle.texttwo(context),
                  ),
                  CommonText(
                    text:
                        "\$${controller.currentRangeValues.value.end.round()}",
                    style: AppTextstyle.texttwo(context),
                  ),
                ],
              )),
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
          CommonText(
            text: AppStrings.colors,
            style: AppTextstyle.texttwo(
              context,
              fontsize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonCircleAvatar(
                fillColor: AppColors.filterBlack,
                borderColor: AppColors.lightRed,
              ),
              CommonCircleAvatar(
                fillColor: AppColors.whiteIcon,
                borderColor: AppColors.lightRed,
              ),
              CommonCircleAvatar(
                fillColor: AppColors.lightRed,
                borderColor: AppColors.lightRed,
              ),
              CommonCircleAvatar(
                fillColor: AppColors.filterBrown,
                borderColor: Colors.red,
              ),
              CommonCircleAvatar(
                fillColor: AppColors.filterGrey,
                borderColor: Colors.red,
              ),
              CommonCircleAvatar(
                fillColor: AppColors.filterNavy,
                borderColor: Colors.red,
              ),
            ],
          ),
          15.Y,
          CommonText(
            text: AppStrings.sizes,
            style: AppTextstyle.texttwo(
              context,
              fontsize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          15.Y,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CommonButton(
                  text: AppStrings.discard,
                  textColor: AppColors.filterBlack,
                  color: AppColors.greyBackground,
                  onPressed: controller.resetRange,
                ),
              ),
              15.X,
              Expanded(
                child: CommonButton(
                  text: AppStrings.apply,
                  onPressed: () {
                    controller.applyFilter();
                    Navigate.to(context, FilteredProductScreen());
                  },
                ),
              ),
            ],
          ),
        ],
      ).padAll(20.w),
    );
  }
}
