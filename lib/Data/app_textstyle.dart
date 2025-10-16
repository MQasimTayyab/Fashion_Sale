import 'package:fashion_sale/Data/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextstyle {
  static TextStyle textone(
    BuildContext context, {
    double? fontsize,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontsize ?? 40.sp,
      color: color ?? AppColors.whiteIcon,
      fontFamily: fontFamily ?? 'Metropolis',
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle texttwo(
    BuildContext context, {
    double? fontsize,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontsize ?? 15.sp,
      color: color ?? AppColors.filterBlack,
      fontFamily: fontFamily ?? 'Metropolis',
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle textthree(
    BuildContext context, {
    double? fontsize,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontsize ?? 12.sp,
      color: color ?? AppColors.filterBlack,
      fontFamily: fontFamily ?? 'Metropolis',
      fontWeight: fontWeight ?? FontWeight.w100,
    );
  }
}
