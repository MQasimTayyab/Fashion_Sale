import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';

import 'package:fashion_sale/Presentation/Widget/fashion_sale/product_controller.dart';
import 'package:fashion_sale/Presentation/Widget/street_cloth/components/first_section.dart';
import 'package:fashion_sale/Presentation/Widget/street_cloth/components/second_section.dart';
import 'package:fashion_sale/Presentation/Widget/street_cloth/components/street_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StreetCloth extends StatefulWidget {
  const StreetCloth({super.key});

  @override
  State<StreetCloth> createState() => _StreetClothState();
}

class _StreetClothState extends State<StreetCloth> {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  Banner Section
              streetbanner(context),

              // First Section (Sale)
              firstsection(context).paddingSymmetric(horizontal: 20.w),

              25.h.Y,

              //  Second Section (Newest)
              secondsection(context).paddingSymmetric(horizontal: 20.w),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(),
    );
  }
}
