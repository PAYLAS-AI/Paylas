import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job_report_request/job_report_request.dart';
import 'package:paylas/models/job_request/job_request.dart';
import 'package:paylas/models/model/requestResponse.dart';
import 'package:paylas/models/user/app_user.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/services/job_report_request/job_report_request_service.dart';
import 'package:paylas/services/job_request/job_request_service.dart';
import 'package:paylas/services/url_launcher/launcher_service.dart';
import 'package:paylas/services/user/user_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/details/details_buttons.dart';
import 'package:paylas/views/details/price_button.dart';
import 'package:paylas/views/details/score_bar.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class JobDetails extends StatefulWidget {
  const JobDetails(
      {super.key,
      required this.title,
      required this.favoriteCount,
      required this.jobOwner,
      required this.score,
      required this.category,
      required this.description,
      required this.location,
      required this.jobDuration,
      required this.jobPrice,
      required this.userId,
      required this.jobId,
      required this.ownerId,
      required this.imgUrl,
      required this.jobDate});

  final String title;
  final int favoriteCount;
  final String jobOwner;
  final double score;
  final String description;
  final String location;
  final String category;
  final DateTime jobDuration;
  final int jobPrice;
  final String userId;
  final String jobId;
  final String ownerId;
  final String imgUrl;
  final DateTime jobDate;

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final screen = locator<ScreenSizes>();

  @override
  void initState() {
    super.initState();
    getJobOwnerCredential();
  }

  AppUser? currentUser;

  final UserService userService = locator<UserService>();

  final UrlLauncherService launcherService = locator<UrlLauncherService>();

  final JobRequestService jobRequestService = locator<JobRequestService>();

  final JobReportRequestService reportService =
      locator<JobReportRequestService>();

  bool isReported = false;
  bool isSendRequest = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screen.width,
        height: screen.height * 0.6,
        decoration: BoxDecoration(
            color: ColorUiHelper.detailCardColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyleHelper.detailTitleTextStyle,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: ColorUiHelper.favoriteIconColor,
                      ),
                      Text(
                        "${widget.favoriteCount}",
                        style: TextStyleHelper.detailSubtitleTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                "İlan Sahibi: ${widget.jobOwner}",
                style: TextStyleHelper.detailSubtitleTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: ScoreBar(
                score: 4.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                widget.description,
                style: TextStyleHelper.detailSubtitleTextStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              width: (screen.width - 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icon/placeholder.png",
                    height: 30,
                  ),
                  Text(
                    " Lokasyon :",
                    style: TextStyleHelper.detailBoldSubtitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: (screen.width - 20) / 1.7,
                    child: Text(
                      widget.location,
                      style: TextStyleHelper.detailSubtitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              width: (screen.width - 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icon/time-passing.png",
                    height: 30,
                  ),
                  Text(
                    " İş Süresi :",
                    style: TextStyleHelper.detailBoldSubtitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: (screen.width - 20) / 1.7,
                    child: Text(
                      " ${widget.jobDuration.hour} Saat",
                      style: TextStyleHelper.detailSubtitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsPageButton(
                  buttonColor: ColorUiHelper.categoryTicketColor,
                  buttonLabel: "Mesaj Gönder",
                  buttonIcon: Container(
                    margin: EdgeInsets.only(left: 4),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUiHelper.detailCardColor),
                    child: Icon(
                      Icons.send,
                      color: ColorUiHelper.categoryTicketColor,
                    ),
                  ),
                  onPressed: () {
                    if (currentUser == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "İlan Sahibi Bilgileri Alınıyor Lütfen Az Sonra Tekrar Deneyin!")),
                      );
                    } else {
                      launcherService.sendEmailTo(
                          currentUser!.email, widget.title);
                    }
                  },
                ),
                DetailsPageButton(
                  buttonColor: ColorUiHelper.productPriceColor,
                  buttonLabel: "Sahibini Ara ",
                  buttonIcon: Icon(
                    Icons.phone_in_talk_rounded,
                    color: ColorUiHelper.detailCardColor,
                    size: 30,
                  ),
                  onPressed: () {
                    if (currentUser == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "İlan Sahibi Bilgileri Alınıyor Lütfen Az Sonra Tekrar Deneyin!")),
                      );
                    } else {
                      launcherService.openDialerWithNumber(currentUser!.phone);
                    }
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsPageButton(
                  buttonColor: ColorUiHelper.detailButtonColor,
                  buttonLabel: "İlan Sahibi",
                  labelColor: ColorUiHelper.categoryTicketColor,
                  buttonIcon: Icon(
                    Icons.account_circle_outlined,
                    color: ColorUiHelper.categoryTicketColor,
                    size: 30,
                  ),
                  onPressed: () {
                    if (currentUser == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "İlan Sahibi Bilgileri Alınıyor Lütfen Az Sonra Tekrar Deneyin!")),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushNamed("OtherProfilePage",
                          arguments: currentUser);
                    }
                  },
                ),
                DetailsPageButton(
                  buttonColor: ColorUiHelper.detailReportColor,
                  buttonLabel: "Şikayet Et",
                  buttonIcon: Icon(
                    Icons.report_sharp,
                    color: ColorUiHelper.detailCardColor,
                    size: 30,
                  ),
                  onPressed: () async {
                    if (isReported == false) {
                      JobReportRequest newReport = JobReportRequest(
                          jobId: widget.jobId,
                          ownerId: widget.ownerId,
                          reportedUserId: AuthService().auth.currentUser!.uid,
                          jobImgUrl: widget.imgUrl,
                          jobTitle: widget.title,
                          ownerName: widget.jobOwner);
                      await reportService.addReportRequest(newReport);
                      isReported = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Şikayet Edildi!")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Daha önce şikayet edildi!")),
                      );
                    }
                  },
                )
              ],
            ),
            PriceButton(
              price: widget.jobPrice,
              onPressed: () async {
                if (isSendRequest == false) {
                  var newRequest = JobRequest(
                      jobId: widget.jobId,
                      jobCategory: widget.category,
                      jobTitle: widget.title,
                      jobImgUrl: widget.imgUrl,
                      jobOwnerName: widget.jobOwner,
                      jobOwnerId: widget.ownerId,
                      jobLocation: widget.location,
                      jobDuration: widget.jobDuration,
                      jobDate: widget.jobDate,
                      jobPrice: widget.jobPrice.toDouble(),
                      senderUserId: widget.userId,
                      senderUserName:
                          AuthService().auth.currentUser!.displayName!,
                      requestResponse: RequestResponse.waiting.name);
                  await jobRequestService.addJobRequest(newRequest);
                  isSendRequest = true;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("İlan isteği gönderildi!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("İlan isteği zaten gönderildi!")),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void getJobOwnerCredential() async {
    currentUser = await userService.getUser(widget.ownerId);
  }
}
