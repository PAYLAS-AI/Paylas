import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job_admin_control_request/job_admin_control_request.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/admin/create_job_request_box.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

// ignore: must_be_immutable
class CreatedJobContent extends ConsumerWidget {
  CreatedJobContent({
    super.key,
  });

  final screen = locator<ScreenSizes>();
  List<JobAdminControlRequest> requests = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    requests = ref.watch(adminJobRequestsProvider);
    return Container(
      color: ColorUiHelper.mainSubtitleColor,
      width: screen.width,
      height: screen.height,
      child: requests.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) => CreatedJobRequestCard(
                requestId: requests[index].jobAdminControlRequestId!,
                jobId: requests[index].jobId,
                imageUrl: requests[index].jobImgUrl,
                title: requests[index].jobTitle,
                jobOwner: requests[index].ownerName,
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
                  "İlan İsteği Yok!",
                  style: TextStyleHelper.pastJobsEmptyStyle,
                )),
          ),
    );
  }
}
