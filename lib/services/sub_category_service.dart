import 'package:admin/models/sub_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoryService {
  static final Firestore _db = Firestore.instance;
  static final CollectionReference _subCategoriesCollectionRef =
      _db.collection('subCategories').reference();

  // Stream all SubCategories
  Stream<List<SubCategory>> getSubCategories() {
    return _subCategoriesCollectionRef.snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot) =>
                SubCategory.fromMap(documentSnapshot.data))
            .toList());
  }

  // Add or Update Existing SubCategory
  Future<void> saveSubCategory(SubCategory subCategory) {
    return _subCategoriesCollectionRef
        .document(subCategory.subCategoryId)
        .setData(subCategory.toMap());
  }

  // Delete Existing SubCategory
  Future<void> removeSubCategory(String subCategoryId) {
    return _subCategoriesCollectionRef.document(subCategoryId).delete();
  }
}
