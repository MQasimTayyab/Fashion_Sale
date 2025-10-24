import 'package:fashion_sale/Presentation/Widget/range_price/range_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonCircleAvatar extends StatelessWidget {
  final Color fillColor;
  final Color borderColor;
  final double radius;
  final double borderWidth;

  const CommonCircleAvatar({
    super.key,
    required this.fillColor,
    required this.borderColor,
    this.radius = 28,
    this.borderWidth = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    final rangeController = Get.find<RangeController>();

    return Obx(() {
      bool isSelected = rangeController.selectedColors.contains(fillColor);

//gesturedectector
      return GestureDetector(
        onTap: () => rangeController.toggleColor(fillColor),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fillColor,
            border: Border.all(
              color: isSelected ? borderColor : Colors.transparent,
              width: isSelected ? borderWidth : 1.5,
            ),
          ),
        ),
      );
    });
  }
}
