import 'package:admin/models/main_category_model.dart';
import 'package:admin/models/mini_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategory {
  final String subCategoryId;
  final String name;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool isPublished;

  SubCategory({
    this.subCategoryId,
    this.name,
    this.createdDate,
    this.updatedDate,
    this.isPublished,
  });

  Map<String, dynamic> toMap() {
    return {
      'subCategoryId': subCategoryId,
      'name': name,
      'createdDate': Timestamp.fromDate(createdDate),
      'updatedDate': Timestamp.fromDate(updatedDate),
      'isPublished': isPublished,
    };
  }

  factory SubCategory.fromMap(Map<String, dynamic> data) {
    return SubCategory(
      subCategoryId: data['subCategoryId'],
      name: data['name'],
      createdDate: (data['createdDate'] as Timestamp).toDate(),
      updatedDate: (data['updatedDate'] as Timestamp).toDate(),
      isPublished: data['isPublished'],
    );
  }
}
