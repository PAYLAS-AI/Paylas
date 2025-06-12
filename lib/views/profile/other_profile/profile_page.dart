import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/user/app_user.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/profile/other_profile/other_profile_details.dart';
import 'package:paylas/views/profile/other_profile/other_profile_header.dart';

class OtherProfilePage extends StatelessWidget {
  OtherProfilePage({super.key, required this.currentUser});

  final screen = locator<ScreenSizes>();
  final AppUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                children: [
                  OtherProfileCardHeader(
                    username: currentUser.userName,
                  ),
                  OtherProfileCardDetails(
                    currentUser: currentUser,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
