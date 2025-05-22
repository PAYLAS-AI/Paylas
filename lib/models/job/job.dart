import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
class Job {
  String? id;
  String title;
  String description;
  String category;
  String ownerId;
  DateTime createdDate;
  bool isArchived;
  DateTime validityDate;
  String location;

  Job({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.ownerId,
    required this.createdDate,
    required this.validityDate,
    required this.location,
    this.isArchived = false,
  }){
    id = Uuid().v4();
  }

  factory Job.fromMap(Map<String, dynamic> map, String documentId) {
    return Job(
      id: documentId,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
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
      'category': category,
      'ownerId': ownerId,
      'createdDate': createdDate,
      'isArchived': isArchived,
      'validityDate': validityDate,
      'location': location,
    };
  }
}
