import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/widgets/custom_text_input.dart';

class AddJobCustomInput extends StatelessWidget {
  AddJobCustomInput({
    super.key,
    required this.iconAssetUrl,
    required this.inputLabel,
    required this.hintText,
    required this.textController,
    required this.height,
    required this.maxLine,
  });

  final screen = locator<ScreenSizes>();
  final String iconAssetUrl;
  final String inputLabel;
  final String hintText;
  final TextEditingController textController;
  final double height;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: ColorUiHelper.homePageSecondShadow.withAlpha(100),
            blurRadius: 10)
      ]),
      child: CustomTextInput(
        label: hintText,
        //icon: Icon(Icons.email_outlined),
        textController: textController,
        primaryColor: ColorUiHelper.inputLightColor,
        secondaryColor: ColorUiHelper.inputDarkColor,
        width: screen.width - 16,
        borderRadius: BorderRadius.circular(8),
        height: height,
        maxLine: maxLine,
      ),
    );
  }
}

