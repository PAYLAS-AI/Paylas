// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/categoryby.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/category/category_button.dart';
import 'package:paylas/views/category/category_header.dart';
import 'package:paylas/views/category/subcategory_button.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

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
        child: Stack(
          children: [
            Positioned(
              top: screen.height * 0.05,
              child: CategoryHeader(),
            ),
            Positioned(
              top: screen.height * 0.22,
              child: SizedBox(
                width: screen.width,
                height: screen.height * 0.6,
                child: Consumer(
                  builder: (context, ref, child) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CategoryButton(
                        labelText: "HİZMETLER",
                        onPressed: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              CategoryBy.services;
                          Navigator.of(context).pushNamed("JobsPage");
                        },
                      ),
                      CategoryButton(
                        labelText: "ÜRÜNLER",
                        onPressed: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              CategoryBy.shoppings;
                          Navigator.of(context).pushNamed("JobsPage");
                        },
                      ),
                      CategoryButton(
                        labelText: "EL BECERİSİ",
                        onPressed: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              CategoryBy.handicrafts;
                          Navigator.of(context).pushNamed("JobsPage");
                        },
                      ),
                      CategoryButton(
                        labelText: "USTALIK",
                        onPressed: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              CategoryBy.craftsmanship;
                          Navigator.of(context).pushNamed("JobsPage");
                        },
                      ),
                      CategoryButton(
                        labelText: "EĞİTİM",
                        onPressed: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              CategoryBy.education;
                          Navigator.of(context).pushNamed("JobsPage");
                        },
                      ),
                      SubCategoryButton(
                        onPressed: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              CategoryBy.all;
                          Navigator.of(context).pushNamed("JobsPage");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
