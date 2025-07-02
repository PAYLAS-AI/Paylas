import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({super.key, required this.label, required this.assetIconUrl, this.height, this.onPressed});

  final screen = locator<ScreenSizes>();
  final String label;
  final String assetIconUrl;
  final double? height;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(18),
      child: Container(
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
        width: 100,
        height: 100,
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height ?? 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(assetIconUrl))),
            ),
            Text(label, style:  TextStyleHelper.homeCategoryNameStyle,)
          ],
        ),
      ),
    );
  }
}