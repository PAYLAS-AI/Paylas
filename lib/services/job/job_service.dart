
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:paylas/models/job/job.dart';

class JobService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Job>> getAllJobs() async {
    final snapshot = await _db.collection('jobs').get();
    return snapshot.docs
        .map((doc) => Job.fromMap(doc.data(), doc.id))
        .toList();
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
  }

  Future<void> updateJob(Job job) async {
    await _db.collection('jobs').doc(job.id).update(job.toMap());
  }

  Future<void> deleteJob(String jobId) async {
    await _db.collection('jobs').doc(jobId).delete();
  }
}
