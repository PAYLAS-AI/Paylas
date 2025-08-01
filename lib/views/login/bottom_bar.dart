import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class LoginBottomBar extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginBottomBar({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screen.width * 0.85,
        height: screen.height * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: ColorUiHelper.mainSubtitleColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  debugPrint("Forgot Password");
                },
                child: Text(
                  "Şifreni mi unuttun?",
                  style: TextStyleHelper.forgotPasswordTextStyle,
                )),
            InkWell(
              onTap: () async {
                debugPrint("Login");
                User? user = await _authService.signIn(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                if (user == null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Giriş başarısız! Bilgilerinizi kontrol edin.")),
                  );
                } else if (!_authService.isEmailVerified()) {
                  _authService.auth.signOut();
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text("Email dogrulamasi yapmaniz gerekmektedir.")),
                  );
                }
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
                    "Giriş Yap",
                    style: TextStyleHelper.loginButtonTextStyle,
                  ),
                ),
              ),
            ),
            Text(
              "Veya",
              style: TextStyleHelper.forgotPasswordTextStyle,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("RegisterPage");
              },
              borderRadius: BorderRadius.circular(32),
              child: Container(
                width: screen.width * 0.65,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: ColorUiHelper.inputLightColor,
                ),
                child: Center(
                  child: Text(
                    "Hesap Oluştur!",
                    style: TextStyleHelper.registerTextStyle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
