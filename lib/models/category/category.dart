
import 'package:cloud_firestore/cloud_firestore.dart';
class Category {
  final String id;
  final String name;
  final DateTime createdDate;

  Category({
    required this.id,
    required this.name,
    required this.createdDate,
  });

  factory Category.fromMap(Map<String, dynamic> map, String documentId) {
    return Category(
      id: documentId,
      name: map['name'] ?? '',
      createdDate: (map['createdDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createdDate': createdDate,
    };
  }
}
