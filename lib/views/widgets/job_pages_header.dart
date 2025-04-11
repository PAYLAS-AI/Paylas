import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class JobsPagesHeader extends StatelessWidget {
  JobsPagesHeader({
    super.key,
    required this.iconAsset,
    required this.label
  });

  final screen = locator<ScreenSizes>();

  final String iconAsset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screen.height * 0.18,
      child: Stack(
        children: [
    
          Positioned(
            left: 95,
            top: screen.height * 0.09 - 40,
            child: Container(
              height: 50,
              width: screen.width - 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/icon/ticket.png"),
                fit: BoxFit.fill),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Image.asset(iconAsset
                  ,height: screen.height * 0.075,),
                  SizedBox(width: 10,),
                  Text(label, style: TextStyleHelper.pastJobsTitleStyle,)
                ],
              ),
            ),
          ),
    
    
          Positioned(
            left: 30,
            
            child: Container(
              height: screen.height * 0.18,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/icon/v-ticket.png"),
                fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Paylaş", style: TextStyleHelper.categoryTitleStyle,),
                  Image.asset("assets/logo/logo4.png"
                  ,height: screen.height * 0.075,),
                ],
              ),
            ),
          ),
    
          
        ],
      ),
    );
  }
}