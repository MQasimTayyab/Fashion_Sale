import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common_text.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String discount;
  final String brand;
  final String productName;
  final String oldPrice;
  final String newPrice;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.discount,
    required this.brand,
    required this.productName,
    required this.oldPrice,
    required this.newPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                          height: 184.h,
                          width: 148.w,
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 50.w,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CommonText(
                          text: discount,
                          style: AppTextstyle.texttwo(
                            context,
                            color: AppColors.whiteText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.Y,
              CommonText(
                text: brand,
                style: AppTextstyle.texttwo(context, fontsize: 16.sp),
              ),
              CommonText(
                text: productName,
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  CommonText(
                    text: "${oldPrice.toString()}\$",
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  8.x,
                  CommonText(
                    text: "${newPrice.toString()}\$",
                    style: AppTextstyle.texttwo(
                      context,
                      color: AppColors.blackIcon,
                      fontsize: 16.sp,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
