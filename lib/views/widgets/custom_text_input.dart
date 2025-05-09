import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    super.key, required this.icon, required this.label, required this.textController, required this.primaryColor, required this.secondaryColor,
    this.isObscure = false,
    this.width, this.height, this.contentPadding

  });

  final screen = locator<ScreenSizes>();

  final Widget icon;
  final String label;
  final TextEditingController textController;
  final Color primaryColor;
  final Color secondaryColor;
  final bool isObscure;
  final double? width;
  final double? height;
  final EdgeInsets? contentPadding;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? screen.width * 0.75,
      height: height ?? 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: primaryColor,
        border: Border.all(color: secondaryColor,)
      ),
      padding: EdgeInsets.only(
        left: 6,
        right: 6
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: contentPadding,
          icon: icon,
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyleHelper.inputTextStyle
        ),
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        obscureText: isObscure,
      ),
    );
  }
}

