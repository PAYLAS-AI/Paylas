import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/router/page_router.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/details/job_details_page.dart';
import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: ColorUiHelper.mainTitleBlue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: PageRouter.onGenerateRoute,
      home: JobDetailsPage(),

    );
  }
}
