import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class ScrollContent extends StatelessWidget {
  ScrollContent({
    super.key,
    required this.height,
    required this.labelIconAssetUrl,
    required this.label,
    required this.widgetBuilder,
     this.onPressed,
  });

  final screen = locator<ScreenSizes>();
  final double height;
  final String labelIconAssetUrl;
  final String label;

  final Widget widgetBuilder;



  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: screen.width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: ColorUiHelper.homePageSecondShadow.withAlpha(70),
            blurRadius: 10)
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Image.asset(
                labelIconAssetUrl,
                height: 25,
              ),
              SizedBox(
                width: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  label,
                  style: TextStyleHelper.homeLabelStyle,
                ),
              ),

              Flexible(child: SizedBox(width: screen.width,)),
              SizedBox(
                height: 25,
                child: TextButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(ColorUiHelper.homePageShadow)
                    ),
                    child: Text(
                      "Tümü",
                      style: TextStyleHelper.homeAllButtonTextStyle,
                    )),
              ),
              SizedBox(width: 8,)
            ],
          ),
          SizedBox(
            height: height - 40,
            width: screen.width,
            child: widgetBuilder
          )
        ],
      ),
    );
  }
}
