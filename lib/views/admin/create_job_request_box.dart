
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/admin/admin_procces_button.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class CrateJobRequest extends StatelessWidget {
  CrateJobRequest({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.jobOwner,
  });

  final screen = locator<ScreenSizes>();
  final String imageUrl;
  final String title;
  final String jobOwner;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height * 0.15,
      margin: EdgeInsets.only(bottom: 8, top: 8),
      decoration:
          BoxDecoration(color: ColorUiHelper.inputLightColor, boxShadow: [
        BoxShadow(
            color: ColorUiHelper.categoryTicketColor,
            blurRadius: 1,
            spreadRadius: 0.1,
            offset: Offset(1, 1))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                  width: (screen.width - 20) / 3.2,
                  height: screen.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              AdminProccessButton(
                bgColor: ColorUiHelper.mainSubtitleColor,
                label: "DETAY",
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: ColorUiHelper.productTitleColor,
                  size: 26,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: (screen.width - 20) / 1.5,
                    height: 55,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.adminJobRequestTitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: (screen.width - 20) / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "İlan Sahibi :",
                        style: TextStyleHelper.adminJobRequestTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: (screen.width - 20) / 2.8,
                        child: Text(
                          " $jobOwner",
                          style: TextStyleHelper.adminJobRequestSecondTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: Row(
                    children: [
                      AdminProccessButton(
                        bgColor: ColorUiHelper.adminCheckColor,
                        label: "ONAYLA",
                        icon: Icon(
                          Icons.check_outlined,
                          color: ColorUiHelper.mainSubtitleColor,
                          size: 26,
                        ),
                        labelStyle: TextStyleHelper.adminButtonsSecondTextStyle,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      AdminProccessButton(
                        bgColor: ColorUiHelper.adminRejectColor,
                        label: "REDDET",
                        icon: Icon(
                          Icons.close_outlined,
                          color: ColorUiHelper.mainSubtitleColor,
                          size: 26,
                        ),
                        labelStyle: TextStyleHelper.adminButtonsSecondTextStyle,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
