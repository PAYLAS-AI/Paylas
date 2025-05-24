import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:paylas/models/past_job/past_job.dart';
import 'package:paylas/views/past_jobs/filter_bar.dart';
import 'package:paylas/views/past_jobs/past_job_box.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';
import 'package:paylas/views/widgets/job_pages_header.dart';

// ignore: must_be_immutable
class PastJobsContent extends ConsumerStatefulWidget {
  PastJobsContent({
    super.key,
    required this.pastJobs,
  });
  List<PastJob> pastJobs;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PastJobsContentState();
}

class _PastJobsContentState extends ConsumerState<PastJobsContent> {
  late List<PastJob> pastJobs;
  
  @override
  void initState() {
    super.initState();
    pastJobs = [...widget.pastJobs];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JobsPagesHeader(
          iconAsset: "assets/icon/history.png",
          label: "Geçmiş İşlerim",
        ),
        PastJobsFilterBar(
          onChanged: (value) {
              setState(() {
                    pastJobs = filteredList(value);
                  });
            },
        ),
        Flexible(
            child: pastJobs.isEmpty
                ? Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorUiHelper.homePageSecondShadow,
                                  blurRadius: 5,
                                  spreadRadius: 5)
                            ]),
                        child: Text(
                          "Geçmiş İş Yok!",
                          style: TextStyleHelper.pastJobsEmptyStyle,
                        )),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => PastJobBox(
                          imageUrl:
                              "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
                          jobDate: DateFormat('dd/MM/yyyy')
                              .format(pastJobs[index].completedDate),
                          title: pastJobs[index].jobTitle,
                          jobOwner:
                              "${pastJobs[index].userId.substring(0, 5)} Bey",
                          location: pastJobs[index].location,
                          jobDuration: pastJobs[index]
                              .jobDuration
                              .difference(pastJobs[index].completedDate)
                              .inHours
                              .toDouble(),
                          jobPrice: pastJobs[index].earning.toDouble(),
                          score: pastJobs[index].jobScore,
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: pastJobs.length))
      ],
    );
  }

  List<PastJob> filteredList(String value){
    List<PastJob> newJobs = widget.pastJobs;
    return newJobs.where((element) => element.jobTitle.contains(value) || element.location.contains(value),).toList();
  }


}
