import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class SubCategoryButton extends StatelessWidget {
  SubCategoryButton({
    super.key,
    this.onPressed,
  });

  final screen = locator<ScreenSizes>();

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(36),
      child: Container(
        width: screen.width * 0.55,
        height: screen.height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: ColorUiHelper.mainSubtitleColor,
            border: Border.all(
                color: ColorUiHelper.categoryTicketColor, width: 2),
            boxShadow: [
              BoxShadow(
                  color: ColorUiHelper.mainSubtitleColor,
                  blurRadius: 3,
                  spreadRadius: 0.5)
            ]),
      
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 4,),
                Text("TÜM KATEGORİLER" , style: TextStyleHelper.categoryContentSecondarStyle,),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: ColorUiHelper.categoryTicketColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Icon(Icons.send_rounded,size:18 , color: ColorUiHelper.mainSubtitleColor,),
                    ),
                  ),
                )
              ],
            ),
        
      ),
    );
  }
}
