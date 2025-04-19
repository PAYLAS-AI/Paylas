
import 'package:flutter/material.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({
    super.key,
    required this.score,
  });
  final double score;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/icon/star2.png")),
        SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/icon/star2.png")),
        SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/icon/star2.png")),
        SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/icon/star2.png")),
        SizedBox(
          width: 10,
        ),
        Text(
          "$score",
          style: TextStyleHelper.detailSubtitleTextStyle,
        ),
      ],
    );
  }
}
