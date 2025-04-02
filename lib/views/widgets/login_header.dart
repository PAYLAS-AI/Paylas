import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class LoginHeader extends StatelessWidget {
   LoginHeader({
    super.key,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.85,
      height: screen.height * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        gradient: LinearGradient(colors: [ColorUiHelper.headerBg , ColorUiHelper.transparent],begin: Alignment.topCenter, end: Alignment.bottomCenter)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Paylaş", style:  TextStyleHelper.loginTitle2Style,),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("HAYATI PAYLAŞ", style: TextStyleHelper.loginSubtitle2Style,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: CircleAvatar(
              backgroundColor: ColorUiHelper.transparent,
              radius: 28,
              child: Image.asset("assets/logo/logo4.png",fit:  BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }
}