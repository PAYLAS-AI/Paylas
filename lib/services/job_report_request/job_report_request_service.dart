import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paylas/models/job_report_request/job_report_request.dart';

class JobReportRequestService {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('jobReportRequests');

  Future<List<JobReportRequest>> getAllReportRequests() async {
    final querySnapshot = await _collectionRef.get();
    return querySnapshot.docs
        .map((doc) =>
            JobReportRequest.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> addReportRequest(JobReportRequest request) async {
    await _collectionRef.doc(request.jobReportRequestId).set(
          request.toMap(),
        );
  }

  Future<void> deleteReportRequest(String requestId) async {
    await _collectionRef.doc(requestId).delete();
  }

  Future<JobReportRequest?> getReportRequestById(String requestId) async {
    final doc = await _collectionRef.doc(requestId).get();
    if (doc.exists) {
      return JobReportRequest.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> updateReportRequest(JobReportRequest request) async {
    await _collectionRef
        .doc(request.jobReportRequestId)
        .update(request.toMap());
  }
}
