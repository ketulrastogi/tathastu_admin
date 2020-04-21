import 'package:admin/models/app_icon_model.dart';
import 'package:admin/services/category_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:admin/models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryService _categoryService = CategoryService();

  String _categoryId;
  String _name;
  static final String _defaultIconUrl =
      'https://firebasestorage.googleapis.com/v0/b/tathastu-9b0e8.appspot.com/o/Icons%2Fgallery.svg?alt=media&token=ba2d60d4-a1b0-4f56-98a2-30436804b59f';
  String _iconUrl;
  DateTime _createdDate;
  DateTime _updatedDate;
  bool _isPublished = false;
  bool _showOnHome = false;
  Uuid _uuid = Uuid();

  AppIcon _appIcon;

  // Getters
  String get categoryId => _categoryId;
  String get name => _name;
  String get iconUrl => _iconUrl;
  DateTime get createdDate => _createdDate;
  DateTime get updatedDate => _updatedDate;
  bool get isPublished => _isPublished;
  bool get showOnHome => _showOnHome;
  AppIcon get appIcon => _appIcon;
  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeIconUrl(String value) {
    _iconUrl = _iconUrl;
    notifyListeners();
  }

  changeIsPublished(bool value) {
    _isPublished = value;
    notifyListeners();
  }

  changeShowOnHome(bool value) {
    _showOnHome = value;
    notifyListeners();
  }

  changeAppIcon(AppIcon appIcon) {
    _appIcon = appIcon;
    _iconUrl = appIcon.downloadUrl;
    notifyListeners();
  }

  loadValues(CategoryModel category) {
    _categoryId = category.categoryId;
    _name = category.name;
    _iconUrl = (category.iconUrl != null) ? category.iconUrl : _defaultIconUrl;
    _createdDate = category.createdDate;
    _updatedDate = category.updatedDate;
    _isPublished =
        (category.isPublished != null) ? category.isPublished : false;
    _showOnHome = (category.showOnHome != null) ? category.showOnHome : false;
  }

  savecategory() {
    CategoryModel _category = CategoryModel(
      categoryId: (_categoryId == null) ? _uuid.v4() : _categoryId,
      name: name,
      iconUrl: iconUrl,
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
      isPublished: isPublished,
      showOnHome: showOnHome,
    );
    _categoryService.saveCategory(_category);
  }

  removecategory(String categoryId) {
    _categoryService.removeCategory(categoryId);
    notifyListeners();
  }

  //Validators

}
