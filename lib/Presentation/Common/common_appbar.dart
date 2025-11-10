import 'package:fashion_sale/Data/imagepath.dart';
import 'package:fashion_sale/Presentation/Common/common_images.dart';
import 'package:flutter/material.dart';
import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';

import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:fashion_sale/Data/extenstion.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBack;
  final bool showSearch;
  final VoidCallback? onSearchTap;

  const CommonAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBack = true,
    this.showSearch = true,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBack
          ? InkWell(
              onTap: () => Navigate.pop(context),
              child: AssetImages(
                width: 10.w,
                height: 10.h,
                issvg: true,
                imagepath: ImagePath.backsvg,
                fit: BoxFit.contain,
              ).padSymmetric(horizontal: 10),
            )
          : null,
      title: Center(child: CommonText(text: title)),
      actions: [
        if (showSearch)
          InkWell(
            onTap: onSearchTap,
            child: AssetImages(
              width: 30,
              height: 30,
              issvg: true,
              imagepath: ImagePath.searchsvg,
              fit: BoxFit.contain,
            ).padSymmetric(horizontal: 10),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
