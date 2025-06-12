import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/widgets/custom_text_input.dart';

class LoginInputBar extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginInputBar({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: screen.width,
          height: screen.height * 0.20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextInput(
                maxLine: 1,
                label: "E-mail",
                icon: Icon(Icons.email_outlined),
                textController: emailController,
                primaryColor: ColorUiHelper.inputLightColor,
                secondaryColor: ColorUiHelper.inputDarkColor,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextInput(
                maxLine: 1,
                label: "Şifre",
                icon: Icon(Icons.lock),
                textController: passwordController,
                primaryColor: ColorUiHelper.inputLightColor,
                secondaryColor: ColorUiHelper.inputDarkColor,
                isObscure: true,
              ),
            ],
          ),
        ));
  }
}
