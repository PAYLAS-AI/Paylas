
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/model/requestResponse.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job_request/job_request_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class SendedCard extends ConsumerWidget {
  SendedCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.jobOwner,
    required this.location,
    required this.jobDuration,
    required this.jobDate,
    required this.jobPrice,
    required this.requestResponse,
    required this.requestId,
  });

  final screen = locator<ScreenSizes>();
  final requestService = locator<JobRequestService>();
  final String imageUrl;
  final String title;
  final String jobOwner;
  final String location;
  final double jobDuration;
  final String jobDate;
  final double jobPrice;
  final String requestResponse;
  final String requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: screen.width - 20,
      height: screen.height * 0.15,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorUiHelper.inputLightColor,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
                color: ColorUiHelper.categoryTicketColor,
                blurRadius: 1,
                spreadRadius: 0.1,
                offset: Offset(1, 1))
          ]),
      child: Row(
        children: [
          SizedBox(
              width: (screen.width - 20) / 3,
              height: screen.height * 0.15,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: (screen.width - 20) / 2.1,
                        child: Text(
                          title,
                          style: TextStyleHelper.productTitleTextStyle,
                          overflow: TextOverflow.ellipsis,
                        )),
                    InkWell(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(24)),
                      splashColor: ColorUiHelper.categoryTicketColor,
                      onTap: () async {
                        await requestService.deleteJobRequest(requestId);

                        List removedList = ref.read(sendedJobRequestsProvider);

                        removedList.removeWhere((req) => req.jobRequestId == requestId,);
                        ref.read(sendedJobRequestsProvider.notifier).state =  [...removedList];

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: requestResponse == RequestResponse.waiting ? Text("Gönderilen istek iptal edildi!") : Text("Gönderilen istek silindi!") ),
                          );
                      },
                      child: Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                              color: ColorUiHelper.closeButtonColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.close_sharp,
                                size: 18,
                                color: ColorUiHelper.mainSubtitleColor,
                              ),
                              Text(
                                requestResponse == RequestResponse.waiting ? "İPTAL" : "SİL",
                                style:
                                    TextStyleHelper.jobRequestCloseButtonStyle,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "İlan Sahibi :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: (screen.width - 20) / 3,
                        child: Text(
                          " $jobOwner",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icon/placeholder.png",
                        height: 18,
                      ),
                      Text(
                        "Lokasyon :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: (screen.width - 20) / 3.2,
                        child: Text(
                          " $location",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icon/time-passing.png",
                        height: 18,
                      ),
                      Text(
                        "İş Süresi :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: (screen.width - 20) / 3.2,
                        child: Text(
                          " $jobDuration Saat",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icon/calendar.png",
                        height: 18,
                      ),
                      Text(
                        "İş Tarihi :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: (screen.width - 20) / 3.2,
                        child: Text(
                          " $jobDate",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: ((screen.width - 20) / 3.2) * 2,
                    child: Row(
                      children: [
                        SizedBox(
                          width: (screen.width - 20) / 3.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.request_quote,
                                color: ColorUiHelper.productTitleColor,
                                size: 16,
                              ),
                              Flexible(
                                child: Text(
                                  ": $requestResponse",
                                  style: TextStyleHelper
                                      .jobRequestResponseTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: (screen.width - 20) / 3.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Ücret :",
                                style: TextStyleHelper.productTitleTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Flexible(
                                child: Text(
                                  " $jobPrice TL",
                                  style: TextStyleHelper.productPriceTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
