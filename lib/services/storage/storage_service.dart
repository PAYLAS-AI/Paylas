
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/job_admin_control_request/job_admin_control_request_service.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final JobService jobService = locator<JobService>();

  final JobAdminControlRequestService requestService = locator<JobAdminControlRequestService>();

  /// Storage'a yükle
  Future<String?> uploadImage(File imageFile,String jobId) async {
    try {
      // Firebase Storage'a yükle
      TaskSnapshot snapshot = await _storage
          .ref('jobImages/$jobId')
          .putFile(imageFile);

      String downloadUrl = await snapshot.ref.getDownloadURL();

      await jobService.addImgUrl(jobId, downloadUrl);
      await requestService.addImgUrl(jobId, downloadUrl);

      return downloadUrl;
    } catch (e) {
      debugPrint('Hata: $e');
      return "https://raw.githubusercontent.com/PAYLAS-AI/Paylas/refs/heads/main/assets/logo/logo2.jpg";
    }
  }

  Future<void> deleteImage(String jobId) async {
    try {
      // Firebase Storage'a yükle
       await _storage
          .ref('jobImages/$jobId')
          .delete();
    } catch (e) {
      debugPrint('Hata: $e');
    }
  }
}