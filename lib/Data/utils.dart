import 'package:fashion_sale/Data/app_color.dart';

class Utils {
//Womens categories
  static List<Map<String, dynamic>> womenscategories = [
    {
      "imagePath":
          "assets/images/womens/ff48013c2e83ffc52e71ad79aa63042d84df66ea (1).png",
      "discount": "New",
      "subcategories": "T-shirts",
      "brand": "adidas",
      "productName": "Evening T-shirt",
      "oldPrice": "25",
      "newPrice": "18",
      "color": AppColors.primaryRed, //  Red
    },
    {
      "imagePath": "assets/images/womens/blackk.png",
      "discount": "-20%",
      "subcategories": "T-shirts",
      "brand": "Blend",
      "productName": "shirt",
      "oldPrice": "35",
      "newPrice": "20",
      "color": AppColors.filterBlack, //  black
    },
    {
      "imagePath": "assets/images/womens/blackshirt.png",
      "discount": "New",
      "subcategories": "T-shirts",
      "brand": "Champion",
      "productName": "shirt",
      "oldPrice": "45",
      "newPrice": "40",
      "color": AppColors.filterBlack, //  black
    },
    {
      "imagePath": "assets/images/womens/grey.png",
      "discount": "New",
      "subcategories": "T-shirts",
      "brand": "Jack & Jones",
      "productName": "shirt",
      "oldPrice": "55",
      "newPrice": "42",
      "color": AppColors.filterGrey, //  grey
    },
    {
      "imagePath": "assets/images/womens/image 2.png",
      "discount": "New",
      "subcategories": "T-shirts",
      "brand": "Naf Naf",
      "productName": "shirt",
      "oldPrice": "65",
      "newPrice": "52",
      "color": AppColors.filterBlack, //  black
    },
    {
      "imagePath": "assets/images/womens/image 4.1.png",
      "discount": "New",
      "subcategories": "Jackets",
      "brand": "s.Oliver",
      "productName": "jacket",
      "oldPrice": "15",
      "newPrice": "12",
      "color": AppColors.filterBlack, //  black
    },
    {
      "imagePath": "assets/images/womens/phototre.png",
      "discount": "New",
      "subcategories": "Blouse",
      "brand": "Blend",
      "productName": "Blouse",
      "oldPrice": "95",
      "newPrice": "82",
      "color": AppColors.filterBlack, //  black
    },
    {
      "imagePath": "assets/images/womens/phototre.png",
      "discount": "New",
      "subcategories": "Light blouse",
      "brand": "Blend",
      "productName": "Light blose",
      "oldPrice": "85",
      "newPrice": "72",
      "color": AppColors.filterBlack, //  black
    },
    {
      "imagePath": "assets/images/womens/image w2.png",
      "discount": "New",
      "subcategories": "Crop tops",
      "brand": "Red valentino",
      "productName": "Tops",
      "oldPrice": "85",
      "newPrice": "72",
      "color": AppColors.filterBlack, //  black
    },
  ];

  //Mens categories
  static List<Map<String, dynamic>> menscategories = [
    {
      "imagePath":
          "assets/images/mens/744caf4f8cbe22e0d501d66b730b03c24f793383.png",
      "discount": "New",
      "subcategories": "T-shirts",
      "brand": "adidas",
      "productName": "T-shirt",
      "oldPrice": "32",
      "newPrice": "19",
      "color": AppColors.whiteIcon, //  white
    },
    {
      "imagePath": "assets/images/mens/menjack.png",
      "discount": "New",
      "subcategories": "Jackets",
      "brand": "Blend",
      "productName": "Jacket",
      "oldPrice": "52",
      "newPrice": "39",
      "color": AppColors.filterGrey, //  blue jeans jacket
    },
  ];
  //kids categories
  static List<Map<String, dynamic>> kidscategories = [];

  //  Dummy Categories
  static List<Map<String, dynamic>> dummyCategories = [
    {
      "title": "New",
      "imagePath": "assets/images/womens/image 4.1.png",
      "color": AppColors.activeBorder
    },
    {
      "title": "Clothes",
      "imagePath": "assets/images/womens/image 5.png",
      "color": AppColors.filterBlack
    },
    {
      "title": "Shoes",
      "imagePath": "assets/images/womens/image 7.png",
      "color": AppColors.filterGrey
    },
    {
      "title": "Accessories",
      "imagePath": "assets/images/womens/image 8.png",
      "color": AppColors.whiteIcon
    },
  ];

