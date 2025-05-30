// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/admin/admin_appbar.dart';
import 'package:paylas/views/admin/create_job_request_box.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AdminAppbar.appBar(),
          body: TabBarView(
            children: [
              SizedBox(
                  width: screen.width,
                  height: screen.height,
                  child: ListView(
                    children: [
                      CrateJobRequest(
                        imageUrl:
                            "https://sukrudagli.com.tr/images/blog/sukrudagli_blog1.jpg",
                        title: "İngilizce Özel Dersi",
                        jobOwner: "Enes",
                      ),
                      CrateJobRequest(
                        imageUrl:
                            "https://www.isler.com.tr/panel/img//blog/25011304982334424694ayt-matematik-nasil-calisilir_900x520.jpg",
                        title:
                            "Matematik Özel Dersi Verilir",
                        jobOwner: "Ozan",
                      ),
                    ],
                  )),
              Center(
                child: Text("Gelen Şikayet Yok"),
              ),
            ],
          )),
    );
  }
}
