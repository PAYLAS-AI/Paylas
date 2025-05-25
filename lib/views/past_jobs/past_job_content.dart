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
    required this.filteredPastJobs,
  });
  List<PastJob> pastJobs;
  List<PastJob> filteredPastJobs;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PastJobsContentState();
}

class _PastJobsContentState extends ConsumerState<PastJobsContent> {
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
              widget.filteredPastJobs = filteredList(value);
            });
          },
        ),
        Expanded(
            child: widget.filteredPastJobs.isEmpty
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
                          jobDate: DateFormat('dd/MM/yyyy').format(
                              widget.filteredPastJobs[index].completedDate),
                          title: widget.filteredPastJobs[index].jobTitle,
                          jobOwner:
                              "${widget.filteredPastJobs[index].userId.substring(0, 5)} Bey",
                          location: widget.filteredPastJobs[index].location,
                          jobDuration: widget
                              .filteredPastJobs[index].jobDuration
                              .difference(
                                  widget.filteredPastJobs[index].completedDate)
                              .inHours
                              .toDouble(),
                          jobPrice:
                              widget.filteredPastJobs[index].earning.toDouble(),
                          score: widget.filteredPastJobs[index].jobScore,
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: widget.filteredPastJobs.length))
      ],
    );
  }

  List<PastJob> filteredList(String value) {
    List<PastJob> newJobs = widget.pastJobs;
    return newJobs
        .where(
          (element) =>
              element.jobTitle.contains(value) ||
              element.location.contains(value),
        )
        .toList();
  }
}
