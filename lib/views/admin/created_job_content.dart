
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/admin/create_job_request_box.dart';

class CreatedJobContent extends StatelessWidget {
  CreatedJobContent({
    super.key,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: screen.width,
        height: screen.height,
        child: ListView(
          children: [
            CreatedJobRequestCard(
              imageUrl:
                  "https://sukrudagli.com.tr/images/blog/sukrudagli_blog1.jpg",
              title: "İngilizce Özel Dersi",
              jobOwner: "Enes",
            ),
            CreatedJobRequestCard(
              imageUrl:
                  "https://www.isler.com.tr/panel/img//blog/25011304982334424694ayt-matematik-nasil-calisilir_900x520.jpg",
              title:
                  "Matematik Özel Dersi Verilir",
              jobOwner: "Ozan",
            ),
          ],
        ));
  }
}
