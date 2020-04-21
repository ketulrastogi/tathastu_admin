class CategoryModel {
  final String categoryId;
  final String name;
  final String iconUrl;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool isPublished;
  final bool showOnHome;

  CategoryModel({
    this.categoryId,
    this.name,
    this.iconUrl,
    this.createdDate,
    this.updatedDate,
    this.isPublished,
    this.showOnHome,
  });

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'name': name,
      'iconUrl': iconUrl,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'isPublished': isPublished,
      'showOnHome': showOnHome,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> data) {
    return CategoryModel(
      categoryId: data['categoryId'],
      name: data['name'],
      iconUrl: data['iconUrl'],
      createdDate: data['createdDate'],
      updatedDate: data['updatedDate'],
      isPublished: data['isPublished'],
      showOnHome: data['showOnHome'],
    );
  }
}
