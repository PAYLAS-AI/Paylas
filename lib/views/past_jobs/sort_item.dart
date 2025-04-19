
import 'package:flutter/material.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

// ignore: must_be_immutable
class SortItem extends StatelessWidget {
  SortItem({
    super.key,
    this.isSelected,
    this.width,
    this.icon,
    required this.label,
  });

  bool? isSelected = false;
  final double? width;
  final Widget? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 30,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),
        color: isSelected == true ? ColorUiHelper.categoryTicketColor : ColorUiHelper.inputLightColor,
        boxShadow: [BoxShadow(color: isSelected == true ? ColorUiHelper.inputLightColor : ColorUiHelper.categoryTicketColor ,blurRadius: 5,spreadRadius: 0.5)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: icon ?? Container(),
          ),
          (isSelected == true || icon == null) ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label,style: isSelected == true ? TextStyleHelper.sortSelectedTextStyle : TextStyleHelper.sortTextStyle,),
          ) : Container()
        ],
      ),
    );
  }
}
