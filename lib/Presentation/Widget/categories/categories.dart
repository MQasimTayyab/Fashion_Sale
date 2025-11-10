// import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
// import 'package:fashion_sale/Data/app_color.dart';
// import 'package:fashion_sale/Data/app_strings.dart';
// import 'package:fashion_sale/Data/app_textstyle.dart';

// import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';

// import 'package:fashion_sale/Presentation/Common/common_text.dart';
// import 'package:fashion_sale/Presentation/Widget/categories/components/women_tab.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // summer sale /women / men/ kids

// class Categories extends StatefulWidget {
//   const Categories({super.key});

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: InkWell(
//             onTap: () {
//               Navigate.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//             ),
//           ),
//           title: Center(
//             child: CommonText(
//               text: AppStrings.categories,
//               style: AppTextstyle.texttwo(context,
//                   fontsize: 18.sp, fontWeight: FontWeight.w400),
//             ),
//           ),
//           actions: [Icon(Icons.search)],
//           bottom: TabBar(
//             dividerHeight: 0,
//             indicatorColor: AppColors.primaryButton,
//             indicatorSize: TabBarIndicatorSize.tab,
//             tabs: [
//               Tab(
//                   child: CommonText(
//                 text: AppStrings.women,
//                 style: AppTextstyle.texttwo(context,
//                     fontWeight: FontWeight.w400, fontsize: 16.sp),
//               )),
//               Tab(
//                   child: CommonText(
//                 text: AppStrings.men,
//                 style: AppTextstyle.texttwo(context,
//                     fontWeight: FontWeight.w400, fontsize: 16.sp),
//               )),
//               Tab(
//                   child: CommonText(
//                 text: AppStrings.kid,
//                 style: AppTextstyle.texttwo(context,
//                     fontWeight: FontWeight.w400, fontsize: 16.sp),
//               )),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             //tab1

//             womentab(context),
//             //tab2
//             Column(
//               children: [
//                 Container(
//                   width: 100.w,
//                   height: 100.h,
//                   color: Colors.pink,
//                 )
//               ],
//             ),
//             //tab 3
//             Column(
//               children: [
//                 Container(
//                   width: 100.w,
//                   height: 100.h,
//                   color: Colors.blue,
//                 )
//               ],
//             ),
//           ],
//         ),
//         bottomNavigationBar: CommonBottomNavBar(),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Data/app_strings.dart';
import 'package:fashion_sale/Data/app_textstyle.dart';
import 'package:fashion_sale/Presentation/Common/bottom_navigation.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Presentation/Widget/categories/components/kids_tab.dart';
import 'package:fashion_sale/Presentation/Widget/categories/components/men_tab.dart';
import 'package:fashion_sale/Presentation/Widget/categories/components/women_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  RxInt currentBannerIndex = 0.obs;
  late Timer _timer;

  final List<Map<String, dynamic>> banners = [
    {
      "title": " Summer Sale",
      "subtitle": "Up to 50% Off on all items",
      "color": Colors.orangeAccent,
    },
    {
      "title": " Winter Collection",
      "subtitle": "Stay warm with style",
      "color": Colors.lightBlueAccent,
    },
    {
      "title": " Autumn Arrivals",
      "subtitle": "New season, new trends",
      "color": Colors.amber,
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      currentBannerIndex.value =
          (currentBannerIndex.value + 1) % banners.length;
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}

class Categories extends StatelessWidget {
  Categories({super.key});

  final BannerController bannerController = Get.put(BannerController());

  Widget buildBanner(BuildContext context) {
    return Obx(() {
      final banner =
          bannerController.banners[bannerController.currentBannerIndex.value];
      return AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        margin: EdgeInsets.all(12.w),
        padding: EdgeInsets.all(20.w),
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: banner["color"],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: banner["title"],
              style: AppTextstyle.texttwo(
                context,
                fontsize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            6.h.verticalSpace,
            CommonText(
              text: banner["subtitle"],
              style: AppTextstyle.texttwo(
                context,
                fontsize: 14.sp,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigate.pop(context),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Center(
            child: CommonText(
              text: AppStrings.categories,
              style: AppTextstyle.texttwo(context,
                  fontsize: 18.sp, fontWeight: FontWeight.w400),
            ),
          ),
          actions: [Icon(Icons.search)],
          bottom: TabBar(
            dividerHeight: 0,
            indicatorColor: AppColors.primaryButton,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                  child: CommonText(
                      text: AppStrings.women,
                      style: AppTextstyle.texttwo(context,
                          fontWeight: FontWeight.w400, fontsize: 16.sp))),
              Tab(
                  child: CommonText(
                      text: AppStrings.men,
                      style: AppTextstyle.texttwo(context,
                          fontWeight: FontWeight.w400, fontsize: 16.sp))),
              Tab(
                  child: CommonText(
                      text: AppStrings.kid,
                      style: AppTextstyle.texttwo(context,
                          fontWeight: FontWeight.w400, fontsize: 16.sp))),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  womentab(context),
                  mentab(context),
                  kidstab(context),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CommonBottomNavBar(),
      ),
    );
  }
}
