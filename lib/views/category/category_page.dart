// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/category/category_button.dart';
import 'package:paylas/views/category/category_header.dart';
import 'package:paylas/views/category/subcategory_button.dart';


class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final screen = locator<ScreenSizes>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screen.width,
        height: screen.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CategoryButton(
                      labelText: "HİZMETLER",
                      onPressed: () {
                        debugPrint("hizmetler");
                      },
                    ),
                    CategoryButton(
                      labelText: "ÜRÜNLER",
                      onPressed: () {
                        debugPrint("ürünler");
                      },
                    ),
                    CategoryButton(
                      labelText: "EL BECERİSİ",
                      onPressed: () {
                        debugPrint("el becerisi");
                      },
                    ),
                    CategoryButton(
                      labelText: "USTALIK",
                      onPressed: () {
                        debugPrint("ustalık");
                      },
                    ),
                    CategoryButton(
                      labelText: "EĞİTİM",
                      onPressed: () {
                        debugPrint("eğitim");
                      },
                    ),
                    SubCategoryButton(
                      onPressed: () {
                        debugPrint("Sub category pressed");
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}