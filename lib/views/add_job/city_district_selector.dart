
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/cities_input.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class CityDistrictSelector extends ConsumerWidget {
  CityDistrictSelector({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCity = ref.watch(selectedCityProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // İl Dropdown
        Container(
          decoration: BoxDecoration(color: ColorUiHelper.mainSubtitleColor, borderRadius: BorderRadius.circular(32)),
          child: DropdownMenu<String>(
            hintText: "İl Seçiniz",
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: ColorUiHelper.mainTitleBlue)),
                fillColor: ColorUiHelper.mainSubtitleColor),
            width: screen.width * 0.6,
            menuHeight: screen.height * 0.4,
            onSelected: (value) {
              ref.read(selectedCityProvider.notifier).state = value;
              ref.read(selectedDistrictProvider.notifier).state = null;
            },
            dropdownMenuEntries: Cities.cities
                .map((city) => DropdownMenuEntry(value: city, label: city))
                .toList(),
          ),
        ),
        const SizedBox(height: 12),

        // İlçe Dropdown (seçilen ile göre filtrelenmiş)
        Container(
          decoration: BoxDecoration(color: ColorUiHelper.mainSubtitleColor, borderRadius: BorderRadius.circular(32)),
          child: DropdownMenu<String>(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: ColorUiHelper.mainTitleBlue)),
                fillColor: ColorUiHelper.mainSubtitleColor),
            hintText: "İlçe Seçiniz",
            width: screen.width * 0.6,
            menuHeight: screen.height * 0.4,
            enabled: selectedCity != null,
            onSelected: (value) {
              ref.read(selectedDistrictProvider.notifier).state = value;
            },
            dropdownMenuEntries:
                (Cities.district[selectedCity] ?? Cities.district["Ankara"])!
                    .map((district) =>
                        DropdownMenuEntry(value: district, label: district))
                    .toList(),
          ),
        ),
      ],
    );
  }
}
