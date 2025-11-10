import 'package:fashion_sale/Data/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bag_controller.dart';
import 'package:fashion_sale/Data/extenstion.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';

class MyBagScreen extends StatelessWidget {
  MyBagScreen({super.key});

  final BagController controller = Get.find<BagController>();
  final TextEditingController promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: "My Bag",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.blackIcon),
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Text("Your bag is empty",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: controller.cartItems.length,
                separatorBuilder: (_, __) =>
                    Divider(thickness: 1, color: Colors.grey),
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item['imagePath'],
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      10.X,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: item['productName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            CommonText(
                                text: "Brand: ${item['brand']}",
                                style: TextStyle(color: Colors.grey)),
                            CommonText(
                                text: "Size: ${item['size']}",
                                style: TextStyle(color: Colors.grey)),
                            CommonText(
                                text: "Color: ${item['color']}",
                                style: TextStyle(color: Colors.grey)),
                            8.Y,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () =>
                                            controller.decreaseQuantity(index),
                                        icon: const Icon(Icons.remove)),
                                    CommonText(text: "${item['quantity']}"),
                                    IconButton(
                                        onPressed: () =>
                                            controller.increaseQuantity(index),
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                                CommonText(
                                  text:
                                      "\$${(item['price'] * item['quantity']).toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.removeFromCart(index),
                        icon: Icon(Icons.delete_outline,
                            color: AppColors.darkRed),
                      ),
                    ],
                  );
                },
              ),
            ),
            20.Y,
            TextField(
              controller: promoController,
              decoration: InputDecoration(
                  hintText: "Enter your promo code",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
            20.Y,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                    text: "Total amount:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Obx(() => Text(
                      "\$${controller.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    )),
              ],
            ),
            20.Y,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Get.snackbar("Checkout", "payment",
                    backgroundColor: Colors.blue, colorText: Colors.white);
              },
              child: CommonText(
                  text: "CHECK OUT",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )
          ],
        ).padAll(16);
      }),
    );
  }
}
