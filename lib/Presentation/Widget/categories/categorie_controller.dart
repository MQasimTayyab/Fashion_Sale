// import 'package:get/get.dart';

// class CategoriesController extends GetxController {
//   var isLoading = true.obs;
//   var error = "".obs;
//   var categories = <Map<String, dynamic>>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//   }

//   void fetchCategories() async {
//     try {
//       isLoading(true);
//       await Future.delayed(const Duration(seconds: 2)); // simulate API delay

//       error(""); // clear error
//     } catch (e) {
//       error("Failed to load categories");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
