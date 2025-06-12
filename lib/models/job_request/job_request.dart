import 'package:cloud_firestore/cloud_firestore.dart';

class JobRequest {
  final String jobRequestId;
  final String jobImgUrl;
  final String jobOwnerName;
  final String jobOwnerId;
  final String jobLocation;
  final DateTime jobDuration;
  final DateTime jobDate;
  final double jobPrice;
  final String senderUserId;
  final String senderUserName;
  final String requestResponse;

  JobRequest({
    required this.jobRequestId,
    required this.jobImgUrl,
    required this.jobOwnerName,
    required this.jobOwnerId,
    required this.jobLocation,
    required this.jobDuration,
    required this.jobDate,
    required this.jobPrice,
    required this.senderUserId,
    required this.senderUserName,
    required this.requestResponse,
  });


  factory JobRequest.fromMap(Map<String, dynamic> map) {
    return JobRequest(
      jobRequestId: map['jobRequestId'] as String,
      jobImgUrl: map['jobImgUrl'] as String,
      jobOwnerName: map['jobOwnerName'] as String,
      jobOwnerId: map['jobOwnerId'] as String,
      jobLocation: map['jobLocation'] as String,
      jobDuration: (map['jobDuration'] as Timestamp).toDate(),
      jobDate: (map['jobDate'] as Timestamp).toDate(),
      jobPrice: (map['jobPrice'] as num).toDouble(),
      senderUserId: map['senderUserId'] as String,
      senderUserName: map['senderUserName'] as String,
      requestResponse: map['requestResponse'] as String,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'jobRequestId': jobRequestId,
      'jobImgUrl': jobImgUrl,
      'jobOwnerName': jobOwnerName,
      'jobOwnerId': jobOwnerId,
      'jobLocation': jobLocation,
      'jobDuration': jobDuration,
      'jobDate': jobDate,
      'jobPrice': jobPrice,
      'senderUserId': senderUserId,
      'senderUserName': senderUserName,
      'requestResponse': requestResponse,
    };
  }
}
