import 'package:admin/models/app_icon_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainCategory {
  final String mainCategoryId;
  final String name;
  final String iconUrl;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool isPublished;
  final bool showOnHome;

  MainCategory({
    this.mainCategoryId,
    this.name,
    this.iconUrl,
    this.createdDate,
    this.updatedDate,
    this.isPublished,
    this.showOnHome,
  });

  Map<String, dynamic> toMap() {
    return {
      'mainCategoryId': mainCategoryId,
      'name': name,
      'iconUrl': iconUrl,
      'createdDate': Timestamp.fromDate(createdDate),
      'updatedDate': Timestamp.fromDate(updatedDate),
      'isPublished': isPublished,
      'showOnHome': showOnHome,
    };
  }

  factory MainCategory.fromMap(Map<String, dynamic> data) {
    return MainCategory(
      mainCategoryId: data['mainCategoryId'],
      name: data['name'],
      iconUrl: data['iconUrl'],
      createdDate: (data['createdDate'] as Timestamp).toDate(),
      updatedDate: (data['updatedDate'] as Timestamp).toDate(),
      isPublished: data['isPublished'],
      showOnHome: data['showOnHome'],
    );
  }
}
