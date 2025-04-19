
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class RegisterBottomBar extends StatelessWidget {
  RegisterBottomBar({
    super.key,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screen.width * 0.85,
        height: screen.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: ColorUiHelper.mainSubtitleColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                // Kayıt işlemleri burada
                Navigator.of(context).pushNamed("HomePage");
              },
              borderRadius: BorderRadius.circular(32),
              child: Container(
                width: screen.width * 0.65,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: ColorUiHelper.inputDarkColor,
                    gradient: LinearGradient(
                        colors: [
                          ColorUiHelper.inputDarkColor,
                          ColorUiHelper.inputSecondDarkColor
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: Center(
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyleHelper.loginButtonTextStyle,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("LoginPage");
                },
                child: Text(
                  "Zaten hesabın var mı? Giriş Yap!",
                  style: TextStyleHelper.forgotPasswordTextStyle,
                )),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
