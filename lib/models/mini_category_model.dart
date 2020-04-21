class MiniCategoryModel {
  final String id;
  final String name;

  MiniCategoryModel({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory MiniCategoryModel.fromMap(Map<String, dynamic> data) {
    return MiniCategoryModel(
      id: data['id'],
      name: data['name'],
    );
  }
}
