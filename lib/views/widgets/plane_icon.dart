import 'package:flutter/material.dart';

class PlaneIcon extends StatelessWidget {
  const PlaneIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 30,
      child: Image.asset("assets/logo/plane.png",fit: BoxFit.fitWidth,)
      );
  }
}
