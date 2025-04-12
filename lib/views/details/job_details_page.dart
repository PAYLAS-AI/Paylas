// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/details/details_card.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class JobDetailsPage extends StatelessWidget {
  JobDetailsPage({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screen.width,
        height: screen.height,
        child: Stack(
          children: [
            Container(
              width: screen.width,
              height: screen.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg"),
                    fit: BoxFit.fill),
              ),
            ),
            JobDetails(
              title: "Köpek Gezdirme",
              favoriteCount: 13,
              jobOwner: "Enes Bey",
              score: 4.8,
              description:
                  "Evcil köpeğimiz pamuğu 2 saat gezdirecek birini arıyoruz. Çok uysaldır ve yönlendirmeleri dinler. İş yoğunluğundan dolayı bu işi yapacak birini arıyorum.",
              location: " Öğretmenevi bulvar / Elazığ",
              jobDuration: 3,
              jobPrice: 100,
            ),
            Positioned(
              left: 30,
              child: Container(
                height: screen.height * 0.18,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icon/v-ticket.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Paylaş",
                      style: TextStyleHelper.categoryTitleStyle,
                    ),
                    Image.asset(
                      "assets/logo/logo4.png",
                      height: screen.height * 0.075,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
