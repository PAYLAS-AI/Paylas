import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/model/categoryby.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/home/category_box.dart';
import 'package:paylas/views/home/custom_appbar.dart';
import 'package:paylas/views/home/scroll_content.dart';
import 'package:paylas/views/jobs/job_box.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class HomeView extends ConsumerWidget {
  HomeView({super.key});

  final screen = locator<ScreenSizes>();
  final jobService = locator<JobService>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.watch(allJobsProvider);
    return Container(
      width: screen.width,
      height: screen.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            Flexible(
              child: SizedBox(
                height: 25,
              ),
            ),
            Consumer(
              builder: (context, ref, child) => ScrollContent(
                height: screen.height * 0.3 + 40,
                labelIconAssetUrl: "assets/icon/advert.png",
                label: "Aktif İlanlar",
                onPressed: () {
                  ref.read(selectedCategoryProvider.notifier).state =
                      CategoryBy.all;
                  Navigator.of(context).pushNamed("JobsPage");
                },
                widgetBuilder: jobService.allJobs.isEmpty ? Center(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorUiHelper.homePageSecondShadow,
                                      blurRadius: 5,
                                      spreadRadius: 5)
                                ]),
                            child: Text(
                              "İş İlanı Yok!",
                              style: TextStyleHelper.pastJobsEmptyStyle,
                            )),
                      ) : ListView.separated(
                  itemBuilder: (context, index) => JobBox(
                    imageUrl:
                        "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
                    title: jobService.allJobs[index].title,
                    jobOwner: "${jobService.allJobs[index].ownerName} Bey",
                    score: 4.8,
                    onTap: () {
                      ref.read(detailsPageCurrentJobProvider.notifier).state =
                          jobService.allJobs[index];
                      Navigator.of(context).pushNamed("DetailsPage");
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 2,
                  ),
                  itemCount: jobService.allJobs.length > 10
                      ? 10
                      : (jobService.allJobs.isEmpty ? 1 : jobService.allJobs.length),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 25,
              ),
            ),
            Consumer(
              builder: (context, ref, child) => ScrollContent(
                height: screen.height * 0.25,
                labelIconAssetUrl: "assets/icon/category.png",
                label: "Daha Fazla Kategori",
                onPressed: () {
                  ref.read(selectedNavigationIndexProvider.notifier).state = 1;
                },
                widgetBuilder: ListView.separated(
                  itemBuilder: (context, index) => Row(
                    children: [
                      CategoryBox(
                          label: "Hizmetler",
                          assetIconUrl: "assets/icon/categories/services.png"),
                      CategoryBox(
                          label: "Ürünler",
                          assetIconUrl: "assets/icon/categories/shopping.png"),
                      CategoryBox(
                          label: "Eğitim",
                          assetIconUrl: "assets/icon/categories/education.png"),
                      CategoryBox(
                          label: "Ustalık",
                          assetIconUrl:
                              "assets/icon/categories/craftsmanship.png"),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 2,
                  ),
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
