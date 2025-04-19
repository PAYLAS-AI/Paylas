import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class PriceButton extends StatelessWidget {
  PriceButton({
    super.key,
    required this.price,
  });

  final screen = locator<ScreenSizes>();
  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screen.width - 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorUiHelper.categoryTicketColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              Text(
                "İş Ücreti            |",
                style: TextStyleHelper.detailPriceTextStyle,
              ),
                                        SizedBox(
                width: 30,
              ),
              Text(
                "$price TL",
                style: TextStyleHelper.detailButtonTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
