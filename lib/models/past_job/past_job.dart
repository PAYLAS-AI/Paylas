// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class PastJob {
  final String? id;
  final String jobId;
  final String userId;
  final DateTime completedDate;
  final DateTime jobDuration;
  final String location;
  final int earning;
  final String jobTitle;
  final double jobScore;


  PastJob({
    String? id,
    required this.jobId,
    required this.userId,
    required this.completedDate,
    required this.jobDuration,
    required this.location,
    required this.earning,
    required this.jobTitle,
    required this.jobScore,
  }) : id = id ?? Uuid().v4();

  factory PastJob.fromMap(Map<String, dynamic> map) {
    return PastJob(
      id: map['id'] ?? '',
      jobId: map['jobId'] ?? '',
      userId: map['userId'] ?? '',
      completedDate: (map['completedDate'] as Timestamp).toDate(),
      earning: map['earning'] ?? 0,
      jobDuration: (map['jobDuration']as Timestamp).toDate(),
      jobScore: map['jobScore'] ?? 0.0,
      jobTitle: map['jobTitle'] ?? '',
      location: map['location'] ?? ''
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'jobId': jobId,
      'userId': userId,
      'completedDate': completedDate.millisecondsSinceEpoch,
      'jobDuration': jobDuration.millisecondsSinceEpoch,
      'location': location,
      'earning': earning,
      'jobTitle': jobTitle,
      'jobScore': jobScore,
    };
  }

  PastJob copyWith({
    String? id,
    String? jobId,
    String? userId,
    DateTime? completedDate,
    DateTime? jobDuration,
    String? location,
    int? earning,
    String? jobTitle,
    double? jobScore,
  }) {
    return PastJob(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      userId: userId ?? this.userId,
      completedDate: completedDate ?? this.completedDate,
      jobDuration: jobDuration ?? this.jobDuration,
      location: location ?? this.location,
      earning: earning ?? this.earning,
      jobTitle: jobTitle ?? this.jobTitle,
      jobScore: jobScore ?? this.jobScore,
    );
  }


  String toJson() => json.encode(toMap());


}
