
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/profile/info_card.dart';
import 'package:paylas/views/profile/score_card.dart';
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

  final AuthService _authService = AuthService();
  late String? email;

  @override
  void initState() {

    super.initState();

    email = _authService.getCurrentUserEmail().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.85,
      height: screen.height * 0.6 + 7,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: ColorUiHelper.profileGradiendPrimary,blurRadius: 5,spreadRadius: 0.5)]),
      child: Column(
        children: [

          InfoTile(imgAssetUrl: "assets/icon/email.png" , label: email ?? ""),

          Container(width: screen.width * 0.85, height: 2, color: ColorUiHelper.profileGradiendPrimary,),


          InfoTile(
            imgAssetUrl: "assets/icon/phone.png",
            label: "+90 555 321 21 21",
          ),



          Container(width: screen.width * 0.85, height: 2, color: ColorUiHelper.profileGradiendPrimary,),


          Row(
            children: [
              ScoreCard(
                imgAssetUrl: "assets/icon/star.png",
                label: "İş Puanı",
                score: "4.7",
              ),

              Container(width: 3, height: screen.height * 0.2, color: ColorUiHelper.categoryTicketColor,),

              ScoreCard(
                imgAssetUrl: "assets/icon/job-success.png",
                label: "Başarılı İşler",
                score: "6",
              ),
            ],
          ),

          Container(width: screen.width * 0.85, height: 3, color: ColorUiHelper.categoryTicketColor,),

          Row(
            children: [
              ScoreCard(
                imgAssetUrl: "assets/icon/job-fail.png",
                label: "Başarısız İşler",
                score: "2",
              ),

              Container(width: 3, height: screen.height * 0.2, color: ColorUiHelper.categoryTicketColor,),

              ScoreCard(
                imgAssetUrl: "assets/icon/job.png",
                label: "İş İlanları",
                score: "1",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

