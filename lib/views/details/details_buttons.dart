import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class DetailsPageButton extends StatelessWidget {
  DetailsPageButton({
    super.key,
    required this.buttonLabel,
    required this.buttonColor,
    required this.buttonIcon,
    this.labelColor,
    this.buttonWidth
  });

  final screen = locator<ScreenSizes>();
  final String buttonLabel;
  final Color buttonColor;
  final Widget buttonIcon;
  final Color? labelColor;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? screen.width / 2.1,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: buttonColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 40,child: buttonIcon),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              buttonLabel,
              style: labelColor != null ? TextStyleHelper.detailButtonSecondaryTextStyle : TextStyleHelper.detailButtonTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
