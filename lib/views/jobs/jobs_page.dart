import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/jobs/job_box.dart';
import 'package:paylas/views/jobs/jobs_filter_bar.dart';
import 'package:paylas/views/widgets/job_pages_header.dart';

class JobsPage extends StatelessWidget {
  JobsPage({super.key});

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
              iconAsset: "assets/icon/jobs.png",
              label: "Hizmetler",
            ),
            JobsFilterBar(),
            
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(10, (index) => JobBox(
                imageUrl: "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
                title: "Köpek Gezdirme",
                jobOwner: "Enes",
                score: 4.8,
              )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
