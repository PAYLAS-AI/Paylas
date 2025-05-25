import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/firebase_options.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/router/page_router.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/home/home_wrapper.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getitSetup();
  runApp(ProviderScope(child: const PaylasApp()));
}

class PaylasApp extends StatefulWidget {
  const PaylasApp({super.key});

  @override
  State<PaylasApp> createState() => _PaylasAppState();
}

class _PaylasAppState extends State<PaylasApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
        // ekran ölçüleri alınır.
    ScreenSizes().init(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paylas App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorUiHelper.mainTitleBlue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: PageRouter.onGenerateRoute,
      home: HomeWrapper(),
     
    );
  }
}
