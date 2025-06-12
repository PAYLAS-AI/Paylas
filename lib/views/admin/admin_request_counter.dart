import 'package:flutter/material.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class RequestCounter extends StatelessWidget {
  const RequestCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:2.0),
      child: CircleAvatar(backgroundColor: ColorUiHelper.detailReportColor,radius: 8,child: Text("2",style: TextStyleHelper.jobRequestToolbarCounterStyle,),),
    );
  }
}