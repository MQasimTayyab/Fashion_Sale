import 'package:fashion_sale/Domain/Model/categories.dart';

class Utils {
  // dummy categories
  static List<Map<String, dynamic>> dummyCategories = [
    {
      "title": "New",
      "imagePath": "assets/images/image 4.1.png",
    },
    {
      "title": "Clothes",
      "imagePath": "assets/images/image 5.png",
    },
    {
      "title": "Shoes",
      "imagePath": "assets/images/image 7.png",
    },
    {
      "title": "Accesories",
      "imagePath": "assets/images/image 8.png",
    },
  ];
  //

  //product caterg
  static List<Map<String, dynamic>> dummyproduct = [
    {
      "imagePath":
          "assets/images/ff48013c2e83ffc52e71ad79aa63042d84df66ea (1).png",
      "discount": "New",
      "brand": "Dorothy perkins",
      "productName": "Evening Dress",
      "oldPrice": "15",
      "newPrice": "12"
    },
    {
      "imagePath": "assets/images/744caf4f8cbe22e0d501d66b730b03c24f793383.png",
      "discount": "New",
      "brand": "Sitlly",
      "productName": "Sport Dress",
      "oldPrice": "22",
      "newPrice": "19"
    },

    //second time

    {
      "imagePath":
          "assets/images/ff48013c2e83ffc52e71ad79aa63042d84df66ea (1).png",
      "discount": "New",
      "brand": "Dorothy perkins",
      "productName": "Evening Dress",
      "oldPrice": "15",
      "newPrice": "12"
    },
    {
      "imagePath": "assets/images/744caf4f8cbe22e0d501d66b730b03c24f793383.png",
      "discount": "New",
      "brand": "Dorothy",
      "productName": "Sport Dress",
      "oldPrice": "12",
      "newPrice": "10"
    },
  ];

//womenjson

  static List<Map<String, dynamic>> dummywomenJson = [
    {
      "productName": "Mango",
      "brand": "Pullover",
      "rating": 3,
      "price": 51.0,
      "imagePath": "assets/images/photo.png"
    },
    {
      "productName": "Dorothy Perkins",
      "brand": "Blouse",
      "rating": 4,
      "price": 34.0,
      "imagePath": "assets/images/image w3.png"
    },
    {
      "productName": "LOST Ink",
      "brand": "T-shirt",
      "rating": 10,
      "price": 12.0,
      "imagePath": "assets/images/image w1.png"
    },
    {
      "productName": "Topshop",
      "brand": "Shirt",
      "rating": 3,
      "price": 51.0,
      "imagePath": "assets/images/image w2.png"
    },
  ];

  //dummywomen discount

  static List<Map<String, dynamic>> dummyWomenDiscountJson = [
    {
      "productName": "T-Shirt SPANISH",
      "brand": "Mango",
      "rating": 3,
      "oldPrice": 21.0,
      "newPrice": 9.0,
      "discount": "-20%",
      "imagePath": "assets/images/photofo.png"
    },
    {
      "productName": "Blouse",
      "brand": "Dorothy Perkins",
      "rating": 10,
      "oldPrice": 21.0,
      "newPrice": 14.0,
      "discount": "-20%",
      "imagePath": "assets/images/phototre.png"
    },
    {
      "productName": "Shirt",
      "brand": "Mango",
      "rating": 0,
      "oldPrice": 17.0,
      "newPrice": 14.0,
      "discount": "-20%",
      "imagePath": "assets/images/photofo.png"
    },
    {
      "productName": "Light Blouse",
      "brand": "Dorothy Perkins",
      "rating": 10,
      "oldPrice": 21.0,
      "newPrice": 14.0,
      "discount": "-20%",
      "imagePath": "assets/images/phototre.png"
    },
  ];

  // title
  static List<CategoryModel> dummytitle = [
    CategoryModel(title: "Tops"),
    CategoryModel(title: "Shirts & Blouses"),
    CategoryModel(title: "Cardigans & Sweaters"),
    CategoryModel(title: "Knitwear"),
    CategoryModel(title: "Blazers"),
    CategoryModel(title: "Outerwear"),
    CategoryModel(title: "Pants"),
    CategoryModel(title: "Jeans"),
    CategoryModel(title: "Shorts"),
    CategoryModel(title: "Skirts"),
    CategoryModel(title: "Dresses"),
    CategoryModel(title: "Home"),
    CategoryModel(title: "Shop"),
    CategoryModel(title: "Bag"),
    CategoryModel(title: "Favorites"),
    CategoryModel(title: "Profile"),
  ];
}
