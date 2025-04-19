

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/views/category/category_view.dart';
import 'package:paylas/views/home/home_view.dart';
import 'package:paylas/views/past_jobs/past_jobs_view.dart';
import 'package:paylas/views/profile/profile_view.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class ViewRouter extends ConsumerWidget {

  ViewRouter({super.key});

  final views = [
    HomeView(),
    CategoryView(),
    PastJobsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedView = ref.watch(selectedNavigationIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: selectedView,
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
            ref.read(selectedNavigationIndexProvider.notifier).state = value;
        },
        currentIndex: selectedView,
        elevation: 1,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyleHelper.bottomNavigationTextStyle,
        selectedItemColor: ColorUiHelper.categoryTicketColor,
  // home - jobs - past jobs - profile      
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: ColorUiHelper.bottomDeactiveIcon,),activeIcon: Icon(Icons.home,color: ColorUiHelper.categoryTicketColor,), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined,color: ColorUiHelper.bottomDeactiveIcon,),activeIcon: Icon(Icons.category,color: ColorUiHelper.categoryTicketColor,), label: "Kategoriler"),
          BottomNavigationBarItem(icon: Icon(Icons.work_history_outlined,color: ColorUiHelper.bottomDeactiveIcon,),activeIcon: Icon(Icons.work_history,color: ColorUiHelper.categoryTicketColor,), label: "Geçmişim"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,color: ColorUiHelper.bottomDeactiveIcon,),activeIcon: Icon(Icons.account_circle,color: ColorUiHelper.categoryTicketColor,), label: "Hesabım"),
        ],
      ),
    );
  }
}