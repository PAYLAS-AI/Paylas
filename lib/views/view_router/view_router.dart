

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/views/category/category_view.dart';
import 'package:paylas/views/home/home_view.dart';
import 'package:paylas/views/past_jobs/past_jobs_view.dart';
import 'package:paylas/views/profile/profile_view.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class ViewRouter extends ConsumerStatefulWidget {
  const ViewRouter({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ViewRouterState();
}


class _ViewRouterState extends ConsumerState<ViewRouter> {

  final JobService jobService = locator<JobService>();

  @override
  void initState() {
    super.initState();
    getJobs();
  }

  final views = [
    HomeView(),
    CategoryView(),
    PastJobsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    int selectedView = ref.watch(selectedNavigationIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: selectedView,
        children: views,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("AddJobPage");
        },
        backgroundColor: ColorUiHelper.categoryTicketColor,
        shape: CircleBorder(),
        elevation: 1,
        child: Icon(Icons.assignment_add,color: ColorUiHelper.mainSubtitleColor,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
            ref.read(selectedNavigationIndexProvider.notifier).state = value;
        },
        currentIndex: selectedView,
        elevation: 6,
        type: BottomNavigationBarType.fixed,
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

  void getJobs() async{
    ref.read(allJobsProvider.notifier).state = await jobService.getAllJobs();
  }

}