import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class ProfileCardHeader extends StatefulWidget {
  ProfileCardHeader({
    super.key,
  });

  @override
  State<ProfileCardHeader> createState() => _ProfileCardHeaderState();
}

class _ProfileCardHeaderState extends State<ProfileCardHeader> {
  final screen = locator<ScreenSizes>();
  final AuthService _authService = AuthService();
  late String? username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = _authService.getCurrentUserName().toString();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.85,
      height: screen.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48),
              topRight: Radius.circular(48)),
          gradient: LinearGradient(colors: [
            ColorUiHelper.profileGradiendPrimary,
            ColorUiHelper.transparent
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Paylaş",
            style: TextStyleHelper.categoryTitleStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: CircleAvatar(
              backgroundColor: ColorUiHelper.transparent,
              radius: 48,
              child: Image.asset(
                "assets/logo/logo4.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              username??"",
              style: TextStyleHelper.loginSubtitle2Style,
            ),
          ),
        ],
      ),
    );
  }
}
