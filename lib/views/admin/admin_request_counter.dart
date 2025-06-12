import 'package:flutter/material.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

// ignore: must_be_immutable
class RequestCounter extends StatelessWidget {
  RequestCounter({
    super.key,
    required this.requestCount
  });
  int requestCount = 0;

  @override
  Widget build(BuildContext context) {
    return requestCount != 0 ? Padding(
      padding: const EdgeInsets.only(left:2.0),
      child: CircleAvatar(backgroundColor: ColorUiHelper.detailReportColor,radius: 8,child: Text(requestCount.toString(),style: TextStyleHelper.jobRequestToolbarCounterStyle,),),
    ) : Container() ;
  }
}