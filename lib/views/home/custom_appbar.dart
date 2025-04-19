
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key, required this.profileUrl,
    
  });

  final screen = locator<ScreenSizes>();

  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screen.height * 0.15,
      width: screen.width,
      child: Stack(
        children: [
          Container(
            width: screen.width,
            height: screen.height * 0.1,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: ColorUiHelper.categoryTicketColor,
              borderRadius: BorderRadius.circular(32)
            ),
            
            child: Row(
              children: [
                SizedBox(width: 90,),
                Flexible(child: SizedBox(width: screen.width,)),
                Text(
                    "Hayatı Paylaş",
                    style: TextStyleHelper.homeAppBarTitleStyle,
                  ),
                Flexible(child: SizedBox(width: screen.width,)),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorUiHelper.categoryTicketColor,width: 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 0.2,
                        color: ColorUiHelper.homePageSecondShadow
                      )
                    ],
                    image: DecorationImage(image: NetworkImage(profileUrl))
                  ),
    
                ),
                SizedBox(width: 20,)
              ],
            ),
          ),
    
          Positioned(
            left: 30,
            child: Container(
              height: screen.height * 0.15,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icon/v-ticket.png"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: ColorUiHelper.homePageShadow,
                    blurRadius: 10,
                    spreadRadius: 0.5
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Paylaş",
                    style: TextStyleHelper.homePageStyle,
                  ),
                  Image.asset(
                    "assets/logo/logo4.png",
                    height: screen.height * 0.06,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
