import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job_request/job_request.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/job_request/incoming_job_card.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

// ignore: must_be_immutable
class IncomingRequestsContent extends ConsumerWidget {
  IncomingRequestsContent({
    super.key,
  });

  final screen = locator<ScreenSizes>();
  List<JobRequest> requests = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    requests = ref.watch(incomingJobRequestsProvider);
    return Container(
        color: ColorUiHelper.mainSubtitleColor,
        width: screen.width,
        height: screen.height,
        child: requests.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) => IncomingJobCard(
                  earning: requests[index].jobPrice.toInt(),
                  category: requests[index].jobCategory,
                  jobTitle: requests[index].jobTitle,
                  location: requests[index].jobLocation,
                  jobDuration:requests[index].jobDuration,
                  jobId: requests[index].jobId,
                  requestId: requests[index].jobRequestId!,
                  userId: requests[index].senderUserId,
                  imageUrl: requests[index].jobImgUrl,
                  title: requests[index].jobTitle,
                  user: requests[index].senderUserName,

                ),
                itemCount: requests.length,
              )
            : Center(
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
                      "Gelen İstek Yok!",
                      style: TextStyleHelper.pastJobsEmptyStyle,
                    )),
              ));
  }
}
