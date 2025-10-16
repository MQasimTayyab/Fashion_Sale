import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';

import 'package:fashion_sale/Presentation/Widget/collections/collection_controller.dart';
import 'package:fashion_sale/Presentation/Widget/collections/components/new_collection.dart';
import 'package:fashion_sale/Presentation/Widget/collections/components/three_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Collection extends StatelessWidget {
  Collection({super.key});

  final CollectionController controller = Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.error.isNotEmpty) {
            return Center(
              child: Text(
                controller.error.value,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                newcollection(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.collections.length,
                  itemBuilder: (context, index) {
                    return CommonText(
                      text: controller.collections[index],
                      style: AppTextstyle.texttwo(context, fontsize: 18.sp),
                    ).padAll(12);
                  },
                ),

                //three sizeboxes summersale/hoodies image/ and black image
                threewidgets(context),
              ],
            ),
          );
        }),
        bottomNavigationBar: CommonBottomNavBar(),
      ),
    );
  }
}
