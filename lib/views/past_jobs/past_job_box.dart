import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class PastJobBox extends StatelessWidget {
  PastJobBox({
    super.key, required this.imageUrl, required this.title, required this.score, required this.jobOwner, required this.location, required this.jobDuration, required this.jobDate, required this.jobPrice,
  });

  final screen = locator<ScreenSizes>();
  final String imageUrl;
  final String title;
  final double score;
  final String jobOwner;
  final String location;
  final double jobDuration;
  final String jobDate;
  final double jobPrice;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width - 20,
      height: screen.height * 0.2,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorUiHelper.inputLightColor,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
                color: ColorUiHelper.categoryTicketColor,
                blurRadius: 1,
                spreadRadius: 0.1,
                offset: Offset(1, 1))
          ]),
      child: Row(
        children: [
          SizedBox(
              width: (screen.width - 20) / 2.5,
              height: screen.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: (screen.width - 20) / 2.3,
                        child: Text(
                      title,
                      style: TextStyleHelper.productTitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 2.0, right: 2),
                      child: Image.asset(
                        "assets/icon/star.png",
                        height: 20,
                      ),
                    ),
                    Text(
                      score.toString(),
                      style: TextStyleHelper.productTitleTextStyle,
                    )
                  ],
                ),
    
                SizedBox(height: 2,),
            
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "İlan Sahibi :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                         width:(screen.width - 20) / 3 ,
                        child: Text(
                          " $jobOwner",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
            
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/icon/placeholder.png", height: 20,),
                      Text(
                        "Lokasyon :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width:(screen.width - 20) / 3.2 ,
                        child: Text(
                          " $location",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
            
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/icon/time-passing.png", height: 20,),
                      Text(
                        "İş Süresi :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width:(screen.width - 20) / 3.2 ,
                        child: Text(
                          " $jobDuration Saat",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
            
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/icon/calendar.png", height: 20,),
                      Text(
                        "İş Tarihi :",
                        style: TextStyleHelper.productSubtitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width:(screen.width - 20) / 3.2 ,
                        child: Text(
                          " $jobDate",
                          style: TextStyleHelper.productSubtitleSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
            
                SizedBox(
                  width: (screen.width - 20) / 1.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Kazanç :",
                        style: TextStyleHelper.productTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        " $jobPrice TL",
                        style: TextStyleHelper.productPriceTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                ),
            
            
              ],
            ),
          )
        ],
      ),
    );
  }
}
