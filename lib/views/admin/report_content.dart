
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job_report_request/job_report_request.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/admin/report_card.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

// ignore: must_be_immutable
class ReportContent extends ConsumerWidget {
  ReportContent({
    super.key,
  });

  
  final screen = locator<ScreenSizes>();
  List<JobReportRequest> reports = [];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    reports = ref.watch(adminReportRequestsProvider);
    return Container(
        color: ColorUiHelper.mainSubtitleColor,
        width: screen.width,
        height: screen.height,
        child: reports.isNotEmpty
          ? ListView.builder(
            itemBuilder: (context, index) => ReportCard(
              reportId: reports[index].jobReportRequestId!,
              jobId: reports[index].jobId,
              imageUrl: reports[index].jobImgUrl,
              title: reports[index].jobTitle,
              jobOwner: reports[index].ownerName,
            ),
            itemCount: reports.length,
          
        ) : Center(
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
                  "İlan İsteği Yok!",
                  style: TextStyleHelper.pastJobsEmptyStyle,
                )),
          )
        
        );
  }
}
