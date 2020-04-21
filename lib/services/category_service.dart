import 'package:admin/models/category_model.dart';
import 'package:admin/models/main_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryService {
  static final Firestore _db = Firestore.instance;
  static final CollectionReference _categoriesCollectionRef =
      _db.collection('categories').reference();

  // Stream all MainCategories
  Stream<List<CategoryModel>> getMainCategories() {
    return _categoriesCollectionRef.snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot) =>
                CategoryModel.fromMap(documentSnapshot.data))
            .toList());
  }

  // Add or Update Existing CategoryModel
  Future<void> saveCategory(CategoryModel category) {
    return _categoriesCollectionRef
        .document(category.categoryId)
        .setData(category.toMap());
  }

  // Delete Existing CategoryModel
  Future<void> removeCategory(String categoryModelId) {
    return _categoriesCollectionRef.document(categoryModelId).delete();
  }
}
