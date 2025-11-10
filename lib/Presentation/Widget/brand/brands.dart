import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/brand/brand_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrandFilterScreen extends StatelessWidget {
  BrandFilterScreen({super.key});

  final BrandController controller = Get.put(BrandController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CommonText(
            text: AppStrings.brand,
            style: TextStyle(
              color: AppColors.filterBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.filterBlack),
        ),
        body: Column(
          children: [
            //  Search bar
            TextField(
              controller: searchController,
              onChanged: controller.searchBrand,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ).padSymmetric(horizontal: 16),

            20.Y,

            // Brand List
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredBrands.length,
                    itemBuilder: (context, index) {
                      final brand = controller.filteredBrands[index];
                      final isSelected =
                          controller.selectedBrands.contains(brand);

                      return CheckboxListTile(
                        value: isSelected,
                        title: Text(brand),
                        activeColor: AppColors.darkRed,
                        onChanged: (_) => controller.toggleBrand(brand),
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    },
                  )),
            ),

            //  Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: controller.discard,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: CommonText(
                      text: 'Discard',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.blackIcon,
                      ),
                    ),
                  ),
                ),
                10.X,
                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.apply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: CommonText(
                      text: 'Apply',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.whiteText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).padAll(16));
  }
}
