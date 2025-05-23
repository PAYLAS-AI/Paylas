import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paylas/firebase_options.dart';
import 'package:paylas/models/category/category.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/services/category/category_service.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/models/past_job/past_job.dart';
import 'package:paylas/services/past_job/past_job_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final categoryService = CategoryService();
  final jobService = JobService();
  final pastJobService = PastJobService();

  // Yeni kategori
  await categoryService.addNewCategory(
    Category(id: '', name: 'Kategori ismi', createdDate: DateTime.now()),
  );

  // Tüm kategoriler
  final categories = await categoryService.getAllCategories();
  for (final c in categories) {
    print('Kategori: ${c.name}');
  }


  final job = Job(
    id: '',
    title: 'Bahçe Bakımı',
    description: 'Ev bahçesi düzenlenecek.',
    category: 'temizlik-id',
    ownerId: 'uid-1234',
    createdDate: DateTime.now(),
    validityDate: DateTime.now().add(Duration(days: 30)), // 30 gün geçerli
    location: 'Antalya, Muratpaşa', // örnek konum
    isArchived: false,
    price: 100
  );
  await jobService.addNewJob(job);

  // Tüm işler
  final jobs = await jobService.getAllJobs();
  for (final j in jobs) {
    print('İş: ${j.title} - Archived: ${j.isArchived}');
  }

  // Örnek geçmiş iş


  // Show pastJob
  final result = await pastJobService.showPastJob('AznnoJvIpCKPEJK0cOAL'); // gerçek ID ile değiştir
  if (result != null) {
    print('Past Job -> Job ID: ${result.jobId}, User: ${result.userId}');
  } else {
    print('Past job not found.');
  }
}


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