import 'package:fashion_sale/Presentation/Widget/fashion_sale/Components/banner.dart';
import 'package:fashion_sale/Presentation/Widget/fashion_sale/Components/new_product.dart';

import 'package:fashion_sale/Presentation/Widget/fashion_sale/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //banner
              banner(context),
              //new product

              newproduct(context)
                  .padSymmetric(horizontal: 20.w, vertical: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(),
    );
  }
}
