
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/provider/all_providers.dart';

import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/view_router/view_router.dart';

class HomeWrapper extends ConsumerWidget {

  const HomeWrapper({super.key});

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
//asagidaki kod giydirme mantigi icin birakildi
// appUser.isBanned kontrol edilmeli !!!!!!!!!!!!!!!!!!!!!
// asagidaki kod giydirmek icin denedi fakat home_wrapper degistirilmis oldugu icin state hatasi alindi emulatorde
/*

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/models/user/app_user.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/user/user_service.dart';

import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/view_router/view_router.dart';

class HomeWrapper extends ConsumerWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) return const LoginPage();

        return FutureBuilder<AppUser>(
          future: UserService().getUser(user.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return const Scaffold(
                body: Center(child: Text("Bir hata oluştu.")),
              );
            }
            final appUser = snapshot.data!;
            if (appUser.isBanned) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Hesabınız banlanmıştır. Lütfen destek ekibiyle iletişime geçin.",
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              });
              FirebaseAuth.instance.signOut();
              return const LoginPage();

            }
            return const ViewRouter();
          },
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => const LoginPage(),
    );
  }
}

 */
