// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/job_request/job_request_appbar.dart';
import 'package:paylas/views/job_request/sended_card.dart';

class JobRequestPage extends StatelessWidget {
  JobRequestPage({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: JobRequestAppBar.appBar(),
          body: TabBarView(
            children: [
              SizedBox(
                width: screen.width,
                height: screen.height,
                  child: ListView(
                children: [
                  SendedCard(
                    imageUrl:
                        "https://sukrudagli.com.tr/images/blog/sukrudagli_blog1.jpg",
                    title: "İngilizce Özel Dersi",
                    jobOwner: "Enes",
                    location: "Hatay",
                    jobDuration: 5,
                    jobDate: "13/05/25",
                    requestResponse: "Bekleniyor",
                    jobPrice: 1250,
                  ),
                  SendedCard(
                    imageUrl:
                        "https://www.isler.com.tr/panel/img//blog/25011304982334424694ayt-matematik-nasil-calisilir_900x520.jpg",
                    title: "Matematik Özel Dersi",
                    jobOwner: "Ozan",
                    location: "Elazığ/öğretmenevi",
                    jobDuration: 3,
                    jobDate: "11/02/25",
                    requestResponse: "Bekleniyor",
                    jobPrice: 560,
                  ),
                ],
              )),
              Center(
                child: Text("Gelen İstek Yok"),
              ),
            ],
          )),
    );
  }
}
