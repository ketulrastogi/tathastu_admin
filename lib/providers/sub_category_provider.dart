import 'package:admin/models/app_icon_model.dart';
import 'package:admin/models/main_category_model.dart';
import 'package:admin/models/mini_category_model.dart';
import 'package:admin/models/sub_category_model.dart';
import 'package:admin/services/sub_category_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class SubCategoryProvider with ChangeNotifier {
  final SubCategoryService _subCategoryService = SubCategoryService();

  String _subCategoryId;
  String _name;

  DateTime _createdDate;
  DateTime _updatedDate;
  bool _isPublished = false;

  Uuid _uuid = Uuid();

  String get subCategoryId => _subCategoryId;
  String get name => _name;
  DateTime get createdDate => _createdDate;
  DateTime get updatedDate => _updatedDate;
  bool get isPublished => _isPublished;

  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeIsPublished(bool value) {
    _isPublished = value;
    notifyListeners();
  }

  loadValues(SubCategory subCategory) {
    _subCategoryId = subCategory.subCategoryId;
    _name = subCategory.name;
    _createdDate = subCategory.createdDate;
    _updatedDate = subCategory.updatedDate;
    _isPublished =
        (subCategory.isPublished != null) ? subCategory.isPublished : false;
  }

  saveSubCategory() {
    SubCategory _subCategory = SubCategory(
      subCategoryId: (_subCategoryId == null) ? _uuid.v4() : _subCategoryId,
      name: name,
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
      isPublished: isPublished,
    );
    _subCategoryService.saveSubCategory(_subCategory);
  }

  removeSubCategory(String subCategoryId) {
    _subCategoryService.removeSubCategory(subCategoryId);
    notifyListeners();
  }
}
