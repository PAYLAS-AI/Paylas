import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class JobBox extends StatelessWidget {
  JobBox({
    super.key, required this.imageUrl, required this.title, required this.jobOwner, required this.score,
  });

  final screen = locator<ScreenSizes>();
  final String imageUrl;
  final String title;
  final String jobOwner;
  final double score;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screen.width / 2 - 20,
        height: screen.height * 0.25,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: ColorUiHelper.inputLightColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                  color: ColorUiHelper.categoryTicketColor,
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  offset: Offset(1, 1))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: screen.height * 0.16,
                width: screen.width / 2 - 20,
                child: Stack(
                  children: [
                    Container(
                      width: screen.width / 2 - 20,
                      padding: const EdgeInsets.only(left: 8.0, right: 8 , top: 8, bottom: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 12,top: 12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorUiHelper.favoriteBgColor
                        ),
                        child: Center(
                          child: Icon(Icons.favorite_sharp, color: ColorUiHelper.favoriteIconColor, size: 20,),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
                width: (screen.width / 2) - 40,
                child: Text(
                  title,
                  style: TextStyleHelper.productTitleTextStyle,
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(
              width: (screen.width / 2) - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "İlan Sahibi :",
                    style: TextStyleHelper.productSubtitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: ((screen.width / 2) - 40) / 2,
                    child: Text(
                      " $jobOwner",
                      style: TextStyleHelper
                          .productSubtitleSecondTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: (screen.width / 2) - 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 2),
                    child: Image.asset(
                      "assets/icon/star.png",
                      height: 20,
                    ),
                  ),
                  Text(
                    "$score",
                    style: TextStyleHelper.productTitleTextStyle,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: ColorUiHelper.categoryTicketColor,
                        ),
                        SizedBox(width: 6,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}