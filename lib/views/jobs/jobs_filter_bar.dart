import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/tools/text_controllers.dart';
import 'package:paylas/views/widgets/sort_bar.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/widgets/custom_text_input.dart';

class JobsFilterBar extends StatelessWidget {
   JobsFilterBar({
    super.key,
    required this.onChanged
  });

  final screen = locator<ScreenSizes>();
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      height: screen.height * 0.125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextInput(
            icon: CircleAvatar(
              backgroundColor: ColorUiHelper.categoryTicketColor,
              radius: 16,
              child: Icon(
                Icons.search,
                color: ColorUiHelper.mainSubtitleColor,
              ),
            ),
            label: "İşleri Arayın...",
            textController: TextControllerHelper.filterFieldController,
            contentPadding: EdgeInsets.only(bottom: 12),
            primaryColor: ColorUiHelper.inputLightColor,
            secondaryColor: ColorUiHelper.inputDarkColor,
            width: screen.width,
            height: 40,
            onChanged: onChanged,
          ),
    
          SortBar()
        ],
      ),
    );
  }
}