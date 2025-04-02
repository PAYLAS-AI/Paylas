import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  final screen = locator<ScreenSizes>();
  final String labelText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(36),
      child: Container(
        width: screen.width * 0.85,
        height: screen.height * 0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: ColorUiHelper.categoryTicketColor,
          border: Border.all(color: ColorUiHelper.mainSubtitleColor,width: 2),
          boxShadow: [BoxShadow(color: ColorUiHelper.categoryTicketColor, blurRadius: 5 , spreadRadius: 1)]
        ),
        child: Center(
          child: Text(labelText, style: TextStyleHelper.categoryContentStyle,),
        ),
      ),
    );
  }
}



