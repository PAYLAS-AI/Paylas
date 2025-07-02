
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/user/app_user.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/services/user/user_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/profile/owner_profile/info_card.dart';
import 'package:paylas/views/profile/owner_profile/score_card.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class ProfileCardDetails extends StatefulWidget {
  const ProfileCardDetails({
    super.key,
  });

  @override
  State<ProfileCardDetails> createState() => _ProfileCardDetailsState();
}

class _ProfileCardDetailsState extends State<ProfileCardDetails> {
  final screen = locator<ScreenSizes>();


  final userService = locator<UserService>();
  AppUser? currentUser;

  @override
  void initState() {

    super.initState();

    getUser();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.85,
      height: screen.height * 0.52 + 7,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: ColorUiHelper.profileGradiendPrimary,blurRadius: 5,spreadRadius: 0.5)]),
      child: Column(
        children: [
    
          InfoTile(imgAssetUrl: "assets/icon/email.png" , label: currentUser != null ? currentUser!.email : ""),
    
          Container(width: screen.width * 0.85, height: 2, color: ColorUiHelper.profileGradiendPrimary,),
    
    
          InfoTile(
            imgAssetUrl: "assets/icon/phone.png",
            label: currentUser != null ? currentUser!.phone : "+90 555 321 21 21",
          ),
    
    
    
          Container(width: screen.width * 0.85, height: 2, color: ColorUiHelper.profileGradiendPrimary,),
    
    
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScoreCard(
                imgAssetUrl: "assets/icon/star.png",
                label: "İş Puanı",
                score: currentUser != null ? currentUser!.jobScore.toString() : "0",
              ),
    
              Container(width: 3, height: screen.height * 0.16, color: ColorUiHelper.categoryTicketColor,),
    
              ScoreCard(
                imgAssetUrl: "assets/icon/job-success.png",
                label: "Başarılı İşler",
                score: currentUser != null ? currentUser!.successfulJobs.length.toString() : "0",
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
                score: currentUser != null ? currentUser!.failedJobs.length.toString() : "0",
              ),
    
              Container(width: 3, height: screen.height * 0.16, color: ColorUiHelper.categoryTicketColor,),
    
              ScoreCard(
                imgAssetUrl: "assets/icon/job.png",
                label: "İş İlanları",
                score: currentUser != null ? currentUser!.sharedJobCount.toString() : "0",
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getUser()async{
    currentUser = await userService.getUser(AuthService().auth.currentUser!.uid);
    setState(() {
      
    });
  }
}

