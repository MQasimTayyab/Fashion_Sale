import 'package:fashion_sale/Data/utils.dart';
import 'package:get/get.dart';
import 'package:fashion_sale/Domain/Model/product_model.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxString error = "".obs;
  RxList products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }
  //

  void loadProducts() async {
    try {
      isLoading(true);

      error("");

      await Future.delayed(Duration(seconds: 2));

      products.value =
          Utils.dummyproduct.map((e) => ProductModel.fromjson(e)).toList();

      if (products.isEmpty) {
        error("No products found");
      }
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
