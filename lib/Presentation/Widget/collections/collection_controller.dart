import 'package:get/get.dart';

class CollectionController extends GetxController {
  var isLoading = true.obs;
  var error = "".obs;
  var collections = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCollections();
  }

  void fetchCollections() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2));

      error("");
    } catch (e) {
      error("Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
