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
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                width: 110.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                            height: 150.h,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: AppColors.filterBlack,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: CommonText(
                              text: discount,
                              style: AppTextstyle.texttwo(
                                context,
                                fontWeight: FontWeight.normal,
                                color: AppColors.whiteText,
                                fontsize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).padAll(10.w)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Brand
              CommonText(
                text: brand,
                style: AppTextstyle.texttwo(context,
                    fontsize: 10.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.filterGrey),
              ),

              //  Product Name
              CommonText(
                  text: productName,
                  style: AppTextstyle.textone(context,
                      fontsize: 14.sp, color: AppColors.filterBlack)),

              6.h.Y,

              //  Price Row
              Row(
                children: [
                  CommonText(
                    text: "$oldPrice\$",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 8.sp,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  8.w.X,
                  CommonText(
                    text: "$newPrice\$",
                    style: AppTextstyle.texttwo(
                      context,
                      color: AppColors.filterRed,
                      fontsize: 8.sp,
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
