


import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/model/categoryby.dart';
import 'package:paylas/model/sortedby.dart';
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

final pastJobsProvider = StateProvider<List<PastJob>>((ref) => [],);

final pastJobsSortedByProvider = StateProvider<Sortedby>((ref) => Sortedby.all,);