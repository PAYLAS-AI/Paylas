import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class CategoryHeader extends StatelessWidget {
  CategoryHeader({
    super.key,
 
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.6,
      height: 50,
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/icon/ticket.png"),fit: BoxFit.fill)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Paylaş", style: TextStyleHelper.categoryTitleStyle,),
          Text("Kategoriler", style: TextStyleHelper.categorySubitleStyle,)
        ],
      ),
    );
  }
}
