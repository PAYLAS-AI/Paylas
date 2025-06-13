import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job_request/job_request.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/job_request/sended_card.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

// ignore: must_be_immutable
class SendedRequestsContent extends ConsumerWidget {
  SendedRequestsContent({
    super.key,
  });

  final screen = locator<ScreenSizes>();
  List<JobRequest> requests = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    requests = ref.watch(sendedJobRequestsProvider);
    return Container(
        color: ColorUiHelper.mainSubtitleColor,
        width: screen.width,
        height: screen.height,
        child: requests.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) => SendedCard(
                  requestId: requests[index].jobRequestId!,
                  imageUrl: requests[index].jobImgUrl,
                  title: requests[index].jobTitle,
                  jobOwner: requests[index].jobOwnerName,
                  location: requests[index].jobLocation,
                  jobDuration: requests[index].jobDuration.hour.toDouble(),
                  jobDate: DateFormat('dd/MM/yyyy').format(
                              requests[index].jobDate),
                  requestResponse: requests[index].requestResponse,
                  jobPrice: requests[index].jobPrice,
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
                      "Gönderilen İstek Yok!",
                      style: TextStyleHelper.pastJobsEmptyStyle,
                    )),
              ));
  }
}
