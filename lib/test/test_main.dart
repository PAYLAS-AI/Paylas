import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paylas/firebase_options.dart';
import 'package:paylas/models/category/category.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/services/category/category_service.dart';
import 'package:paylas/services/job/job_service.dart';

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
