import 'package:cloud_firestore/cloud_firestore.dart';
class Job {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String ownerId;
  final DateTime createdDate;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.ownerId,
    required this.createdDate,
  });

  factory Job.fromMap(Map<String, dynamic> map, String documentId) {
    return Job(
      id: documentId,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
      ownerId: map['ownerId'] ?? '',
      createdDate: (map['createdDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'ownerId': ownerId,
      'createdDate': createdDate,
    };
  }
}
