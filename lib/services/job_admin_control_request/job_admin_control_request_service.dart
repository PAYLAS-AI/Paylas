import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:paylas/models/job_admin_control_request/job_admin_control_request.dart';

class JobAdminControlRequestService {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('jobAdminControlRequests');

  Future<List<JobAdminControlRequest>> getAllAdminControlRequests() async {
    final querySnapshot = await _collectionRef.get();
    return querySnapshot.docs
        .map((doc) =>
            JobAdminControlRequest.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> addJobAdminControlRequest(JobAdminControlRequest request) async {
    await _collectionRef.doc(request.jobAdminControlRequestId).set(
          request.toMap(),
        );
  }

  Future<void> deleteAdminControlRequest(String requestId) async {
    debugPrint(requestId);
    final querySnapshot =
        await _collectionRef.where('jobAdminControlRequestId', isEqualTo: requestId).get();
    for (var doc in querySnapshot.docs) {
      await _collectionRef.doc(doc.id).delete();
    }

    if (querySnapshot.docs.isEmpty) {
      debugPrint('Belge bulunamadı.');
    }
  }

  Future<JobAdminControlRequest?> getJobAdminControlRequestById(
      String requestId) async {
    final doc = await _collectionRef.doc(requestId).get();
    if (doc.exists) {
      return JobAdminControlRequest.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> updateJobAdminControlRequest(
      JobAdminControlRequest request) async {
    await _collectionRef
        .doc(request.jobAdminControlRequestId)
        .update(request.toMap());
  }
}
