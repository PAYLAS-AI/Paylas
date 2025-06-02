import 'package:uuid/uuid.dart';

class JobReportRequest {
  String? jobReportRequestId;
  String jobId;
  String ownerId;
  String reportedUserId;
  String jobImgUrl;
  String jobTitle;

  JobReportRequest({
    this.jobReportRequestId,
    required this.jobId,
    required this.ownerId,
    required this.reportedUserId,
    required this.jobImgUrl,
    required this.jobTitle,
  }){
    jobReportRequestId = Uuid().v4();
  }


  factory JobReportRequest.fromMap(Map<String, dynamic> map) {
    return JobReportRequest(
      jobReportRequestId: map['jobReportRequestId'] as String,
      jobId: map['jobId'] as String,
      ownerId: map['ownerId'] as String,
      reportedUserId: map['reportedUserId'] as String,
      jobImgUrl: map['jobImgUrl'] as String,
      jobTitle: map['jobTitle'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobReportRequestId': jobReportRequestId,
      'jobId': jobId,
      'ownerId': ownerId,
      'reportedUserId': reportedUserId,
      'jobImgUrl': jobImgUrl,
      'jobTitle': jobTitle,
    };
  }
}
