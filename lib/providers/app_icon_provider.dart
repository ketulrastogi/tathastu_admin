import 'dart:io';

import 'package:admin/models/app_icon_model.dart';
import 'package:admin/services/app_icon_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class AppIconProvider with ChangeNotifier {
  final AppIconService _appIconService = AppIconService();

  String _appIconId;
  String _name;
  String _downloadUrl;
  Uuid _uuid = Uuid();

  // Getters
  String get appIconId => _appIconId;
  String get name => _name;
  String get downloadUrl => _downloadUrl;

  // Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changedownloadUrl(String value) {
    _downloadUrl = value;
    notifyListeners();
  }

  loadValues(AppIcon appIcon) {
    _appIconId = appIcon.appIconId;
    _name = appIcon.name;
    _downloadUrl = appIcon.downloadUrl;
  }

  saveAppIcon(File file) async {
    AppIcon _appIcon = AppIcon(
      appIconId: (_appIconId == null) ? _uuid.v4() : _appIconId,
      name: name,
      downloadUrl: downloadUrl,
    );

    _appIconService.saveAppIcon(_appIcon.appIconId, file);
  }
}
