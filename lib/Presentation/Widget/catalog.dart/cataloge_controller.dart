// import 'package:get/get.dart';
// import 'package:fashion_sale/Data/utils.dart';
// import 'package:fashion_sale/Domain/Model/women_page.dart';

// class CatalogController extends GetxController {
//   var selectedSort = "Price: Highest to Low".obs;
//   var womenProducts = <WomenDiscountModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     womenProducts.value = Utils.dummyWomenDiscountJson
//         .map((e) => WomenDiscountModel.fromJson(e))
//         .toList();
//     sortProducts("Price: Highest to Low");
//   }

//   void sortProducts(String title) {
//     selectedSort.value = title;

//     if (title == "Price: Lowest to Highest") {
//       womenProducts.sort((a, b) => double.parse(a.newPrice.toString())
//           .compareTo(double.parse(b.newPrice.toString())));
//     } else if (title == "Price: Highest to Low") {
//       womenProducts.sort((a, b) => double.parse(b.newPrice.toString())
//           .compareTo(double.parse(a.newPrice.toString())));
//     }
//     update();
//   }
// }
import 'package:get/get.dart';
import 'package:fashion_sale/Domain/Model/women_page.dart';
import 'package:fashion_sale/Data/utils.dart';

class CatalogController extends GetxController {
  var womenProducts = <WomenDiscountModel>[].obs;
  var filteredProducts = <WomenDiscountModel>[].obs;
  var selectedSort = "Price: Lowest to Highest".obs;

  @override
  void onInit() {
    super.onInit();
    womenProducts.value = Utils.dummyWomenDiscountJson
        .map((e) => WomenDiscountModel.fromJson(e))
        .toList();
    filteredProducts.value = womenProducts;
  }

  void filterProductsByCategory(String category) {
    filteredProducts.value = womenProducts
        .where((p) => p.category?.toLowerCase() == category.toLowerCase())
        .toList();
  }

  void sortProducts(String sortType) {
    selectedSort.value = sortType;

    if (sortType == "Price: Lowest to Highest") {
      filteredProducts.sort((a, b) => a.newPrice.compareTo(b.newPrice));
    } else if (sortType == "Price: Highest to Low") {
      filteredProducts.sort((a, b) => b.newPrice.compareTo(a.newPrice));
    }
  }
}

// import 'package:fashion_sale/Data/utils.dart';
// import 'package:fashion_sale/Domain/Model/women_page.dart';
// import 'package:get/get.dart';

// class CatalogController extends GetxController {
//   RxList<WomenDiscountModel> filteredProducts = <WomenDiscountModel>[].obs;

//   void filterProductsByCategory(String category) {
//     // 👇 Dummy products Utils se aate hain
//     final allProducts = Utils.dummyWomenDiscountJson
//         .map((e) => WomenDiscountModel.fromJson(e))
//         .toList();

//     // 👇 Filter by category name
//     filteredProducts.assignAll(allProducts.where((p) {
//       return p.brand.toLowerCase().contains(category.toLowerCase()) ||
//           p.productName.toLowerCase().contains(category.toLowerCase());
//     }).toList());
//   }
// }
