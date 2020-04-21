import 'dart:io';
import 'package:path/path.dart';
import 'package:admin/shared/text_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseFileModel {
  final String downloadUrl;
  final String name;

  FirebaseFileModel({this.downloadUrl, this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'downloadUrl': downloadUrl,
    };
  }
}

class FileUploadService with ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage();

  Future<FirebaseFileModel> uploadFile(String folderName, File file) async {
    String nameWithExt = basename(file.path);
    String nameOnly = basename(nameWithExt).split('.')[0];
    StorageUploadTask task = _storage
        .ref()
        .child(folderName)
        .child(basename(nameWithExt))
        .putFile(file);
    StorageTaskSnapshot taskSnapshot = await task.onComplete;
    StorageReference ref = taskSnapshot.ref;

    String downloadUrl = await ref.getDownloadURL();
    // String gsUrl = 'gs://${await ref.getBucket()}/${await ref.getPath()}';

    print(
        'gs://${await ref.getBucket()}/${await ref.getPath()} ${await ref.getName()}');

    print(nameWithExt.capitalize());
    print(nameOnly.capitalize());

    return FirebaseFileModel(
      name: nameOnly.capitalize(),
      downloadUrl: downloadUrl,
    );
  }

  Future<void> fileRemove(String downloadUrl) async {
    StorageReference _gsUrl = await _storage.getReferenceFromUrl(downloadUrl);
    return await _gsUrl.delete();
  }
}
