import 'dart:ffi';

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

class AddJobButton extends ConsumerStatefulWidget {
  const AddJobButton({super.key});

  @override
  ConsumerState<AddJobButton> createState() => _AddJobButtonState();
}

class _AddJobButtonState extends ConsumerState<AddJobButton> {
  final screen = locator<ScreenSizes>();
  final jobService = locator<JobService>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () async {
        final loadingNotifier = ref.read(addJobLoadingProvider.notifier);
        final currentContext = context;
        loadingNotifier.state = true;
        try {
          final newJob = Job(
            title: TextControllerHelper.addJobTitleController.text,
            description: TextControllerHelper.addJobDescriptionController.text,
            category: ref.read(currentCategoryProvider).name,
            ownerId: AuthService().auth.currentUser!.uid,
            ownerName: AuthService().auth.currentUser!.displayName!,
            createdDate: DateTime.now(),
            validityDate: DateTime.now(),
            location: TextControllerHelper.addJobLocationController.text,
            price: int.parse(TextControllerHelper.addJobCostController.text)
          );

          await jobService.addNewJob(newJob);

          // ignore: use_build_context_synchronously
          Navigator.of(currentContext).pop();
          
        } catch (e) {
          debugPrint("❌ HATA: $e");
        } finally {
          loadingNotifier.state = false;
        }
      },
      child: Container(
        width: screen.width * 0.65,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: ColorUiHelper.inputDarkColor,
            gradient: LinearGradient(colors: [
              ColorUiHelper.inputDarkColor,
              ColorUiHelper.inputSecondDarkColor
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
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
