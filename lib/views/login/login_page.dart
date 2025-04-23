import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/home/home_wrapper.dart';
import 'package:paylas/views/login/bottom_bar.dart';
import 'package:paylas/views/login/input_bar.dart';
import 'package:paylas/views/widgets/login_header.dart';
import 'package:paylas/views/widgets/plane_icon.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final screen = locator<ScreenSizes>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // Kullanıcı zaten giriş yapmış, direkt HomePage'e yönlendir
        WidgetsBinding.instance.addPostFrameCallback((_) {
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
                emailController: emailController,
                passwordController: passwordController,
              ),

              LoginBottomBar(
                emailController: emailController,
                passwordController: passwordController,
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
}