  //  Dummy Product Category
  static List<Map<String, dynamic>> dummyproduct = [
    {
      "imagePath":
          "assets/images/womens/ff48013c2e83ffc52e71ad79aa63042d84df66ea (1).png",
      "discount": "New",
      "brand": "Dorothy Perkins",
      "productName": "Evening Dress",
      "oldPrice": "15",
      "newPrice": "12",
      "color": AppColors.primaryRed, //  Red
    },
    {
      "imagePath":
          "assets/images/mens/744caf4f8cbe22e0d501d66b730b03c24f793383.png",
      "discount": "New",
      "brand": "Sitlly",
      "productName": "Sport Dress",
      "oldPrice": "22",
      "newPrice": "19",
      "color": AppColors.filterGrey, //  Grey
    },
    {
      "imagePath":
          "assets/images/womens/ff48013c2e83ffc52e71ad79aa63042d84df66ea (1).png",
      "discount": "New",
      "brand": "Dorothy Perkins",
      "productName": "Evening Dress",
      "oldPrice": "15",
      "newPrice": "12",
      "color": AppColors.primaryRed, //  Red
    },
    {
      "imagePath":
          "assets/images/mens/744caf4f8cbe22e0d501d66b730b03c24f793383.png",
      "discount": "New",
      "brand": "Dorothy",
      "productName": "Sport Dress",
      "oldPrice": "12",
      "newPrice": "10",
      "color": AppColors.filterGrey, //  Grey
    },
  ];

  //  Women Product List
  static List<Map<String, dynamic>> dummywomenJson = [
    {
      "productName": "Mango",
      "brand": "Pullover",
      "rating": 3,
      "price": 51.0,
      "imagePath": "assets/images/womens/photo.png",
      "color": AppColors.filterNavy, //  Navy
    },
    {
      "productName": "Dorothy Perkins",
      "brand": "Blouse",
      "rating": 4,
      "price": 34.0,
      "imagePath": "assets/images/womens/image w3.png",
      "color": AppColors.filterBrown, //  Brown
    },
    {
      "productName": "LOST Ink",
      "brand": "T-shirt",
      "rating": 10,
      "price": 12.0,
      "imagePath": "assets/images/womens/image w1.png",
      "color": AppColors.filterBrown, //brown
    },
    {
      "productName": "Topshop",
      "brand": "Shirt",
      "rating": 3,
      "price": 51.0,
      "imagePath": "assets/images/womens/image w2.png",
      "color": AppColors.filterBlack, //  Black
    },
  ];

  //  Women Discount Product List
  static List<Map<String, dynamic>> dummyWomenDiscountJson = [
    {
      "productName": "T-Shirt SPANISH",
      "brand": "Mango",
      "rating": 3,
      "oldPrice": 21.0,
      "newPrice": 9.0,
      "discount": "-20%",
      "imagePath": "assets/images/womens/photofo.png",
      "color": AppColors.whiteIcon, //  White
    },
    {
      "productName": "Blouse",
      "brand": "Dorothy Perkins",
      "rating": 10,
      "oldPrice": 21.0,
      "newPrice": 14.0,
      "discount": "-20%",
      "imagePath": "assets/images/womens/phototre.png",
      "color": AppColors.primaryRed, //  Red
    },
    {
      "productName": "Shirt",
      "brand": "Mango",
      "rating": 0,
      "oldPrice": 17.0,
      "newPrice": 14.0,
      "discount": "-20%",
      "imagePath": "assets/images/womens/photofo.png",
      "color": AppColors.filterGrey, //  Grey
    },
    {
      "productName": "Light Blouse",
      "brand": "Dorothy Perkins",
      "rating": 10,
      "oldPrice": 21.0,
      "newPrice": 14.0,
      "discount": "-20%",
      "imagePath": "assets/images/womens/phototre.png",
      "color": AppColors.filterBlack, // Black
    },
  ];
}

//   // Titles
//   static List<CategoryModel> dummytitle = [
//     CategoryModel(title: "Tops"),
//     CategoryModel(title: "Shirts & Blouses"),
//     CategoryModel(title: "Cardigans & Sweaters"),
//     CategoryModel(title: "Knitwear"),
//     CategoryModel(title: "Blazers"),
//     CategoryModel(title: "Outerwear"),
//     CategoryModel(title: "Pants"),
//     CategoryModel(title: "Jeans"),
//     CategoryModel(title: "Shorts"),
//     CategoryModel(title: "Skirts"),
//     CategoryModel(title: "Dresses"),
//     CategoryModel(title: "Home"),
//     CategoryModel(title: "Shop"),
//     CategoryModel(title: "Bag"),
//     CategoryModel(title: "Favorites"),
//     CategoryModel(title: "Profile"),
//   ];
// }
