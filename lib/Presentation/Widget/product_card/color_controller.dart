import 'package:get/get.dart';

class ColorController extends GetxController {
  RxString selectedColorName = ''.obs;

  void selectColor(String colorName) {
    selectedColorName.value = colorName;
  }
}
