import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class InfoTile extends StatelessWidget {
  InfoTile({
    super.key, required this.imgAssetUrl, required this.label,
  });

  final screen = locator<ScreenSizes>();
  final String imgAssetUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screen.height * 0.1,
      width:  screen.width * 0.85,
      color: ColorUiHelper.profileCardBg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imgAssetUrl,height: screen.height * 0.06,),
          SizedBox(width: screen.width * 0.58,child: Text(label, style: TextStyleHelper.profileDetailStyle,))
        ],
      ),
    );
  }
}



