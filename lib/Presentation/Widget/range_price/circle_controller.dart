import 'package:get/get.dart';

class CircleAvatarController extends GetxController {
  RxInt selectedIndex = (-1).obs;

  void toggleSelection(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }
}
