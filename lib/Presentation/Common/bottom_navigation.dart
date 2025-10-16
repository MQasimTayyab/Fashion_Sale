import 'package:fashion_sale/Application/Services/Navigation_Services/navigation_services.dart';
import 'package:fashion_sale/Presentation/Common/bottomnav_controller.dart';
import 'package:fashion_sale/Presentation/Widget/categories/categories.dart';
import 'package:fashion_sale/Presentation/Widget/homepage/home_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBottomNavBar extends StatelessWidget {
  CommonBottomNavBar({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigate.to(context, HomePage());
                  },
                  child: Icon(Icons.home)),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigate.to(context, Categories());
                  },
                  child: Icon(Icons.shopping_cart_outlined)),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Bag",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ));
  }
}
