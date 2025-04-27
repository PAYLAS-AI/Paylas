import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/register/bottom_bar.dart';
import 'package:paylas/views/register/input_bar.dart';
import 'package:paylas/views/widgets/login_header.dart';
import 'package:paylas/views/widgets/plane_icon.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final screen = locator<ScreenSizes>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screen.width,
          height: screen.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
          child: Stack(
            children: [
              Positioned(
                  left: screen.width * 0.075,
                  top: screen.height * 0.09,
                  child: LoginHeader()),
              RegisterInputBar(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
              RegisterBottomBar(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
              Positioned(top: 20, right: 50, child: PlaneIcon())
            ],
          ),
        ),
      ),
    );
  }
}
