import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/past_jobs/filter_bar.dart';
import 'package:paylas/views/past_jobs/past_job_box.dart';
import 'package:paylas/views/widgets/job_pages_header.dart';

class PastJobsPage extends StatelessWidget {
  PastJobsPage({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screen.width,
        height: screen.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
        child: Column(
          children: [
            JobsPagesHeader(
              iconAsset: "assets/icon/history.png",
              label: "Geçmiş İşlerim",
            ),
            FilterBar(),
            Flexible(
                child: ListView.separated(
                    itemBuilder: (context, index) => PastJobBox(
                          imageUrl:
                              "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
                          jobDate: "01/11/2024",
                          title: "Köpek Gezdirme",
                          jobOwner: "Enes",
                          location: "Öğretmenevi / Elazığ",
                          jobDuration: 2,
                          jobPrice: 140,
                          score: 4.8,
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 20,),
                    itemCount: 10))
          ],
        ),
      ),
    );
  }
}
