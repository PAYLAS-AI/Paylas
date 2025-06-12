
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/user/app_user.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/profile/owner_profile/info_card.dart';
import 'package:paylas/views/profile/owner_profile/score_card.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class OtherProfileCardDetails extends StatefulWidget {
  const OtherProfileCardDetails({
    super.key,
    required this.currentUser
  });
  final AppUser currentUser;

  @override
  State<OtherProfileCardDetails> createState() => _OtherProfileCardDetailsState();
}

class _OtherProfileCardDetailsState extends State<OtherProfileCardDetails> {
  final screen = locator<ScreenSizes>();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.85,
      height: screen.height * 0.52 + 7,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: ColorUiHelper.profileGradiendPrimary,blurRadius: 5,spreadRadius: 0.5)]),
      child: Column(
        children: [
    
          InfoTile(imgAssetUrl: "assets/icon/email.png" , label: widget.currentUser.email),
    
          Container(width: screen.width * 0.85, height: 2, color: ColorUiHelper.profileGradiendPrimary,),
    
    
          InfoTile(
            imgAssetUrl: "assets/icon/phone.png",
            label: widget.currentUser.phone,
          ),
    
    
    
          Container(width: screen.width * 0.85, height: 2, color: ColorUiHelper.profileGradiendPrimary,),
    
    
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScoreCard(
                imgAssetUrl: "assets/icon/star.png",
                label: "İş Puanı",
                score: widget.currentUser.jobScore.toString(),
              ),
    
              Container(width: 3, height: screen.height * 0.16, color: ColorUiHelper.categoryTicketColor,),
    
              ScoreCard(
                imgAssetUrl: "assets/icon/job-success.png",
                label: "Başarılı İşler",
                score: widget.currentUser.successfulJobs.length.toString(),
              ),
            ],
          ),
    
          Container(width: screen.width * 0.85, height: 3, color: ColorUiHelper.profileGradiendPrimary,),
    
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScoreCard(
                imgAssetUrl: "assets/icon/job-fail.png",
                label: "Başarısız İşler",
                score: widget.currentUser.failedJobs.length.toString(),
              ),
    
              Container(width: 3, height: screen.height * 0.16, color: ColorUiHelper.categoryTicketColor,),
    
              ScoreCard(
                imgAssetUrl: "assets/icon/job.png",
                label: "İş İlanları",
                score: widget.currentUser.sharedJobCount.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

