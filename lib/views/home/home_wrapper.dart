
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paylas/services/auth/auth_service.dart';

import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/view_router/view_router.dart';

class HomeWrapper extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (!snapshot.hasData) {
          return LoginPage();
        }

        return ViewRouter();
      },
    );
  }
}
