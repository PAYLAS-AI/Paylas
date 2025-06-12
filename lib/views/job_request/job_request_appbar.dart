
import 'package:flutter/material.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class JobRequestAppBar{
  
  static PreferredSizeWidget? appBar() => AppBar(
            backgroundColor: ColorUiHelper.categoryTicketColor,
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
                    "İLAN İSTEKLERİ",
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
                icon: Icon(Icons.send_to_mobile_rounded,color: ColorUiHelper.mainSubtitleColor,),
                child: Text("Gönderilen",style: TextStyleHelper.jobRequestToolbarStyle,),
              ),
              Tab(
                icon: Icon(Icons.system_update_outlined,color: ColorUiHelper.mainSubtitleColor,),
                child: Text("Gelen",style: TextStyleHelper.jobRequestToolbarStyle,),
              )
            ]),
          );

}