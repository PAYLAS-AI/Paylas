import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class AddJobHeader extends StatelessWidget {
  AddJobHeader({
    super.key,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          gradient: LinearGradient(
              colors: [ColorUiHelper.headerBg, ColorUiHelper.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: CircleAvatar(
              backgroundColor: ColorUiHelper.transparent,
              radius: 28,
              child: Image.asset(
                "assets/logo/logo4.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Paylaş",
                style: TextStyleHelper.addJobTitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  "İLANINI PAYLAŞ",
                  style: TextStyleHelper.addJobSubtitleStyle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

