
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/categoryby.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/jobs/job_box.dart';
import 'package:paylas/views/jobs/jobs_filter_bar.dart';
import 'package:paylas/views/widgets/job_pages_header.dart';



class JobsPage extends ConsumerWidget {
  JobsPage({super.key});

  final screen = locator<ScreenSizes>();
  final jobService = locator<JobService>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    CategoryBy selectedCategory = ref.watch(selectedCategoryProvider);
    List<Job> jobs = getCategoryList(selectedCategory);
    ref.watch(allJobsProvider);
    
    return Scaffold(
      body: Container(
          width: screen.width,
          height: screen.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
          child: Column(
            children: [
              JobsPagesHeader(
                iconAsset: selectedCategory == CategoryBy.all ? "assets/icon/categories/all.png" : selectedCategory == CategoryBy.services ? "assets/icon/categories/services.png" : (selectedCategory == CategoryBy.shoppings ? "assets/icon/categories/shopping.png" : (selectedCategory == CategoryBy.handicrafts ? "assets/icon/categories/handicrafts.png" : (selectedCategory == CategoryBy.craftsmanship ? "assets/icon/categories/craftsmanship.png" : "assets/icon/categories/education.png") ) ),
                label: selectedCategory == CategoryBy.all ? "Tüm İlanlar" : selectedCategory == CategoryBy.services ? "Hizmetler" : (selectedCategory == CategoryBy.shoppings ? "Ürünler" : (selectedCategory == CategoryBy.handicrafts ? "El Becerisi" : (selectedCategory == CategoryBy.craftsmanship ? "Ustalık" : "Eğitim") ) ),
              ),
              JobsFilterBar(),
              
              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(jobs.length, (index) => JobBox(
                  imageUrl: "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
                  title: jobs[index].title,
                  jobOwner: "${jobs[index].ownerId} Bey",
                  score: 4.8,
                  onTap: () {
                    ref.read(detailsPageCurrentJobProvider.notifier).state = jobs[index];
                    Navigator.of(context).pushNamed("DetailsPage");
                  },
                )),
                ),
              )
            ],
          ),
        ),
    );
  }

  
  List<Job> getCategoryList(CategoryBy selectedCategory){
    List<Job> list = jobService.allJobs;
    if(selectedCategory != CategoryBy.all){
      return list.where((job) => job.category == selectedCategory.name,).toList();
    }else{
      return list;
    }
  }
}
