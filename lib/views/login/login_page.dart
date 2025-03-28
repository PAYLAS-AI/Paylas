

import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: screen.width,
          height: screen.height,
          child: Stack(
            children: [
              Container(
                width: screen.width * 0.85,
                height: screen.height * 0.24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  gradient: LinearGradient(colors: [Colors.grey.shade600.withValues(alpha: 0.6) , Colors.transparent],begin: Alignment.topCenter, end: Alignment.bottomCenter)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Paylaş", style:  TextStyleHelper.loginTitleStyle,)
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}