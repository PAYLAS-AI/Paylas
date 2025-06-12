import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/sortedby.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/tools/text_controllers.dart';
import 'package:paylas/views/past_jobs/sort_item.dart';





class SortBar extends ConsumerStatefulWidget {
  const SortBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortBarState();
}

class _SortBarState extends ConsumerState<SortBar> {


  final screen = locator<ScreenSizes>();
  Sortedby sortedBy = Sortedby.all; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.all;
              });
              sortJobs(sortedBy);
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "Hepsi",
              isSelected: sortedBy == Sortedby.all ? true : false,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.price; 
              });
              sortJobs(sortedBy);
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "Çok Kazandıran",
              isSelected: sortedBy == Sortedby.price ? true : false,
              icon: Image.asset("assets/icon/tag.png"),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.location; 
              });
              sortJobs(sortedBy);
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "Lokasyon",
              isSelected: sortedBy == Sortedby.location ? true : false,
              icon: Image.asset("assets/icon/placeholder.png"),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.time; 
              });
              sortJobs(sortedBy);
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "İş Süresi",
              isSelected: sortedBy == Sortedby.time ? true : false,
              icon: Image.asset("assets/icon/time-passing.png"),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                sortedBy = Sortedby.date; 
              });
              sortJobs(sortedBy);
            },
            borderRadius: BorderRadius.circular(42),
            child: SortItem(
              label: "İş Tarihi",
              isSelected: sortedBy == Sortedby.date ? true : false,
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/icon/calendar.png"),
              ),
            ),
          ),
          
      
        ],
      ),
    );
  }

  void sortJobs( Sortedby sortedBy){
    TextControllerHelper.resetFilterTextControllers();
    List<Job> jobs = [...ref.read(allJobsProvider)];
    if(sortedBy == Sortedby.date){
      jobs.sort((a, b) => a.createdDate.compareTo(b.createdDate));
    }else if(sortedBy == Sortedby.price){
      jobs.sort((a, b) => b.price.compareTo(a.price));
    }else if( sortedBy == Sortedby.time){
      jobs.sort((a, b) => a.validityDate.compareTo(b.validityDate));
    }else if( sortedBy == Sortedby.location ){
      jobs.sort((a, b) => a.location.compareTo(b.location));
    }else{
      jobs = [...locator<JobService>().allJobs];
    }
    debugPrint(jobs.first.title.toString());
    ref.read(allJobsProvider.notifier).state = jobs;
  }

}

