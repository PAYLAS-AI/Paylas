// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:paylas/models/model/categoryby.dart';
import 'package:uuid/uuid.dart';

class PastJob {
  String? id;
  String jobId;
  String userId;
  String category;
  DateTime completedDate;
  DateTime jobDuration;
  String location;
  int earning;
  String jobTitle;
  double jobScore;
  String userName;
  String imgUrl;
  


  PastJob({
    String? id,
    required this.jobId,
    required this.userId,
    required this.userName,
    required this.category,
    required this.completedDate,
    required this.jobDuration,
    required this.location,
    required this.earning,
    required this.jobTitle,
    required this.jobScore,
    required this.imgUrl,
  }) : id = id ?? Uuid().v4();

  factory PastJob.fromMap(Map<String, dynamic> map) {
    return PastJob(
      id: map['id'] ?? '',
      jobId: map['jobId'] ?? '',
      imgUrl: map['imgUrl'] ?? "https://raw.githubusercontent.com/PAYLAS-AI/Paylas/refs/heads/main/assets/logo/logo2.jpg",
      userId: map['userId'] ?? '',
      category: map['category'] ?? CategoryBy.all.name,
      userName: map['userName'] ?? '',
      completedDate: DateTime.fromMillisecondsSinceEpoch(map['completedDate']),
      earning: map['earning'] ?? 0,
      jobDuration: DateTime.fromMillisecondsSinceEpoch(map['jobDuration']),
      jobScore: map['jobScore'] ?? 0.0,
      jobTitle: map['jobTitle'] ?? '',
      location: map['location'] ?? ''
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'jobId': jobId,
      'imgUrl': imgUrl,
      'userId': userId,
      'category': category,
      'userName': userName,
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
    String? category,
    String? userName,
    DateTime? completedDate,
    DateTime? jobDuration,
    String? location,
    int? earning,
    String? jobTitle,
    double? jobScore,
    String? imgUrl,
  }) {
    return PastJob(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      imgUrl: imgUrl ?? this.imgUrl,
      userId: userId ?? this.userId,
      category: category ?? this.category,
      userName: userName ?? this.userName,
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
