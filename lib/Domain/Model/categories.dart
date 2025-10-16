class CategoryModel {
  String? title;
  String? imagePath;

  CategoryModel({
    this.title,
    this.imagePath,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'],
      imagePath: map['imagePath'],
    );
  }

  static fromjson(Map<String, dynamic> e) {}
}
