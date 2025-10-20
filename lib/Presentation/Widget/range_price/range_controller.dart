import 'package:fashion_sale/Data/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RangeController extends GetxController {
  // current range slider
  Rx<RangeValues> currentRangeValues = RangeValues(0, 200).obs;

  // filter products
  RxList<Map<String, dynamic>> filteredProducts = <Map<String, dynamic>>[].obs;

  // all product
  late final List<Map<String, dynamic>> allProducts;

  @override
  void onInit() {
    super.onInit();

    // combine utils all in one
    allProducts = [
      ...Utils.dummyWomenDiscountJson,
      ...Utils.dummywomenJson,
    ];

    // show all product init
    filteredProducts.assignAll(allProducts);
  }

  // update slider range and apply filter
  void updateRange(RangeValues values) {
    currentRangeValues.value = values;
    filterProducts();
  }

  //apply price based filter
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
        return price >= start && price <= end;
      }),
    );
  }

  //reseat slider and show all
  void resetRange() {
    currentRangeValues.value = RangeValues(0, 200);
    filteredProducts.assignAll(allProducts);
  }

  //apply filter
  void applyFilter() {
    filterProducts();
  }
}
