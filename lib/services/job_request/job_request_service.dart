import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paylas/models/job_request/job_request.dart';
import 'package:paylas/models/model/requestResponse.dart';


class JobRequestService {
  final CollectionReference _jobRequestCollection =
  FirebaseFirestore.instance.collection('jobRequests');

  // Yeni bir iş isteği ekle
  Future<void> addJobRequest(JobRequest jobRequest) async {
    await _jobRequestCollection
        .doc(jobRequest.jobRequestId)
        .set(jobRequest.toMap());
  }

  // Tüm iş isteklerini getir
  Future<List<JobRequest>> getAllJobRequests() async {
    final querySnapshot = await _jobRequestCollection.get();
    return querySnapshot.docs
        .map((doc) => JobRequest.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Belirli bir kullanıcının gönderdiği iş isteklerini getir
  Future<List<JobRequest>> getJobRequestsForUserId(String userId) async {
    final querySnapshot = await _jobRequestCollection
        .where('senderUserId', isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => JobRequest.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Belirli bir işverenin aldığı iş isteklerini getir
  Future<List<JobRequest>> getJobRequestForOwnerId(String ownerId) async {
    final querySnapshot = await _jobRequestCollection
        .where('jobOwnerId', isEqualTo: ownerId)
        .where('requestResponse', isEqualTo: RequestResponse.waiting.name)
        .get();
    return querySnapshot.docs
        .map((doc) => JobRequest.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // İş isteğini sil
  Future<void> deleteJobRequest(String jobRequestId) async {
    await _jobRequestCollection.doc(jobRequestId).delete();
  }

  // İş isteğinin yanıtını güncelle
  Future<void> updateJobRequestResponse(
      String jobRequestId, String requestResponse) async {
    await _jobRequestCollection
        .doc(jobRequestId)
        .update({'requestResponse': requestResponse});
  }
}
