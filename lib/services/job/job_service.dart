
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:paylas/models/job/job.dart';
import 'package:paylas/services/user/user_service.dart';

class JobService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Job> allJobs = [];
  // guncel isleri categorilere gore sunmak icin asagidaki methodu kullan
  Future<List<Job>> getJobsByCategory(String category) async {
    final snapshot = await _db
        .collection('jobs')
        .where('category', isEqualTo: category)
        .where('isArchived', isEqualTo: false)
        .get();

    return snapshot.docs
        .map((doc) => Job.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<Job>> getUnarchivedJobs() async {
    final snapshot = await _db
        .collection('jobs')
        .where('isArchived', isEqualTo: false)
        .get();

    return snapshot.docs
        .map((doc) => Job.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<Job>> getAllJobs() async {
    final snapshot = await _db.collection('jobs').get();
    List<Job> jobs = snapshot.docs
        .map((doc) => Job.fromMap(doc.data(), doc.id))
        .toList();
    allJobs = jobs;
    return jobs;
  }

  Future<Job?> showJob(String jobId) async {
    final doc = await _db.collection('jobs').doc(jobId).get();
    if (doc.exists) {
      return Job.fromMap(doc.data()!, doc.id);
    } else {
      return null;
    }
  }
  Future<void> addNewJob(Job job) async {
    await _db.collection('jobs').add(job.toMap());
    await UserService().increaseSharedJobCount(job.ownerId);

  }
  Future<void> archiveJob(String jobId) async {
    await _db.collection('jobs').doc(jobId).update({'isArchived': true});
  }

  Future<void> updateJob(Job job) async {
    await _db.collection('jobs').doc(job.id).update(job.toMap());
  }

  Future<void> deleteJob(String jobId) async {
    await _db.collection('jobs').doc(jobId).delete();
  }
}
