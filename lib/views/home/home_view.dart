import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/categoryby.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/home/category_box.dart';
import 'package:paylas/views/home/custom_appbar.dart';
import 'package:paylas/views/home/scroll_content.dart';
import 'package:paylas/views/jobs/job_box.dart';



class HomeView extends StatelessWidget {
  HomeView({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
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
              CustomAppBar(
                profileUrl:
                    "https://forum.shiftdelete.net/ekler/mh_hp_cizmeli_kedi_400x400-jpg.132558/",
              ),
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
                    ref.read(selectedCategoryProvider.notifier).state = CategoryBy.all;
                    Navigator.of(context).pushNamed("JobsPage");
                  },
                  widgetBuilder: JobBox(
                    imageUrl:
                        "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
                    title: "Köpek Gezdirme",
                    jobOwner: "Enes Bey",
                    score: 4.8,
                    onTap: () {
                      Navigator.of(context).pushNamed("DetailsPage");
                    },
                  ),
                  itemCount: 10,
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
                  widgetBuilder: Row(
                    children: [
                      CategoryBox(label: "Hizmetler", assetIconUrl: "assets/icon/categories/services.png"),
                      CategoryBox(label: "Ürünler", assetIconUrl: "assets/icon/categories/shopping.png"),
                      CategoryBox(label: "Eğitim", assetIconUrl: "assets/icon/categories/education.png"),
                      CategoryBox(label: "Ustalık", assetIconUrl: "assets/icon/categories/craftsmanship.png"),
                    ],
                  ),
                  itemCount: 1,
                ),
              ),
            ],
          ),
        ),
      );
  }
}




