import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/profile/profile_card_header.dart';
import 'package:paylas/views/profile/profile_details.dart';



class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screen.width,
        height: screen.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCardHeader(),

            ProfileCardDetails()

          ],
        ),
      );
  }
}
