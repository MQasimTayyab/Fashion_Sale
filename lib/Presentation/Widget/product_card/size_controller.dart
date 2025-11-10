import 'package:get/get.dart';

class SizeController extends GetxController {
  RxString selectedSize = ''.obs;

  void selectSize(String size) {
    selectedSize.value = size;
  }
}
