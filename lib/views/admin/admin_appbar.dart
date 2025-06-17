
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/views/admin/admin_request_counter.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class AdminAppbar{
  
  static PreferredSizeWidget? appBar(WidgetRef ref) => AppBar(
            backgroundColor: ColorUiHelper.categoryTicketColor,
            actions: [
              IconButton(
                    onPressed: () {
                      AuthService().signOut();
                    },
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(ColorUiHelper.detailReportColor)),
                    icon: Icon(
                      Icons.logout,
                      color: ColorUiHelper.mainSubtitleColor,
                    ))
            ],
            leading: CircleAvatar(
              backgroundColor: ColorUiHelper.transparent,
              radius: 28,
              child: Image.asset(
                "assets/logo/logo4.png",
                fit: BoxFit.cover,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Paylaş",
                  style: TextStyleHelper.jobRequestAppbarTitleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    "ADMİN PANELİ",
                    style: TextStyleHelper.jobRequestAppbarSubtitleStyle,
                  ),
                ),
              ],
            ),
            elevation: 6,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(bottom: 2),
              indicatorColor: ColorUiHelper.mainTitleYellow,
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
              Tab(
                icon: Icon(Icons.request_page_rounded,color: ColorUiHelper.mainSubtitleColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("İlan İstekleri",style: TextStyleHelper.jobRequestToolbarStyle,),
                    RequestCounter(requestCount: ref.watch(adminJobRequestsProvider).length,)
                  ],
                ),
              ),
              Tab(
                icon: Icon(Icons.report_sharp,color: ColorUiHelper.mainSubtitleColor,),
                child: Text("Şikayetler",style: TextStyleHelper.jobRequestToolbarStyle,),
              )
            ]),
          );

}

