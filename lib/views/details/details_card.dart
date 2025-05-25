
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/user/app_user.dart';
import 'package:paylas/services/user/user_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/details/details_buttons.dart';
import 'package:paylas/views/details/price_button.dart';
import 'package:paylas/views/details/score_bar.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class JobDetails extends StatelessWidget {
  JobDetails({
    super.key, required this.title, required this.favoriteCount, required this.jobOwner, required this.score, required this.description, required this.location, required this.jobDuration, required this.jobPrice,required this.userId
  });

  final screen = locator<ScreenSizes>();

  final String title;
  final int favoriteCount;
  final String jobOwner;
  final double score;
  final String description;
  final String location;
  final double jobDuration;
  final int jobPrice;
  final String userId;


  final UserService userService = locator<UserService>();

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
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right:16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyleHelper.detailTitleTextStyle,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: ColorUiHelper.favoriteIconColor,
                      ),
                      Text(
                        "$favoriteCount",
                        style: TextStyleHelper.detailSubtitleTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right:8),
              child: Text(
                "İlan Sahibi: $jobOwner",
                style: TextStyleHelper.detailSubtitleTextStyle,
              ),
            ),
    
            Padding(
              padding: EdgeInsets.only(left: 8, right:8),
              child: ScoreBar(
                score: 4.8,
              ),
            ),
    
            
            Padding(
              padding: EdgeInsets.only(left: 8, right:8),
              child: Text(
                description,
                style: TextStyleHelper.detailSubtitleTextStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right:8),
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
                      location,
                      style: TextStyleHelper.detailSubtitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right:8),
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
                      " $jobDuration Saat",
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
                    width:30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUiHelper.detailCardColor),
                    child: Icon(
                      Icons.send,
                      color: ColorUiHelper.categoryTicketColor,
                    ),
                  ),
                ),
                DetailsPageButton(
                  buttonColor: ColorUiHelper.productPriceColor,
                  buttonLabel: "Sahibini Ara ",
                  buttonIcon: Icon(
                    Icons.phone_in_talk_rounded,
                    color: ColorUiHelper.detailCardColor,
                    size:30,
                  ),
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
                  onPressed: () async {
                    AppUser currentUser = await userService.getUser(userId);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamed("OtherProfilePage",arguments: currentUser);
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
                )
              ],
            ),
            PriceButton(
              price: jobPrice,
            )
          ],
        ),
      ),
    );
  }
}
