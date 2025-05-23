
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/categoryby.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/jobs/job_page_content.dart';





class JobsPage extends ConsumerWidget {
  JobsPage({super.key});

  final screen = locator<ScreenSizes>();
  final jobService = locator<JobService>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    CategoryBy selectedCategory = ref.watch(selectedCategoryProvider);
    var allJobs = ref.watch(allJobsProvider);
    List<Job> jobs = getCategoryList(selectedCategory, allJobs);
    

    
    return Scaffold(
      body: Container(
          width: screen.width,
          height: screen.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
          child: JobsPageContent(
            jobs: jobs,
            selectedCategory: selectedCategory,
          )
        ),
    );
  }

  List<Job> getCategoryList(CategoryBy selectedCategory , List<Job> jobs){
    List<Job> list = [...jobs];
    if(selectedCategory != CategoryBy.all){
      return list.where((job) => job.category == selectedCategory.name,).toList();
    }else{
      return list;
    }
  }

 
}

