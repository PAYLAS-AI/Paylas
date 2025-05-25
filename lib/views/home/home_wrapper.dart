
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/auth/auth_service.dart';

import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/view_router/view_router.dart';

class HomeWrapper extends ConsumerWidget {
  final AuthService _authService = AuthService();

  HomeWrapper({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) return const LoginPage();
        return const ViewRouter();
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => LoginPage(),
    
    );
  
  }
}
