class JobAdminControlRequest {
  final String jobAdminControlRequestId;
  final String jobId;
  final String ownerId;
  final String jobImgUrl;
  final String jobTitle;

  JobAdminControlRequest({
    required this.jobAdminControlRequestId,
    required this.jobId,
    required this.ownerId,
    required this.jobImgUrl,
    required this.jobTitle,
  });


  factory JobAdminControlRequest.fromMap(Map<String, dynamic> map) {
    return JobAdminControlRequest(
      jobAdminControlRequestId: map['jobAdminControlRequestId'] as String,
      jobId: map['jobId'] as String,
      ownerId: map['ownerId'] as String,
      jobImgUrl: map['jobImgUrl'] as String,
      jobTitle: map['jobTitle'] as String,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'jobAdminControlRequestId': jobAdminControlRequestId,
      'jobId': jobId,
      'ownerId': ownerId,
      'jobImgUrl': jobImgUrl,
      'jobTitle': jobTitle,
    };
  }
}
