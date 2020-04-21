import 'dart:io';

import 'package:admin/models/app_icon_model.dart';
import 'package:admin/services/file_upload_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppIconService {
  static final Firestore _db = Firestore.instance;
  static final FileUploadService _fileUploadService = FileUploadService();
  static final CollectionReference _appIconsCollectionRef =
      _db.collection('appIcons').reference();

  // Stream all AppIcons
  Stream<List<AppIcon>> getAppIcons() {
    return _appIconsCollectionRef.snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot) =>
                AppIcon.fromMap(documentSnapshot.data))
            .toList());
  }

  // Add or Update Existing AppIcon
  Future<void> saveAppIcon(String appIconId, File file) async {
    FirebaseFileModel firebaseFileModel =
        await _fileUploadService.uploadFile('Icons', file);
    print(
        'AppIconName : ${firebaseFileModel.name}, AppIconUrl : ${firebaseFileModel.downloadUrl}');
    return _appIconsCollectionRef
        .document(appIconId)
        .setData({'appIconId': appIconId, ...firebaseFileModel.toMap()});
  }

  // Delete Existing AppIcon
  Future<void> removeAppIcon(AppIcon appIcon) async {
    await _fileUploadService.fileRemove(appIcon.downloadUrl);
    return await _appIconsCollectionRef.document(appIcon.appIconId).delete();
  }
}
