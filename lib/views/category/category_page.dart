


import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screen.width,
        height: screen.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg/2.png"),fit: BoxFit.fill)
        ),
        child: Stack(
          children: [
          ],
        ),
      ),
    );
  }
}


