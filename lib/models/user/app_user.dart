class AppUser {
  String uid;
  String userName;
  String email;
  String phone;
  String userType;
  double jobScore;
  List<String> successfulJobs;
  List<String> failedJobs;
  int sharedJobCount;
  bool isBanned;

  AppUser({
    required this.uid,
    required this.userName,
    required this.email,
    required this.phone,
    required this.userType,
    required this.jobScore,
    required this.successfulJobs,
    required this.failedJobs,
    this.sharedJobCount = 0,
    this.isBanned = false,
  });

  factory AppUser.fromMap(String id, Map<String, dynamic> map) {
    return AppUser(
      uid: id,
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      userType: map['userType'] ?? '',
      jobScore: (map['jobScore'] ?? 0).toDouble(),
      successfulJobs: List<String>.from(map['successfulJobs'] ?? []),
      failedJobs: List<String>.from(map['failedJobs'] ?? []),
      sharedJobCount: map['sharedJobCount'] ?? 0,
      isBanned: map['isBanned'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": uid,
      'userName': userName,
      'email': email,
      'phone': phone,
      'userType': userType,
      'jobScore': jobScore,
      'successfulJobs': successfulJobs,
      'failedJobs': failedJobs,
      'sharedJobCount': sharedJobCount,
      'isBanned': isBanned,
    };
  }
}
