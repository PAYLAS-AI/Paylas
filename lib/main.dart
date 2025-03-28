import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/login/login_page.dart';

void main() {
 
  getitSetup();
  runApp(const PaylasApp());
}

class PaylasApp extends StatelessWidget {
  const PaylasApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ekran ölçüleri alınır.
    ScreenSizes().init(context);
    return MaterialApp(
      title: 'Paylas App',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),

    );
  }
}
