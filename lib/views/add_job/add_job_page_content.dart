import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/add_job/add_job_form.dart';
import 'package:paylas/views/add_job/add_job_header.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class AddPageContent extends ConsumerWidget {
  AddPageContent({
    super.key,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(addJobLoadingProvider);
    return Container(
      width: screen.width,
      height: screen.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
      child: SafeArea(
        child: Column(
          children: [
            AddJobHeader(),
            Flexible(
                child: Stack(children: [
              AddJobForm(),
              isLoading
                  ? Container(
                      width: screen.width,
                      height: screen.height,
                      color:
                          ColorUiHelper.homePageSecondShadow.withOpacity(0.5),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: ColorUiHelper.mainTitleYellow,
                      )))
                  : Container()
            ])),
          ],
        ),
      ),
    );
  }
}
