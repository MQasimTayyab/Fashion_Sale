import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'color_controller.dart';

class ColorBottomSheet extends StatelessWidget {
  final ColorController controller = Get.find<ColorController>();

  final List<Map<String, dynamic>> colorOptions = [
    {"name": "Black", "color": Colors.black},
    {"name": "White", "color": Colors.white},
    {"name": "Red", "color": Colors.red},
    {"name": "Blue", "color": Colors.blue},
    {"name": "Beige", "color": const Color(0xFFD8BFD8)},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: "Select Color",
            style: AppTextstyle.texttwo(context,
                fontsize: 18, fontWeight: FontWeight.w600),
          ),
          20.Y,
          Obx(() => Wrap(
                spacing: 15,
                runSpacing: 15,
                children: colorOptions.map((item) {
                  final isSelected =
                      controller.selectedColorName.value == item["name"];
                  return GestureDetector(
                    onTap: () => controller.selectColor(item["name"]),
                    child: Column(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: item["color"],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primaryRed
                                  : AppColors.filterGrey,
                              width: isSelected ? 3 : 1,
                            ),
                          ),
                        ),
                        6.Y,
                        CommonText(
                          text: item["name"],
                          style: AppTextstyle.texttwo(context,
                              fontsize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.filterBlack),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )),
          20.Y,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryRed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () => Navigator.pop(context),
            child: CommonText(text: "Apply"),
          ),
        ],
      ),
    );
  }
}
