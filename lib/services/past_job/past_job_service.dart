import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paylas/models/past_job/past_job.dart';

class PastJobService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<PastJob> pastJobs = [];

  Future<List<PastJob>> getAllPastJobs() async {
    final snapshot = await _db.collection('past_jobs').get();
    return snapshot.docs.map((doc) => PastJob.fromMap(doc.data())).toList();
  }

  Future<List<PastJob>> getPastJobsByUser(String userId) async {
    final snapshot = await _db
        .collection('past_jobs')
        .where('userId', isEqualTo: userId)
        .get();

    pastJobs = snapshot.docs.map((doc) => PastJob.fromMap(doc.data())).toList();

    return pastJobs;
  }

  Future<PastJob?> showPastJob(String pastJobId) async {
    final doc = await _db.collection('past_jobs').doc(pastJobId).get();
    if (doc.exists) {
      return PastJob.fromMap(doc.data()!);
    } else {
      return null;
    }
  }

  // yeni bir pastJob eklerken mutlaka gecmis is olacak job
  // archived yapilmali ki yeni isler kisminda artik gozukmesin!!!!!!
  Future<void> addNewPastJob(PastJob pastJob) async {
    await _db.collection('past_jobs').add(pastJob.toMap());
  }

  Future<void> updatePastJob(PastJob pastJob) async {
    await _db.collection('past_jobs').doc(pastJob.id).update(pastJob.toMap());
  }

  Future<void> deletePastJob(String pastJobId) async {
    await _db.collection('past_jobs').doc(pastJobId).delete();
  }

 
}
