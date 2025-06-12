
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class AdminProccessButton extends StatelessWidget {
  AdminProccessButton({
    super.key,
    required this.label,
    required this.icon,
    required this.bgColor,
    this.onPressed,
    this.labelStyle
  });

  final screen = locator<ScreenSizes>();
  final String label;
  final Widget icon;
  final Color bgColor;
  final TextStyle? labelStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: (screen.width - 20) / 3.2,
        height: screen.height * 0.04,
        margin: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: bgColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 4,
            ),
            Text(
              label,
              style: labelStyle ?? TextStyleHelper.adminButtonsTextStyle,
              
            )
          ],
        ),
      ),
    );
  }
}
