import 'package:fashion_sale/Data/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RangeController extends GetxController {
  // current range slider
  Rx<RangeValues> currentRangeValues = const RangeValues(0, 200).obs;

  // filter products
  RxList<Map<String, dynamic>> filteredProducts = <Map<String, dynamic>>[].obs;

  // selected colors
  RxList<Color> selectedColors = <Color>[].obs;

  // all products
  late final List<Map<String, dynamic>> allProducts;

  @override
  void onInit() {
    super.onInit();

    // combine utils data
    allProducts = [
      ...Utils.dummyWomenDiscountJson,
      ...Utils.dummywomenJson,
    ];

    filteredProducts.assignAll(allProducts);
  }

  // update range slider
  void updateRange(RangeValues values) {
    currentRangeValues.value = values;
    filterProducts();
  }

  //  color selection
  void toggleColor(Color color) {
    if (selectedColors.contains(color)) {
      selectedColors.remove(color);
    } else {
      selectedColors.add(color);
    }
    filterProducts(); // update color select
  }

  // main filter function
  void filterProducts() {
    final start = currentRangeValues.value.start;
    final end = currentRangeValues.value.end;

    filteredProducts.assignAll(
      allProducts.where((product) {
        final price = double.tryParse(
              product["price"]?.toString() ??
                  product["newPrice"]?.toString() ??
                  "0",
            ) ??
            0;

        final productColor = product["color"];

        final matchesPrice = price >= start && price <= end;
        final matchesColor =
            selectedColors.isEmpty || selectedColors.contains(productColor);

        return matchesPrice && matchesColor;
      }),
    );
  }

  // reset all filters
  void resetRange() {
    currentRangeValues.value = const RangeValues(0, 200);
    selectedColors.clear();
    filteredProducts.assignAll(allProducts);
  }

  // apply filter ...
  void applyFilter() {
    filterProducts();
  }
}
