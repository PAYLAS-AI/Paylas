import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paylas/firebase_options.dart';
import 'package:paylas/models/category/category.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/services/category/category_service.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/past_job/past_job_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final categoryService = CategoryService();
  final jobService = JobService();
  final pastJobService = PastJobService();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference jobs = firestore.collection('jobs');
/////// asagidaki kodlar job modelinde owner name yoksa owner id ile arastirip yazmasi icindir
  final QuerySnapshot jobSnapshot = await jobs.get();

  for (final jobDoc in jobSnapshot.docs) {
    final jobData = jobDoc.data() as Map<String, dynamic>;

    // ownerId alanı varsa devam et
    final String? ownerId = jobData['ownerId'];

    if (ownerId != null && ownerId.isNotEmpty) {
      try {
        // users koleksiyonundan kullanıcıyı çek
        final userDoc = await firestore.collection('users').doc(ownerId).get();

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;

          final String ownerName = userData['userName'] ?? 'İsimsiz';

          // Eğer job'da ownerName eksikse güncelle
          if (jobData['ownerName'] == null ||
              jobData['ownerName'] == 'İsimsiz' ||
              (jobData['ownerName'] as String).isEmpty) {
            await jobDoc.reference.update({
              'ownerName': ownerName,
            });
            print("Güncellendi: ${jobDoc.id} → $ownerName");
          } else {
            print("Zaten mevcut: ${jobDoc.id}");
          }
        } else {
          print("Kullanıcı bulunamadı: $ownerId");
        }
      } catch (e) {
        print("Hata oluştu (${jobDoc.id}): $e");
      }
    } else {
      print("ownerId eksik: ${jobDoc.id}");
    }
  }

  print("Tüm kayıtlar güncellendi.");
}

/*

  // Yeni kategori
  await categoryService.addNewCategory(
    Category(id: '', name: 'Kategori ismi', createdDate: DateTime.now()),
  );

  // Tüm kategoriler
  final categories = await categoryService.getAllCategories();
  for (final c in categories) {
    debugPrint('Kategori: ${c.name}');
  }

  final job = Job(
      id: '',
      title: 'Bahçe Bakımı',
      description: 'Ev bahçesi düzenlenecek.',
      category: 'temizlik-id',
      ownerId: 'uid-1234',
      createdDate: DateTime.now(),
      validityDate: DateTime.now().add(Duration(days: 30)),
      // 30 gün geçerli
      location: 'Antalya, Muratpaşa',
      // örnek konum
      isArchived: false,
      price: 100,
      ownerName: 'Ozan');
  await jobService.addNewJob(job);

  // Tüm işler
  final jobs = await jobService.getAllJobs();
  for (final j in jobs) {
    debugPrint('İş: ${j.title} - Archived: ${j.isArchived}');
  }

  // Örnek geçmiş iş


  // Show pastJob
  final result = await pastJobService
      .showPastJob('AznnoJvIpCKPEJK0cOAL'); // gerçek ID ile değiştir
  if (result != null) {
    debugPrint('Past Job -> Job ID: ${result.jobId}, User: ${result.userId}');
  } else {
    debugPrint('Past job not found.');
  }
 */

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final categoryService = CategoryService();

  // Test: Yeni kategori ekle
  await categoryService.addNewCategory(
    Category(id: '', name: ' Kategori ismi', createdDate: DateTime.now()),
  );

  // Test: Tüm kategorileri getir
  final categories = await categoryService.getAllCategories();
  for (final c in categories) {
    print('Kategori: ${c.name} - ${c.createdDate}');
  }


    final jobService = JobService();
    final job = Job(
      id: '',
      title: 'Bahçe Bakımı',
      description: 'Ev bahçesi düzenlenecek.',
      categoryId: 'temizlik-id',
      ownerId: 'uid-1234',
      createdDate: DateTime.now(),
    );

    await jobService.addNewJob(job);

    final jobs = await jobService.getAllJobs();
    for (final j in jobs) {
      print('is: ${j.title} - ${j.createdDate}');
    }
  try {
    final job = await jobService.showJob('ZaEsBLYcx0LbNuIXaJHd');
    if (job != null) {
      print("en son testler");
      print('Job Title: ${job.title}');
      print('Description: ${job.description}');
      print('Category: ${job.categoryId}');
      print('Owner: ${job.ownerId}');
      print('Created Date: ${job.createdDate}');
    } else {
      print('Job not found.');
    }
  } catch (e) {
    print('Bir hata oluştu: $e');
  }


}
*/
