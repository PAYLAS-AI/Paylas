import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/sortedby.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/models/past_job/past_job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/past_job/past_job_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/tools/text_controllers.dart';
import 'package:paylas/views/past_jobs/sort_item.dart';





class PastJobSortBar extends ConsumerStatefulWidget {
  const PastJobSortBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PastJobSortBarState();
}

class _PastJobSortBarState extends ConsumerState<PastJobSortBar> {


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
    TextControllerHelper.resetFilterPastJobsTextControllers();
    List<PastJob> pastJobs = [...ref.read(pastJobsProvider)];
    if(sortedBy == Sortedby.date){
      pastJobs.sort((a, b) => a.completedDate.compareTo(b.completedDate));
    }else if(sortedBy == Sortedby.price){
      pastJobs.sort((a, b) => b.earning.compareTo(a.earning));
    }else if( sortedBy == Sortedby.time){
      pastJobs.sort((a, b) => a.jobDuration.compareTo(b.jobDuration));
    }else if( sortedBy == Sortedby.location ){
      pastJobs.sort((a, b) => a.location.compareTo(b.location));
    }else{
      pastJobs = [...locator<PastJobService>().pastJobs];
    }
    debugPrint(pastJobs.first.jobTitle.toString());
    ref.read(pastJobsProvider.notifier).state = pastJobs;
  }

}

