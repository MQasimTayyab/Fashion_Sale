import 'package:get/get.dart';

class BrandController extends GetxController {
  // All brands
  final List<String> allBrands = [
    'adidas',
    'adidas Originals',
    'Blend',
    'Boutique Moschino',
    'Champion',
    'Diesel',
    'Jack & Jones',
    'Naf Naf',
    'Red Valentino',
    's.Oliver',
  ];

  RxList<String> filteredBrands = <String>[].obs;
  RxList<String> selectedBrands = <String>[].obs;

  @override
  void onInit() {
    filteredBrands.assignAll(allBrands);
    super.onInit();
  }

  void searchBrand(String query) {
    if (query.isEmpty) {
      filteredBrands.assignAll(allBrands);
    } else {
      filteredBrands.assignAll(
        allBrands.where(
            (brand) => brand.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  void toggleBrand(String brand) {
    if (selectedBrands.contains(brand)) {
      selectedBrands.remove(brand);
    } else {
      selectedBrands.add(brand);
    }
  }

  void discard() {
    selectedBrands.clear();
    filteredBrands.assignAll(allBrands);
  }

  void apply() {
    //return select brand
    Get.back(result: selectedBrands.toList());
  }
}
