import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class JobRequest {
  String? jobRequestId;
  String jobImgUrl;
  String jobOwnerName;
  String jobOwnerId;
  String jobLocation;
  DateTime jobDuration;
  DateTime jobDate;
  double jobPrice;
  String senderUserId;
  String senderUserName;
  String requestResponse;
  String jobTitle;
  String jobId;

  JobRequest({
    String? jobRequestId,
    required this.jobTitle,
    required this.jobId,
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
  })  : jobRequestId = jobRequestId ?? Uuid().v4(); 


  factory JobRequest.fromMap(Map<String, dynamic> map) {
    return JobRequest(
      jobRequestId: map['jobRequestId'] as String,
      jobTitle: map['jobTitle'] as String,
      jobId: map['jobId'] as String,
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
      'jobTitle': jobTitle,
      'jobId': jobId,
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
