import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
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
      appBar: AppBar(
          title: Center(
              child: CommonText(
        text: AppStrings.filters,
        style: AppTextstyle.texttwo(context,
            fontsize: 18.sp, fontWeight: FontWeight.w400),
      ))),
      body:
          //parent column price/color or more....
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //price range slider
          CommonText(
            text: AppStrings.pricerange,
            style: AppTextstyle.texttwo(context,
                fontsize: 16.sp, fontWeight: FontWeight.w400),
          ),
          30.Y,
          Obx(() => RangeSlider(
                activeColor: AppColors.primaryRed,
                values: controller.currentRangeValues.value,
                max: 200,
                divisions: 10,
                labels: RangeLabels(
                  controller.currentRangeValues.value.start.round().toString(),
                  controller.currentRangeValues.value.end.round().toString(),
                ),
                onChanged: controller.updateRange,
              )),
          10.Y,

          //colors section
          CommonText(
            text: AppStrings.colors,
            style: AppTextstyle.texttwo(context, fontWeight: FontWeight.w400),
          ),
          10.Y,

          Row(
            children: [
              CircleAvatar(
                radius: 20,
                foregroundColor: Colors.amber,
                backgroundColor: AppColors.blackIcon,
              ),
              5.X,
              CircleAvatar(
                backgroundColor: AppColors.backgroundColor,
              ),
              5.X,
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              )
            ],
          ),
          //sizes
          10.Y,
          CommonText(
            text: AppStrings.sizes,
            style: AppTextstyle.texttwo(context, fontWeight: FontWeight.w400),
          )
        ],
      ).padAll(20),
    );
  }
}
