import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paylas/models/user/app_user.dart';

class UserService {
  final _users = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(AppUser user) async {
    await _users.doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future<AppUser> getUser(String uid) async {
    final doc = await _users.doc(uid).get();
    return AppUser.fromMap(uid, doc.data()!);
  }

  Future<void> increaseSharedJobCount(String uid) async {
    final doc = await _users.doc(uid).get();
    if (!doc.exists) return;

    final currentCount = (doc.data()?['sharedJobCount'] ?? 0) as int;
    await _users.doc(uid).update({
      'sharedJobCount': currentCount + 1,
    });
  }
  Future<void> updateJobResult(String uid, String jobId, bool isSuccess) async {
    final field = isSuccess ? 'successfulJobs' : 'failedJobs';
    await _users.doc(uid).update({
      field: FieldValue.arrayUnion([jobId])
    });
  }
}
