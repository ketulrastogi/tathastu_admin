import 'package:admin/models/main_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainCategoryService {
  static final Firestore _db = Firestore.instance;
  static final CollectionReference _mainCategoriesCollectionRef =
      _db.collection('mainCategories').reference();

  // Stream all MainCategories
  Stream<List<MainCategory>> getMainCategories() {
    return _mainCategoriesCollectionRef.snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot) =>
                MainCategory.fromMap(documentSnapshot.data))
            .toList());
  }

  // Add or Update Existing MainCategory
  Future<void> saveMainCategory(MainCategory mainCategory) {
    return _mainCategoriesCollectionRef
        .document(mainCategory.mainCategoryId)
        .setData(mainCategory.toMap());
  }

  // Delete Existing MainCategory
  Future<void> removeMainCategory(String mainCategoryId) {
    return _mainCategoriesCollectionRef.document(mainCategoryId).delete();
  }
}
