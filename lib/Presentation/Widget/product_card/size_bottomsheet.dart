import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'size_controller.dart';

class SizeBottomSheet extends StatelessWidget {
  final SizeController controller = Get.find<SizeController>();
  final List<String> sizes = ["XS", "S", "M", "L", "XL"];

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
            text: "Select Size",
            style: AppTextstyle.texttwo(context,
                fontsize: 18, fontWeight: FontWeight.w600),
          ),
          20.Y,
          Obx(() => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: sizes.map((size) {
                  final isSelected = controller.selectedSize.value == size;
                  return GestureDetector(
                    onTap: () => controller.selectSize(size),
                    child: Container(
                      width: 60,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primaryRed : Colors.white,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryRed
                              : AppColors.filterGrey,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CommonText(
                        text: size,
                        style: AppTextstyle.texttwo(
                          context,
                          fontsize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              isSelected ? Colors.white : AppColors.filterBlack,
                        ),
                      ),
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
