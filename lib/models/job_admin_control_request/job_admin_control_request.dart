import 'package:uuid/uuid.dart';

class JobAdminControlRequest {
  String? jobAdminControlRequestId;
  String jobId;
  String ownerId;
  String jobImgUrl;
  String jobTitle;
  String ownerName;

  JobAdminControlRequest({
    String? jobAdminControlRequestId,
    required this.jobId,
    required this.ownerId,
    required this.jobImgUrl,
    required this.jobTitle,
    required this.ownerName,
  }) : jobAdminControlRequestId = jobAdminControlRequestId ?? Uuid().v4(); 

  factory JobAdminControlRequest.fromMap(Map<String, dynamic> map) {
    return JobAdminControlRequest(
      jobAdminControlRequestId: map['jobAdminControlRequestId'] as String,
      jobId: map['jobId'] as String,
      ownerId: map['ownerId'] as String,
      ownerName: map['ownerName'] as String,
      jobImgUrl: map['jobImgUrl'] as String,
      jobTitle: map['jobTitle'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobAdminControlRequestId': jobAdminControlRequestId,
      'jobId': jobId,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'jobImgUrl': jobImgUrl,
      'jobTitle': jobTitle,
    };
  }
}
