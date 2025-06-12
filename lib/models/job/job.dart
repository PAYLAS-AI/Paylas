import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
class Job {
  String? id;
  String title;
  String description;
  String category;
  String ownerId;
  String ownerName;
  DateTime createdDate;
  bool isArchived;
  bool isActive;
  DateTime validityDate;
  String location;
  int price;
  String imgUrl;


  Job({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.ownerId,
    required this.ownerName,
    required this.createdDate,
    required this.validityDate,
    required this.location,
    required this.price,
    required this.imgUrl,
    this.isArchived = false,
    this.isActive = false
  }){
    id = Uuid().v4();
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      id: map['id'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      ownerId: map['ownerId'] ?? '',
      ownerName: map['ownerName'] ?? '',
      createdDate: (map['createdDate'] as Timestamp).toDate(),
      isArchived: map['isArchived'] ?? false,
      isActive: map['isActive'] ?? false,
      validityDate: (map['validityDate'] as Timestamp).toDate(),
      location: map['location'] ?? '',
      price: map['price'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'imgUrl':imgUrl,
      'title': title,
      'description': description,
      'category': category,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'createdDate': createdDate,
      'isArchived': isArchived,
      'isActive': isActive,
      'validityDate': validityDate,
      'location': location,
      'price': price,
    };
  }
}
