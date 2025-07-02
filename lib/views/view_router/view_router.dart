import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/models/past_job/past_job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/past_job/past_job_service.dart';
import 'package:paylas/views/category/category_view.dart';
import 'package:paylas/views/home/home_view.dart';
import 'package:paylas/views/past_jobs/past_jobs_view.dart';
import 'package:paylas/views/profile/owner_profile/profile_view.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class ViewRouter extends ConsumerStatefulWidget {
  const ViewRouter({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ViewRouterState();
}

class _ViewRouterState extends ConsumerState<ViewRouter> {
  final JobService jobService = locator<JobService>();
  final PastJobService pastJobService = locator<PastJobService>();

  @override
  void initState() {
    super.initState();
    getJobs();
    getPastJobs();
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
      resizeToAvoidBottomInset: false,
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
        child: Icon(
          Icons.assignment_add,
          color: ColorUiHelper.mainSubtitleColor,
        ),
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
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: ColorUiHelper.bottomDeactiveIcon,
              ),
              activeIcon: Icon(
                Icons.home,
                color: ColorUiHelper.categoryTicketColor,
              ),
              label: "Anasayfa"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
                color: ColorUiHelper.bottomDeactiveIcon,
              ),
              activeIcon: Icon(
                Icons.category,
                color: ColorUiHelper.categoryTicketColor,
              ),
              label: "Kategoriler"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.work_history_outlined,
                color: ColorUiHelper.bottomDeactiveIcon,
              ),
              activeIcon: Icon(
                Icons.work_history,
                color: ColorUiHelper.categoryTicketColor,
              ),
              label: "Geçmişim"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: ColorUiHelper.bottomDeactiveIcon,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: ColorUiHelper.categoryTicketColor,
              ),
              label: "Hesabım"),
        ],
      ),
    );
  }

  void getJobs() async {
    ref.read(allJobsProvider.notifier).state = await jobService.getAllJobs();
  }

  void getPastJobs() async {
    List<PastJob> pastJobs = await pastJobService
        .getPastJobsByUser(AuthService().auth.currentUser!.uid);
    ref.read(pastJobsProvider.notifier).state = pastJobs;

    if(getMostCommonCategory(pastJobs) != '' && ref.read(allJobsProvider).isNotEmpty){
      ref.read(allJobsProvider.notifier).state = prioritizeCategories(ref.read(allJobsProvider), [getMostCommonCategory(pastJobs)]);
    }
    
  }

  String getMostCommonCategory(List<PastJob> jobs) {
    final Map<String, int> categoryCount = {};

    for (var job in jobs) {
      categoryCount[job.category] = (categoryCount[job.category] ?? 0) + 1;
    }

    // En çok geçen kategoriyi bul
    String mostCommonCategory = '';
    int maxCount = 0;

    // ignore: avoid_types_as_parameter_names
    categoryCount.forEach((category, count) {
      if (count > maxCount) {
        maxCount = count;
        mostCommonCategory = category;
      }
    });

    return mostCommonCategory;
  }

  List<Job> prioritizeCategories(
      List<Job> jobs, List<String> priorityCategories) {
    final prioritized = <Job>[];
    final others = <Job>[];

    for (var job in jobs) {
      if (priorityCategories.contains(job.category)) {
        prioritized.add(job);
      } else {
        others.add(job);
      }
    }

    return [...prioritized, ...others];
  }
}
