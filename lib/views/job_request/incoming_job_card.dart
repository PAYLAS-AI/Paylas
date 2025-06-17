import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/model/requestResponse.dart';
import 'package:paylas/models/past_job/past_job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/job_request/job_request_service.dart';
import 'package:paylas/services/past_job/past_job_service.dart';
import 'package:paylas/services/user/user_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/admin/admin_procces_button.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class IncomingJobCard extends ConsumerWidget {
  IncomingJobCard(
      {super.key,
      required this.earning,
      required this.location,
      required this.category,
      required this.jobTitle,
      required this.jobDuration,
      required this.jobId,
      required this.imageUrl,
      required this.requestId,
      required this.title,
      required this.user,
      required this.userId});

  final screen = locator<ScreenSizes>();
  final UserService userService = locator<UserService>();
  final requestService = locator<JobRequestService>();
  final pastJobService = locator<PastJobService>();
  final jobservice = locator<JobService>();
  final String imageUrl;
  final String title;
  final String user;
  final String userId;
  final String requestId;
  final String jobId;
  final DateTime jobDuration;
  final String jobTitle;
  final int earning;
  final String location;
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: screen.width,
      height: screen.height * 0.15,
      margin: EdgeInsets.only(bottom: 8, top: 8),
      decoration:
          BoxDecoration(color: ColorUiHelper.inputLightColor, boxShadow: [
        BoxShadow(
            color: ColorUiHelper.categoryTicketColor,
            blurRadius: 1,
            spreadRadius: 0.1,
            offset: Offset(1, 1))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                  width: (screen.width - 20) / 3.2,
                  height: screen.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  )),
              AdminProccessButton(
                bgColor: ColorUiHelper.mainSubtitleColor,
                label: "PROFİL",
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: ColorUiHelper.productTitleColor,
                  size: 26,
                ),
                onPressed: () async {
                  var currentUser = await userService.getUser(userId);
                  Navigator.of(context)
                      .pushNamed("OtherProfilePage", arguments: currentUser);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: (screen.width - 20) / 1.5,
                    height: 55,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.adminJobRequestTitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: (screen.width - 20) / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Kullanıcı :",
                        style: TextStyleHelper.adminJobRequestTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: (screen.width - 20) / 2.8,
                        child: Text(
                          " $user",
                          style: TextStyleHelper.adminJobRequestSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      AdminProccessButton(
                        bgColor: ColorUiHelper.adminCheckColor,
                        label: "ONAYLA",
                        icon: Icon(
                          Icons.check_outlined,
                          color: ColorUiHelper.mainSubtitleColor,
                          size: 26,
                        ),
                        labelStyle: TextStyleHelper.adminButtonsSecondTextStyle,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog.adaptive(
                                title: Text(
                                  'İLAN İSTEĞİ SONUCU',
                                  style: TextStyleHelper
                                      .requestDialogTitleTextStyle,
                                ),
                                content: Text(
                                    'İstekte bulunan kullanıcı bu ilanda istenilen durumu sağladı mı?',
                                    style: TextStyleHelper
                                        .requestDialogSubtitleTextStyle),
                                actions: <Widget>[
                                  TextButton.icon(
                                    icon: Icon(Icons.check_outlined),
                                    label: Text('Başarılı!'),
                                    onPressed: () async {
                                      showScoreAndSuccessDialog(context, ref);
                                    },
                                  ),
                                  TextButton.icon(
                                    style: ButtonStyle(
                                        iconColor: WidgetStatePropertyAll(
                                            ColorUiHelper.closeButtonColor),
                                        foregroundColor: WidgetStatePropertyAll(
                                            ColorUiHelper.closeButtonColor),
                                        overlayColor: WidgetStatePropertyAll(
                                            ColorUiHelper.closeButtonColor
                                                .withOpacity(0.2))),
                                    icon: Icon(Icons.close_outlined),
                                    label: Text('Başarısız!'),
                                    onPressed: () async {
                                      await userService.updateJobResult(
                                          userId, jobId, false);
                                      await requestService
                                          .updateJobRequestResponse(requestId,
                                              RequestResponse.completed.name);
                                      ref
                                          .read(updateRequestPageProvider
                                              .notifier)
                                          .state += 1;

                                      Navigator.of(context)
                                          .pop(); // AlertDialog'u kapatır
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      AdminProccessButton(
                        bgColor: ColorUiHelper.adminRejectColor,
                        label: "REDDET",
                        icon: Icon(
                          Icons.close_outlined,
                          color: ColorUiHelper.mainSubtitleColor,
                          size: 26,
                        ),
                        labelStyle: TextStyleHelper.adminButtonsSecondTextStyle,
                        onPressed: () async {
                          await requestService.updateJobRequestResponse(
                              requestId, RequestResponse.rejected.name);
                          ref.read(updateRequestPageProvider.notifier).state +=
                              1;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Gelen istek reddedildi!")),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showScoreAndSuccessDialog(context, ref) {
    int score = 0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Skor Seçimi"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              int skor = index + 1;
              return RadioListTile<int>(
                title: Text("Skor: $skor"),
                value: skor,
                groupValue: score,
                onChanged: (value) async {
                  await userService.updateJobResult(userId, jobId, true);
                  var newPastJob = PastJob(
                      jobId: jobId,
                      userId: userId,
                      category: category,
                      imgUrl: imageUrl,
                      userName: user,
                      completedDate: DateTime.now(),
                      jobDuration: jobDuration,
                      location: location,
                      earning: earning,
                      jobTitle: jobTitle,
                      jobScore: value!.toDouble());
                  await jobservice.archiveJob(jobId);
                  await pastJobService.addNewPastJob(newPastJob);
                  await requestService.updateJobRequestResponse(
                      requestId, RequestResponse.completed.name);
                  ref.read(updateRequestPageProvider.notifier).state += 1;

                  ref.read(allJobsProvider.notifier).state =
                      await jobservice.getAllJobs();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("İlan tamamlandı ve arşive alındı!")),
                  );
                  Navigator.of(context).pop(); // AlertDialog'u kapatır
                  Navigator.of(context).pop();
                },
              );
            }),
          ),
        );
      },
    );
    debugPrint(score.toString());
  }
}
