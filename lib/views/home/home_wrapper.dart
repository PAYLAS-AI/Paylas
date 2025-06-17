import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/model/userType.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/user/user_service.dart';
import 'package:paylas/views/admin/admin_page.dart';

import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/view_router/view_router.dart';

class HomeWrapper extends ConsumerWidget {
  HomeWrapper({super.key});
  final UserService userService = locator<UserService>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (user) {
        if (user == null) return const LoginPage();
        return FutureBuilder(
          future: userService.getUser(user.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // ignore: unrelated_type_equality_checks
              if (snapshot.data!.userType == Usertype.admin.name) {
                return AdminPage();
              } else {
                return ViewRouter();
              }
            } else if (snapshot.hasError) {
              return LoginPage();
            } else {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        );
        //const ViewRouter();
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => LoginPage(),
    );
  }
}
