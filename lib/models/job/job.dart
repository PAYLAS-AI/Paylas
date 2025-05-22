import 'package:cloud_firestore/cloud_firestore.dart';
class Job {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String ownerId;
  final DateTime createdDate;
  final bool isArchived;
  final DateTime validityDate;
  final String location;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.ownerId,
    required this.createdDate,
    required this.validityDate,
    required this.location,
    this.isArchived = false,
  });

  factory Job.fromMap(Map<String, dynamic> map, String documentId) {
    return Job(
      id: documentId,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
      ownerId: map['ownerId'] ?? '',
      createdDate: (map['createdDate'] as Timestamp).toDate(),
      isArchived: map['isArchived'] ?? false,
      validityDate: (map['validityDate'] as Timestamp).toDate(),
      location: map['location'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'ownerId': ownerId,
      'createdDate': createdDate,
      'isArchived': isArchived,
      'validityDate': validityDate,
      'location': location,
    };
  }
}
