class AppUser {
  String uid;
  String userName;
  String email;
  String phone;
  double jobScore;
  List<String> successfulJobs;
  List<String> failedJobs;
  int sharedJobCount;

  AppUser({
    required this.uid,
    required this.userName,
    required this.email,
    required this.phone,
    required this.jobScore,
    required this.successfulJobs,
    required this.failedJobs,
    this.sharedJobCount = 0,
  });

  factory AppUser.fromMap(String id, Map<String, dynamic> map) {
    return AppUser(
      uid: id,
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      jobScore: (map['jobScore'] ?? 0).toDouble(),
      successfulJobs: List<String>.from(map['successfulJobs'] ?? []),
      failedJobs: List<String>.from(map['failedJobs'] ?? []),
      sharedJobCount: map['sharedJobCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'phone': phone,
      'jobScore': jobScore,
      'successfulJobs': successfulJobs,
      'failedJobs': failedJobs,
      'sharedJobCount': sharedJobCount,
    };
  }
}
