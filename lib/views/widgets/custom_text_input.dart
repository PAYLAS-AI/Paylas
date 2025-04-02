import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    super.key, required this.icon, required this.label, required this.textController, required this.primaryColor, required this.secondaryColor,
    this.isObscure = false
  });

  final screen = locator<ScreenSizes>();

  final Icon icon;
  final String label;
  final TextEditingController textController;
  final Color primaryColor;
  final Color secondaryColor;
  final bool isObscure;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.75,
      height: 50,
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
          icon: icon,
          border: InputBorder.none,
          labelText: label,
        ),
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        obscureText: isObscure,
      ),
    );
  }
}

