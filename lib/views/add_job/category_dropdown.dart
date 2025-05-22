import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/model/categoryby.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

// ignore: must_be_immutable
class CategoryDropdown extends ConsumerWidget {
  CategoryDropdown({
    super.key,
  });
  final screen = locator<ScreenSizes>();



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: ColorUiHelper.inputLightColor,
        ),
        child: DropdownMenu(
            onSelected: (value) {
              ref.read(currentCategoryProvider.notifier).state = value!;
              debugPrint("Kategori seçildi: $value");
            },
            width: screen.width * 0.75,
            hintText: "Kategori",
            leadingIcon: Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 2, top: 2),
              child: Image.asset(
                "assets/icon/category.png",
                height: 20,
              ),
            ),
            textStyle: TextStyleHelper.dropdownTextStyle,
            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(ColorUiHelper.inputLightColor),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
            ),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none)),
            dropdownMenuEntries: [
              DropdownMenuEntry(
                style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyleHelper.dropdownTextStyle),side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorUiHelper.inputDarkColor,))),
                value: CategoryBy.services,
                label: "Hizmetler",
                leadingIcon: Image.asset(
                  "assets/icon/categories/services.png",
                  height: 25,
                ),
              ),
              DropdownMenuEntry(
                style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyleHelper.dropdownTextStyle),side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorUiHelper.inputDarkColor,))),
                value: CategoryBy.shoppings,
                label: "Ürünler",
                leadingIcon: Image.asset(
                  "assets/icon/categories/shopping.png",
                  height: 25,
                ),
              ),
              DropdownMenuEntry(
                style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyleHelper.dropdownTextStyle),side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorUiHelper.inputDarkColor,))),
                value: CategoryBy.handicrafts,
                label: "El Becerisi",
                leadingIcon: Image.asset(
                  "assets/icon/categories/handicrafts.png",
                  height: 25,
                ),
              ),
              DropdownMenuEntry(
                style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyleHelper.dropdownTextStyle),side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorUiHelper.inputDarkColor,))),
                value: CategoryBy.craftsmanship,
                label: "Ustalık",
                leadingIcon: Image.asset(
                  "assets/icon/categories/craftsmanship.png",
                  height: 25,
                ),
              ),
              DropdownMenuEntry(
                style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyleHelper.dropdownTextStyle),side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorUiHelper.inputDarkColor,))),
                value: CategoryBy.education,
                label: "Eğitim",
                leadingIcon: Image.asset(
                  "assets/icon/categories/education.png",
                  height: 25,
                ),
              ),
            ]));
  }
}

