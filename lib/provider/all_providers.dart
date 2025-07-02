


import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/models/job_admin_control_request/job_admin_control_request.dart';
import 'package:paylas/models/job_report_request/job_report_request.dart';
import 'package:paylas/models/job_request/job_request.dart';
import 'package:paylas/models/model/categoryby.dart';
import 'package:paylas/models/model/sortedby.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/models/past_job/past_job.dart';

final selectedNavigationIndexProvider = StateProvider<int>((ref) => 0,);

final selectedCategoryProvider = StateProvider<CategoryBy>((ref) => CategoryBy.all);

final currentImageProvider = StateProvider<File>((ref) => File(""),);

final currentStepProvider = StateProvider<int>((ref) => 0,);

final currentCategoryProvider = StateProvider<CategoryBy>((ref) => CategoryBy.all,);

final addJobLoadingProvider = StateProvider<bool>((ref) => false,);

final detailsPageCurrentJobProvider = StateProvider<Job?>((ref) => null,);

final allJobsProvider = StateProvider<List<Job>>((ref) => [],);

final adminJobRequestsProvider = StateProvider<List<JobAdminControlRequest>>((ref) => [],);

final adminReportRequestsProvider = StateProvider<List<JobReportRequest>>((ref) => [],);

final pastJobsProvider = StateProvider<List<PastJob>>((ref) => [],);

final pastJobsSortedByProvider = StateProvider<Sortedby>((ref) => Sortedby.all,);

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final sendedJobRequestsProvider = StateProvider<List<JobRequest>>((ref) => [],);

final incomingJobRequestsProvider = StateProvider<List<JobRequest>>((ref) => [],);

final updateRequestPageProvider = StateProvider<int>((ref) => 0,);

final currentValidityDate = StateProvider<DateTime?>((ref) => null,);

final selectedCityProvider = StateProvider<String?>((ref) => null);

final selectedDistrictProvider = StateProvider<String?>((ref) => null);