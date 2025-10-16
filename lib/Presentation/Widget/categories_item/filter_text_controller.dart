import 'package:fashion_sale/Data/utils.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  List categories = Utils.dummytitle.obs;
  List filteredList = Utils.dummytitle.obs;

  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(categories);
    } else {
      final results = categories.where((item) {
        final title = item.title.toString().toLowerCase();
        return title.contains(query.toLowerCase());
      }).toList();
      filteredList.assignAll(results);
    }
  }
}
