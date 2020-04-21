import 'package:admin/models/app_icon_model.dart';
import 'package:admin/models/main_category_model.dart';
import 'package:admin/services/main_category_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class MainCategoryProvider with ChangeNotifier {
  final MainCategoryService _mainCategoryService = MainCategoryService();

  String _mainCategoryId;
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
  String get mainCategoryId => _mainCategoryId;
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

  loadValues(MainCategory mainCategory) {
    _mainCategoryId = mainCategory.mainCategoryId;
    _name = mainCategory.name;
    _iconUrl =
        (mainCategory.iconUrl != null) ? mainCategory.iconUrl : _defaultIconUrl;
    _createdDate = mainCategory.createdDate;
    _updatedDate = mainCategory.updatedDate;
    _isPublished =
        (mainCategory.isPublished != null) ? mainCategory.isPublished : false;
    _showOnHome =
        (mainCategory.showOnHome != null) ? mainCategory.showOnHome : false;
  }

  saveMainCategory() {
    MainCategory _mainCategory = MainCategory(
      mainCategoryId: (_mainCategoryId == null) ? _uuid.v4() : _mainCategoryId,
      name: name,
      iconUrl: iconUrl,
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
      isPublished: isPublished,
      showOnHome: showOnHome,
    );
    _mainCategoryService.saveMainCategory(_mainCategory);
  }

  removeMainCategory(String mainCategoryId) {
    _mainCategoryService.removeMainCategory(mainCategoryId);
    notifyListeners();
  }

  //Validators

}
