import 'package:cloud_firestore/cloud_firestore.dart';

class PastJob {
  final String id;
  final String jobId;
  final String userId;
  final DateTime completedDate;

  PastJob({
    required this.id,
    required this.jobId,
    required this.userId,
    required this.completedDate,
  });

  factory PastJob.fromMap(Map<String, dynamic> map, String documentId) {
    return PastJob(
      id: documentId,
      jobId: map['jobId'] ?? '',
      userId: map['userId'] ?? '',
      completedDate: (map['completedDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'userId': userId,
      'completedDate': completedDate,
    };
  }
}
