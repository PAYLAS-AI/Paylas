import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class ScoreCard extends StatelessWidget {
  ScoreCard({
    super.key, required this.imgAssetUrl, required this.label, required this.score,
    
  });

  final screen = locator<ScreenSizes>();
  final String imgAssetUrl;
  final String label;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screen.height * 0.2,
      width:  screen.width * 0.425 - 1.5,
      color: ColorUiHelper.profileCardBg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imgAssetUrl,height: screen.height * 0.08,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: TextStyleHelper.profileDetailUnderlineStyle,),
              SizedBox(height: 5,),
              Text(score, style: TextStyleHelper.profileDetailCounterStyle,)
            ],
          )
        ],
                        ),
    );
  }
}