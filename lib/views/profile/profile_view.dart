import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/profile/profile_card_header.dart';
import 'package:paylas/views/profile/profile_details.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final screen = locator<ScreenSizes>();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ProfileCardHeader(), ProfileCardDetails()],
            ),
            Positioned(
              right: 20,
              top: 40,
                child: IconButton(
                    onPressed: () {
                      _authService.signOut();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: ColorUiHelper.detailReportColor,
                    )))
          ],
        ),
      ),
    );
  }
}
