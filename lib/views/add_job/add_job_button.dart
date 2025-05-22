
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/tools/text_controllers.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class AddJobButton extends ConsumerWidget {
  AddJobButton({
    super.key,
  });

  final screen = locator<ScreenSizes>();
  final jobService = locator<JobService>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () async{
        final loadingNotifier = ref.read(addJobLoadingProvider.notifier);
        Job newJob = Job(title: TextControllerHelper.addJobTitleController.text, description: TextControllerHelper.addJobDescriptionController.text, category: ref.read(currentCategoryProvider).name , ownerId: AuthService().auth.currentUser!.uid, createdDate: DateTime.now() , validityDate: DateTime.now(), location: TextControllerHelper.addJobLocationController.text);
        loadingNotifier.state = true;
        await jobService.addNewJob(newJob);
        loadingNotifier.state = false;
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      },
      child: Container(
        width: screen.width * 0.65,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: ColorUiHelper.inputDarkColor,
            gradient: LinearGradient(
                colors: [
                  ColorUiHelper.inputDarkColor,
                  ColorUiHelper.inputSecondDarkColor
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Center(
          child: Text(
            "İlan Oluştur!",
            style: TextStyleHelper.loginButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

