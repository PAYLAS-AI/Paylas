
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/models/job_admin_control_request/job_admin_control_request.dart';
import 'package:paylas/models/model/categoryby.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/job_admin_control_request/job_admin_control_request_service.dart';
import 'package:paylas/services/storage/storage_service.dart';
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
  final adminService = locator<JobAdminControlRequestService>();
  final storageService = locator<StorageService>();

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
            imgUrl: "https://raw.githubusercontent.com/PAYLAS-AI/Paylas/refs/heads/main/assets/logo/logo2.jpg",
            description: TextControllerHelper.addJobDescriptionController.text,
            category: ref.read(currentCategoryProvider).name,
            ownerId: AuthService().auth.currentUser!.uid,
            ownerName: AuthService().auth.currentUser!.displayName!,
            createdDate: DateTime.now(),
            validityDate: ref.read(currentValidityDate)!,
            location: "${ref.read(selectedCityProvider)!}/${ref.read(selectedDistrictProvider)!}",
            price: int.parse(TextControllerHelper.addJobCostController.text)
          );
          final adminControlRequest = JobAdminControlRequest(jobId: newJob.id!, ownerId: newJob.ownerId,ownerName: newJob.ownerName, jobImgUrl: newJob.imgUrl, jobTitle: newJob.title);
          await jobService.addNewJob(newJob);
          debugPrint(newJob.id);
          storageService.uploadImage(ref.read(currentImageProvider) ,newJob.id!);
          adminService.addJobAdminControlRequest(adminControlRequest);
          ref.read(currentStepProvider.notifier).state = 0;
          ref.read(currentValidityDate.notifier).state = null;
          ref.read(currentImageProvider.notifier).state = File("");
          ref.read(currentCategoryProvider.notifier).state = CategoryBy.all;
          ref.read(selectedCityProvider.notifier).state = null;
          ref.read(selectedDistrictProvider.notifier).state = null;
          TextControllerHelper.resetAddJobTextControllers();
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
