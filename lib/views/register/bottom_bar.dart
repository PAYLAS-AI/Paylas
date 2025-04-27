import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class RegisterBottomBar extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  RegisterBottomBar({
    super.key,
    required this.nameController,
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
              onTap: () async {
                debugPrint("register");
                User? user = await _authService.register(
                    emailController.text.trim(), passwordController.text.trim(),
                    name: nameController.text);
                if (user != null) {
                  _authService.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Email dogrulama icin e-posta adresinizi kontrol ediniz")),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Kayıt başarısız! Bilgilerinizi kontrol edin.")),
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
