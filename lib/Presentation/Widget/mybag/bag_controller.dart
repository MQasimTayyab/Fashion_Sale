//
import 'package:get/get.dart';

class BagController extends GetxController {
  // List of cart items
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  // add product to cart
  void addToCart(Map<String, dynamic> item) {
    // check agar product already cart me hai
    int index = cartItems.indexWhere(
        (cartItem) => cartItem['productName'] == item['productName']);

    if (index != -1) {
      cartItems[index]['quantity']++;
      cartItems.refresh();
    } else {
      item['quantity'] = 1;
      cartItems.add(item);
    }
    updateTotal();
  }

  // increase quantity
  void increaseQuantity(int index) {
    cartItems[index]['quantity']++;
    cartItems.refresh();
    updateTotal();
  }

  // decrease quantity
  void decreaseQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    } else {
      cartItems.removeAt(index);
    }
    cartItems.refresh();
    updateTotal();
  }

  // remove item
  void removeFromCart(int index) {
    cartItems.removeAt(index);
    updateTotal();
  }

  // Total amount
  RxDouble totalAmount = 0.0.obs;

  void updateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      //price
      double price = 0.0;
      if (item['price'] is String) {
        price = double.tryParse(item['price']) ?? 0.0;
      } else {
        price = (item['price'] ?? 0.0).toDouble();
      }

      total += price * (item['quantity'] ?? 1);
    }
    totalAmount.value = total;
  }
}
