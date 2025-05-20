import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/tools/text_controllers.dart';
import 'package:paylas/views/home/home_wrapper.dart';
import 'package:paylas/views/login/bottom_bar.dart';
import 'package:paylas/views/login/input_bar.dart';
import 'package:paylas/views/widgets/login_header.dart';
import 'package:paylas/views/widgets/plane_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final screen = locator<ScreenSizes>();
  late final StreamSubscription<User?> _authListener;
  

  @override
  void initState() {

    super.initState();
    _authListener = FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        debugPrint(user.displayName.toString());

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeWrapper()),
          );
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: screen.width,
          height: screen.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg/2.png"),fit: BoxFit.fill)
          ),
          child: Stack(
            children: [
              Positioned(

                left: screen.width * 0.075,
                top: screen.height * 0.09,

                child: LoginHeader()
              ),

              LoginInputBar(
                emailController: TextControllerHelper.loginEmailController,
                passwordController: TextControllerHelper.loginPasswordController,
              ),

              LoginBottomBar(
                emailController: TextControllerHelper.loginEmailController,
                passwordController: TextControllerHelper.loginPasswordController,
              ),

              Positioned(
                top: 20,
                right: 50,
                child: PlaneIcon()
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    TextControllerHelper.resetLoginTextControllers();
    _authListener.cancel();
    super.dispose();
  }
}


