
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        .map((doc) => Job.fromMap(doc.data()))
        .toList();
  }

  Future<List<Job>> getUnarchivedJobs() async {
    final snapshot = await _db
        .collection('jobs')
        .where('isArchived', isEqualTo: false)
        .get();

    return snapshot.docs
        .map((doc) => Job.fromMap(doc.data()))
        .toList();
  }
  Future<List<Job>> getUnActiveJobs() async {
    final snapshot = await _db
        .collection('jobs')
        .where('isActive', isEqualTo: false)
        .get();

    return snapshot.docs
        .map((doc) => Job.fromMap(doc.data()))
        .toList();
  }
  Future<List<Job>> getActiveJobs() async {
    final snapshot = await _db
        .collection('jobs')
        .where('isActive', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((doc) => Job.fromMap(doc.data()))
        .toList();
  }
  Future<List<Job>> getAllJobs() async {
    final snapshot = await _db.collection('jobs').get();
    List<Job> jobs = snapshot.docs
        .map((doc) => Job.fromMap(doc.data()))
        .toList();
    allJobs = jobs;
    return jobs;
  }

  Future<Job?> showJob(String jobId) async {
    final docs = await _db.collection('jobs').where('id', isEqualTo: jobId).get();
   
    return Job.fromMap(docs.docs.first.data());
  
  }
  Future<void> addNewJob(Job job) async {
    await _db.collection('jobs').add(job.toMap());
    await UserService().increaseSharedJobCount(job.ownerId);

  }
  Future<void> archiveJob(String jobId) async {
    await _db.collection('jobs').doc(jobId).update({'isArchived': true});
  }
  Future<void> unArchiveJob(String jobId) async {
    await _db.collection('jobs').doc(jobId).update({'isArchived': false});
  }
  Future<void> makeJobActive(String jobId) async {
    await _db.collection('jobs').doc(jobId).update({'isActive': true});
  }
  
  Future<void> makeJobActiveByInnerId(String innerId) async {
  final querySnapshot = await _db
      .collection('jobs')
      .where('id', isEqualTo: innerId)
      .limit(1) // varsa sadece ilkini güncelle
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    final docId = querySnapshot.docs.first.id;
    await _db.collection('jobs').doc(docId).update({'isActive': true});
  } else {
    throw Exception('İlgili job bulunamadı.');
  }
}

  Future<void> makeJobUnActive(String jobId) async {
    await _db.collection('jobs').doc(jobId).update({'isActive': false});
  }

  Future<void> updateJob(Job job) async {
    await _db.collection('jobs').doc(job.id).update(job.toMap());
  }

  Future<void> deleteJob(String jobId) async {
    await _db.collection('jobs').doc(jobId).delete();
  }

  Future<void> deleteDocByInnerId(String targetId) async {
  final collection = FirebaseFirestore.instance.collection('jobs');

  final querySnapshot = await collection.where('id', isEqualTo: targetId).get();

  for (var doc in querySnapshot.docs) {
    await collection.doc(doc.id).delete();
  }

  if (querySnapshot.docs.isEmpty) {
    debugPrint('Belge bulunamadı.');
  }
}
}
